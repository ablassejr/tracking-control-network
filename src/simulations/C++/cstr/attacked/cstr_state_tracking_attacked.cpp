#include "cstr_dynamics.h"
#include <Eigen/Dense>
#include <chrono>
#include <fstream>
#include <iomanip>

int main() {
  SimSettings settings;
  StateConditions stateConditions(settings.timeSteps);
  InternalConditions internalConditions;

  for (int i = 1; i < settings.timeSteps; i++) {
    stateConditions.referenceMatrix(0, i) =
        i > 15000 && i < 30000 ? 0.7646 : 0.4472;
    stateConditions.referenceMatrix(1, i) =
        i > 15000 && i < 30000 ? 4.7052 : 2.7520;
  }

  stateConditions.deltaReference =
      stateConditions.referenceMatrix.rightCols(settings.timeSteps - 1) -
      stateConditions.referenceMatrix.leftCols(settings.timeSteps - 1);

  std::ofstream outFile("cpp_attacked_output.log");

  stateConditions.stateMatrix.setZero();

  auto start = std::chrono::high_resolution_clock::now();
  attackedSystemFunction(settings, stateConditions, internalConditions);
  auto end = std::chrono::high_resolution_clock::now();

  auto duration =
      std::chrono::duration_cast<std::chrono::microseconds>(end - start);
  outFile << "Execution time: "
          << static_cast<double>(duration.count()) / 1000000 << " seconds"
          << std::endl;

  std::ofstream csv("cstr_state_tracking_attacked_cpp_output.csv");
  csv << std::setprecision(15);
  for (int i = 0; i < settings.timeSteps; i++) {
    double t = i * settings.tau;
    double e1 = stateConditions.stateMatrix(0, i) - stateConditions.referenceMatrix(0, i);
    double e2 = stateConditions.stateMatrix(1, i) - stateConditions.referenceMatrix(1, i);
    csv << t << "," << stateConditions.stateMatrix(0, i) << "," << stateConditions.stateMatrix(1, i) << ","
        << stateConditions.referenceMatrix(0, i) << ","
        << stateConditions.referenceMatrix(1, i) << "," << e1 << "," << e2
        << "\n";
  }

  return 0;
}
