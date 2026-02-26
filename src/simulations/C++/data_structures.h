#include "Eigen/Core"
using Eigen::Vector2d, Eigen::Vector;

using StateMatrix = Eigen::Matrix<double, 2, Eigen::Dynamic>;

struct StateConditions {
  StateMatrix stateMatrix;
  StateMatrix referenceMatrix;
  Vector2d errorMatrix;
  Vector2d controlMatrix;
  StateMatrix velocityErrorMatrix;
  StateMatrix distanceErrorMatrix;
  StateMatrix deltaReference;
  double time = 0;

  explicit StateConditions(int timeSteps)
      : stateMatrix(StateMatrix::Zero(2, timeSteps)),
        referenceMatrix(StateMatrix::Zero(2, timeSteps)),
        velocityErrorMatrix(StateMatrix::Zero(2, timeSteps)),
        distanceErrorMatrix(StateMatrix::Zero(2, timeSteps)),
        deltaReference(StateMatrix::Zero(2, timeSteps - 1)) {}
};

struct InternalConditions {
  double alpha = 1;
  double beta = 100;
  double lambda = 0.3;
  double gamma = 20;
  double B = 1.0;
  double D = 0.072;
  Vector2d g{0, lambda};
};

struct SimSettings {
  int timeSteps = 45000; // Number of time steps in the simulation(milliseconds)
  double timeHorizon = 45; // Total simulated time in seconds
  double tau = this->timeHorizon / this->timeSteps; // Time step size
};
