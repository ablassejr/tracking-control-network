#pragma once

#include "Eigen/Core"
#include <cassert>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>
using Eigen::Vector2d, Eigen::Vector;

using StateMatrix = Eigen::Matrix<double, 2, Eigen::Dynamic>;

inline Eigen::VectorXd loadCSV(const std::string &filepath) {
  std::ifstream file(filepath);
  assert(file.is_open() && "Failed to open CSV file");
  std::vector<double> values;
  std::string line;
  while (std::getline(file, line)) {
    std::istringstream ss(line);
    std::string token;
    while (std::getline(ss, token, ','))
      values.push_back(std::stod(token));
  }
  Eigen::VectorXd result(values.size());
  for (size_t i = 0; i < values.size(); ++i)
    result(i) = values[i];
  return result;
}

inline void results_validation(const std::string &matlab_csv,
                               const Eigen::VectorXd &cpp_result,
                               double tolerance = 1e-12) {
  auto matlab_data = loadCSV(matlab_csv);
  double max_error = (cpp_result - matlab_data).cwiseAbs().maxCoeff();
  assert(max_error < tolerance && "C++ result diverges from MATLAB");
}

struct StateConditions {
  StateMatrix stateMatrix;
  StateMatrix referenceMatrix;
  Vector2d errorMatrix;
  Vector2d controlMatrix;
  StateMatrix x1ErrorMatrix;
  StateMatrix x2ErrorMatrix;
  StateMatrix deltaReference;
  double time = 0;

  explicit StateConditions(int timeSteps)
      : stateMatrix(StateMatrix::Zero(2, timeSteps)),
        referenceMatrix(StateMatrix::Zero(2, timeSteps)),
        x1ErrorMatrix(StateMatrix::Zero(2, timeSteps)),
        x2ErrorMatrix(StateMatrix::Zero(2, timeSteps)),
        deltaReference(StateMatrix::Zero(2, timeSteps - 1)) {}
};

struct InternalConditions {
  double alpha = 1;
  double beta = 100;
  double lambda = 0.3;
  double gamma = 20;
  double B = 1.0;
  double Da = 0.072;
  Vector2d g{0, lambda};
};

struct SimSettings {
  int timeSteps = 45000; // Number of time steps in the simulation(milliseconds)
  double timeHorizon = 45; // Total simulated time in seconds
  double tau = this->timeHorizon / this->timeSteps; // Time step size
};
