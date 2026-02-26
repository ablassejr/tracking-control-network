#include "cxxplot/window.hpp"
#include "state_space.h"
#include <Eigen/Dense>
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
    systemFunction(settings, stateConditions, internalConditions);

    for (auto state : stateConditions.stateMatrix.colwise()) {
      velStateVector.push_back(state(0));
      disStateVector.push_back(state(1));
    }

    auto vel =
        cxxplot::plot(timeVector, velStateVector, window_title_ = "Velocity",
                      show_legend_ = true, name_ = "State x(k)",
                      xlabel_ = "Time (s)", ylabel_ = "Velocity");
    vel.add_graph(timeVector, velRefVector, name_ = "Reference r(k)");

    auto dis =
        cxxplot::plot(timeVector, disStateVector, window_title_ = "Distance",
                      show_legend_ = true, name_ = "State x(k)",
                      xlabel_ = "Time (s)", ylabel_ = "Distance");
    dis.add_graph(timeVector, disRefVector, name_ = "Reference r(k)");

    return 0;
  });
}
