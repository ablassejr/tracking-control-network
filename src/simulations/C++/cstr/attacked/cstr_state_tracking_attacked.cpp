#include "../plot_downsample.h"
#include "cstr_dynamics.h"
#include <Eigen/Dense>
#include <chrono>
#include <fstream>
#include <iomanip>
#include <matplot/matplot.h>
#include <vector>

int main() {
  // Initialize simulation settings and state conditions
  SimSettings settings;
  StateConditions stateConditions(settings.timeSteps);
  InternalConditions internalConditions;
  std::vector<double> timeVector, x1StateVector, x2StateVector, x1RefVector,
      x2RefVector;

  // Initialize reference trajectories and time vector
  // Index 0 stays at zero (matching MATLAB's r1(1)=0, r2(1)=0)
  timeVector.push_back(0.0);
  x1RefVector.push_back(0.0);
  x2RefVector.push_back(0.0);
  for (int i = 1; i < settings.timeSteps; i++) {
    timeVector.push_back(i * settings.tau);
    stateConditions.referenceMatrix(0, i) =
        i > 15000 && i < 30000 ? 0.7646 : 0.4472;
    stateConditions.referenceMatrix(1, i) =
        i > 15000 && i < 30000 ? 4.7052 : 2.7520;
    x1RefVector.push_back(i > 15000 && i < 30000 ? 0.7646 : 0.4472);
    x2RefVector.push_back(i > 15000 && i < 30000 ? 4.7052 : 2.7520);
  }

  // Calculate delta reference for error calculations
  stateConditions.deltaReference =
      stateConditions.referenceMatrix.rightCols(settings.timeSteps - 1) -
      stateConditions.referenceMatrix.leftCols(settings.timeSteps - 1);

  const int numRuns = 1;
  Eigen::MatrixXd stateSum = Eigen::MatrixXd::Zero(2, settings.timeSteps);
  std::ofstream outFile("cpp_attacked_output.log");

  for (int run = 0; run < numRuns; run++) {
    stateConditions.stateMatrix.setZero();
    stateConditions.stateMatrix(0, 0) = 0.0;
    stateConditions.stateMatrix(1, 0) = 0.0;

    auto start = std::chrono::high_resolution_clock::now();
    attackedSystemFunction(settings, stateConditions, internalConditions);
    auto end = std::chrono::high_resolution_clock::now();

    auto duration =
        std::chrono::duration_cast<std::chrono::microseconds>(end - start);
    outFile << "Execution time: "
            << static_cast<double>(duration.count()) / 1000000 << " seconds"
            << std::endl;

    stateSum += stateConditions.stateMatrix;
  }

  Eigen::MatrixXd stateAvg = stateSum / numRuns;

  std::ofstream csv("cstr_state_tracking_attacked_cpp_output.csv");
  csv << std::setprecision(15);
  for (int i = 0; i < settings.timeSteps; i++) {
    double t = i * settings.tau;
    double e1 = stateAvg(0, i) - stateConditions.referenceMatrix(0, i);
    double e2 = stateAvg(1, i) - stateConditions.referenceMatrix(1, i);
    csv << t << "," << stateAvg(0, i) << "," << stateAvg(1, i) << ","
        << stateConditions.referenceMatrix(0, i) << ","
        << stateConditions.referenceMatrix(1, i) << "," << e1 << "," << e2
        << "\n";
  }

  for (int i = 0; i < settings.timeSteps; i++) {
    x1StateVector.push_back(stateAvg(0, i));
    x2StateVector.push_back(stateAvg(1, i));
  }

  std::vector<double> tX1, x1Ds, tX1Ref, x1RefDs;
  downsample(timeVector, x1StateVector, tX1, x1Ds);
  downsample(timeVector, x1RefVector, tX1Ref, x1RefDs);

  std::vector<double> tX2, x2Ds, tX2Ref, x2RefDs;
  downsample(timeVector, x2StateVector, tX2, x2Ds);
  downsample(timeVector, x2RefVector, tX2Ref, x2RefDs);

  // Plot 1: Conversion (x1)
  auto f1 = matplot::figure(true);
  matplot::hold(matplot::on);
  matplot::plot(tX1, x1Ds)->display_name("x1");
  matplot::plot(tX1Ref, x1RefDs)->display_name("r1");
  matplot::hold(matplot::off);
  matplot::title("Conversion");
  matplot::xlabel("Time (s)");
  matplot::ylabel("x1, r1");
  matplot::legend();

  // Plot 2: Temperature (x2)
  auto f2 = matplot::figure(true);
  matplot::hold(matplot::on);
  matplot::plot(tX2, x2Ds)->display_name("x2");
  matplot::plot(tX2Ref, x2RefDs)->display_name("r2");
  matplot::hold(matplot::off);
  matplot::title("Temperature");
  matplot::xlabel("Time (s)");
  matplot::ylabel("x2, r2");
  matplot::legend();

  matplot::show();
  return 0;
}
