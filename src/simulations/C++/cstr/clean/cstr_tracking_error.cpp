#include "../plot_downsample.h"
#include "cstr_dynamics.h"
#include <Eigen/Dense>
#include <chrono>
#include <fstream>
#include <matplot/matplot.h>
#include <vector>

int main() {
  SimSettings settings;
  StateConditions stateConditions(settings.timeSteps);
  InternalConditions internalConditions;
  std::vector<double> timeVector, e1Vector, e2Vector;

  for (int i = 0; i < settings.timeSteps; i++) {
    timeVector.push_back(i * settings.tau);
    stateConditions.referenceMatrix(0, i) =
        i > 15000 && i < 30000 ? 0.7646 : 0.4472;
    stateConditions.referenceMatrix(1, i) =
        i > 15000 && i < 30000 ? 4.7052 : 2.7520;
  }

  stateConditions.deltaReference =
      stateConditions.referenceMatrix.rightCols(settings.timeSteps - 1) -
      stateConditions.referenceMatrix.leftCols(settings.timeSteps - 1);

  stateConditions.stateMatrix(0, 0) = 0.0;
  stateConditions.stateMatrix(1, 0) = 0.0;

  systemFunction(settings, stateConditions, internalConditions);

  // Compute tracking errors at each timestep
  auto start = std::chrono::high_resolution_clock::now();
  for (int i = 0; i < settings.timeSteps; i++) {
    e1Vector.push_back(stateConditions.stateMatrix(0, i) -
                       stateConditions.referenceMatrix(0, i));
    e2Vector.push_back(stateConditions.stateMatrix(1, i) -
                       stateConditions.referenceMatrix(1, i));
  }
  auto end = std::chrono::high_resolution_clock::now();

  auto duration =
      std::chrono::duration_cast<std::chrono::microseconds>(end - start);
  std::ofstream outFile("cstr_tracking_error_cpp_output.log");
  outFile << "Execution time: "
          << static_cast<double>(duration.count()) / 1000000 << " seconds"
          << std::endl;

  std::vector<double> tE1, e1Ds, tE2, e2Ds;
  downsample(timeVector, e1Vector, tE1, e1Ds);
  downsample(timeVector, e2Vector, tE2, e2Ds);

  // Plot 1: Tracking Error e1
  auto f1 = matplot::figure(true);
  matplot::plot(tE1, e1Ds);
  matplot::title("Tracking Error e1");
  matplot::xlabel("Time (s)");
  matplot::ylabel("e1");

  // Plot 2: Tracking Error e2
  auto f2 = matplot::figure(true);
  matplot::plot(tE2, e2Ds);
  matplot::title("Tracking Error e2");
  matplot::xlabel("Time (s)");
  matplot::ylabel("e2");

  matplot::show();
  return 0;
}
