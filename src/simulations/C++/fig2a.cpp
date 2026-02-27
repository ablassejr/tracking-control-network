#include "cxxplot/window.hpp"
#include "downsample.h"
#include "state_space.h"
#include <Eigen/Dense>
#include <chrono>
#include <cxxplot/cxxplot>
#include <fstream>
#include <vector>

using namespace cxxplot::named_parameters;
int main(int argc, char *argv[]) {
  return cxxplot::exec(argc, argv, []() {
    // Initialize simulation settings and state conditions
    SimSettings settings;
    StateConditions stateConditions(settings.timeSteps);
    InternalConditions internalConditions;
    std::vector<double> timeVector, velStateVector, disStateVector,
        velRefVector, disRefVector;

    // Initialize reference trajectories and time vector
    for (int i = 0; i < settings.timeSteps; i++) {
      timeVector.push_back(i * settings.tau);
      stateConditions.referenceMatrix(0, i) =
          i > 15000 && i < 30000 ? 0.7646 : 0.4472;
      stateConditions.referenceMatrix(1, i) =
          i > 15000 && i < 30000 ? 4.7052 : 2.7520;
      velRefVector.push_back(i > 15000 && i < 30000 ? 0.7646 : 0.4472);
      disRefVector.push_back(i > 15000 && i < 30000 ? 4.7052 : 2.7520);
    }

    // Calculate delta reference for error calculations
    stateConditions.deltaReference =
        stateConditions.referenceMatrix.rightCols(settings.timeSteps - 1) -
        stateConditions.referenceMatrix.leftCols(settings.timeSteps - 1);

    stateConditions.stateMatrix(0, 0) = 0.0;
    stateConditions.stateMatrix(1, 0) = 0.0;

    // Run the simulation
    auto start = std::chrono::high_resolution_clock::now();
    systemFunction(settings, stateConditions, internalConditions);
    auto end = std::chrono::high_resolution_clock::now();

    for (auto state : stateConditions.stateMatrix.colwise()) {
      velStateVector.push_back(state(0));
      disStateVector.push_back(state(1));
    }

    std::vector<double> tVel, velDs, tVelRef, velRefDs;
    downsample(timeVector, velStateVector, tVel, velDs);
    downsample(timeVector, velRefVector, tVelRef, velRefDs);

    std::vector<double> tDis, disDs, tDisRef, disRefDs;
    downsample(timeVector, disStateVector, tDis, disDs);
    downsample(timeVector, disRefVector, tDisRef, disRefDs);

    auto duration =
        std::chrono::duration_cast<std::chrono::microseconds>(end - start);
    std::ofstream outFile("fig2a_cpp_output.log");
    outFile << "Execution time: "
            << static_cast<double>(duration.count()) / 1000000 << " seconds"
            << std::endl;

    auto vel = cxxplot::plot(tVel, velDs, window_title_ = "Velocity",
                             show_legend_ = true, name_ = "x1",
                             xlabel_ = "Time (s)", ylabel_ = "x1, r1");
    vel.add_graph(tVelRef, velRefDs, name_ = "r1");

    auto dis = cxxplot::plot(tDis, disDs, window_title_ = "Distance",
                             show_legend_ = true, name_ = "x2",
                             xlabel_ = "Time (s)", ylabel_ = "x2, r2");
    dis.add_graph(tDisRef, disRefDs, name_ = "r2");

    return 0;
  });
}
