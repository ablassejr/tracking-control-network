#include "cstr_dynamics.h"
#include <Eigen/Dense>
#include <chrono>
#include <fstream>
#include <iomanip>
#include <vector>

int main() {
  SimSettings settings;
  StateConditions stateConditions(settings.timeSteps);
  InternalConditions internalConditions;
  std::vector<double> timeVector, controlVector;

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

  // Compute control input u at each timestep
  auto start = std::chrono::high_resolution_clock::now();
  for (int i = 0; i < settings.timeSteps - 1; i++) {
    double x = stateConditions.stateMatrix(0, i);
    double y = stateConditions.stateMatrix(1, i);
    double r2i = stateConditions.referenceMatrix(1, i);
    double deltaR2 = stateConditions.deltaReference(1, i);
    double f2 =
        y + settings.tau *
                (-internalConditions.alpha * y +
                 internalConditions.B * internalConditions.Da * (1 - x) *
                     std::exp(y / (1 + y / internalConditions.gamma)));
    double e2 = y - r2i;
    double S = (e2 > 0) ? 1.0 : (e2 < 0 ? -1.0 : 0.0);
    controlVector.push_back(-(1.0 / internalConditions.lambda) *
                            (-internalConditions.beta * S + deltaR2 - f2));
  }

  auto end = std::chrono::high_resolution_clock::now();
  auto duration =
      std::chrono::duration_cast<std::chrono::microseconds>(end - start);
  std::ofstream outFile("cstr_control_input_cpp_output.log");
  outFile << "Execution time: "
          << static_cast<double>(duration.count()) / 1000000 << " seconds"
          << std::endl;

  std::ofstream csv("cstr_control_input_cpp_output.csv");
  csv << std::setprecision(15);
  for (int i = 0; i < settings.timeSteps - 1; i++) {
    csv << i * settings.tau << "," << controlVector[i] << "\n";
  }

  return 0;
}
