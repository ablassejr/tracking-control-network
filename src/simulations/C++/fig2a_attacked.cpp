#include "cxxplot/window.hpp"
#include "downsample.h"
#include "state_space.h"
#include <Eigen/Dense>
#include <chrono>
#include <cxxplot/cxxplot>
#include <fstream>
#include <iomanip>
#include <vector>

using namespace cxxplot::named_parameters;
int main(int argc, char *argv[]) {
  return cxxplot::exec(argc, argv, []() {
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

    stateConditions.stateMatrix(0, 0) = 0.0;
    stateConditions.stateMatrix(1, 0) = 0.0;

    // Run the simulation
    auto start = std::chrono::high_resolution_clock::now();
    attackedSystemFunction(settings, stateConditions, internalConditions);
    auto end = std::chrono::high_resolution_clock::now();

    auto duration =
        std::chrono::duration_cast<std::chrono::microseconds>(end - start);
    std::ofstream outFile("cpp_attacked_output.log");
    outFile << "Execution time: "
            << static_cast<double>(duration.count()) / 1000000 << " seconds"
            << std::endl;

    std::ofstream csv("fig2a_attacked_cpp_output.csv");
    csv << std::setprecision(15);
    for (int i = 0; i < settings.timeSteps; i++) {
      double t = i * settings.tau;
      double e1 = stateConditions.stateMatrix(0, i) -
                  stateConditions.referenceMatrix(0, i);
      double e2 = stateConditions.stateMatrix(1, i) -
                  stateConditions.referenceMatrix(1, i);
      csv << t << "," << stateConditions.stateMatrix(0, i) << ","
          << stateConditions.stateMatrix(1, i) << ","
          << stateConditions.referenceMatrix(0, i) << ","
          << stateConditions.referenceMatrix(1, i) << "," << e1 << "," << e2
          << "\n";
    }

    for (auto state : stateConditions.stateMatrix.colwise()) {
      x1StateVector.push_back(state(0));
      x2StateVector.push_back(state(1));
    }

    std::vector<double> tX1, x1Ds, tX1Ref, x1RefDs;
    downsample(timeVector, x1StateVector, tX1, x1Ds);
    downsample(timeVector, x1RefVector, tX1Ref, x1RefDs);

    std::vector<double> tX2, x2Ds, tX2Ref, x2RefDs;
    downsample(timeVector, x2StateVector, tX2, x2Ds);
    downsample(timeVector, x2RefVector, tX2Ref, x2RefDs);

    auto x1Plot = cxxplot::plot(tX1, x1Ds, window_title_ = "Conversion",
                                show_legend_ = true, name_ = "x1",
                                xlabel_ = "Time (s)", ylabel_ = "x1, r1");
    x1Plot.add_graph(tX1Ref, x1RefDs, name_ = "r1");

    auto x2Plot = cxxplot::plot(tX2, x2Ds, window_title_ = "Temperature",
                                show_legend_ = true, name_ = "x2",
                                xlabel_ = "Time (s)", ylabel_ = "x2, r2");
    x2Plot.add_graph(tX2Ref, x2RefDs, name_ = "r2");

    return 0;
  });
}
