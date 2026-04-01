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
  std::vector<double> e1Vector, e2Vector;

  for (int i = 0; i < settings.timeSteps; i++) {
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

  attackedSystemFunction(settings, stateConditions, internalConditions);

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
  std::ofstream outFile("cstr_tracking_error_attacked_cpp_output.log");
  outFile << "Execution time: "
          << static_cast<double>(duration.count()) / 1000000 << " seconds"
          << std::endl;

  std::ofstream csv("cstr_tracking_error_attacked_cpp_output.csv");
  csv << std::setprecision(15);
  for (int i = 0; i < settings.timeSteps; i++) {
    csv << i * settings.tau << "," << e1Vector[i] << "," << e2Vector[i] << "\n";
  }

  return 0;
}
