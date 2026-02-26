#include "state_space.h"
#include <chrono>
#include <cmath>
#include <cxxplot/cxxplot>
#include <fstream>

void systemFunction(SimSettings &settings, StateConditions &stateConditions,
                    InternalConditions &internalConditions) {
  // Variable definitions
  // StateMatrix stateMatrix(settings.timeSteps);
  auto start = std::chrono::high_resolution_clock::now();
  // Simulation loop
  for (int i = 1; i < settings.timeSteps; i++) {
    double prevVelocity = stateConditions.stateMatrix(0, i - 1);
    double prevDistance = stateConditions.stateMatrix(1, i - 1);
    double velocityReference = stateConditions.referenceMatrix(0, i);
    double distanceReference = stateConditions.referenceMatrix(1, i);

    // Error Update
    double e2 = prevDistance - stateConditions.referenceMatrix(1, i - 1);
    stateConditions.distanceErrorMatrix(1, i) =
        distanceReference - prevDistance;
    stateConditions.velocityErrorMatrix(0, i) =
        velocityReference - prevVelocity;

    // x1 (velocity): g1=0, no control possible — open-loop natural dynamics
    stateConditions.stateMatrix(0, i) =
        prevVelocity +
        settings.tau * (-internalConditions.alpha * prevVelocity +
                        internalConditions.D * (1 - prevVelocity) *
                            exp(prevDistance /
                                (1 + prevDistance / internalConditions.gamma)));

    // x2 (distance): closed-loop feedback-linearizing control
    // u2 = (1/g2)*(-f2(x) + dr2 - beta*sgn(e2))
    // => x2(k+1) = x2(k) + tau*(-beta*sgn(e2) + deltaR2)  [f2 cancels]
    double deltaR2 = stateConditions.deltaReference(1, i - 1);
    stateConditions.stateMatrix(1, i) =
        prevDistance +
        settings.tau * (-internalConditions.beta * sgn(e2) + deltaR2);

    stateConditions.time = i * settings.tau;
  }

  auto end = std::chrono::high_resolution_clock::now(); //  End Stopwatch
  auto duration = std::chrono::duration_cast<std::chrono::microseconds>(
      end - start); // Calculation Elapsed Time
  std::ofstream outFile("cpp_output.log");
  outFile << "Execution time: "
          << static_cast<double>(duration.count()) / 1000000 << " seconds"
          << std::endl;
}

StateMatrix *controller(StateConditions &stateConditions,
                        const InternalConditions &internalConditions,
                        const int &iteration, double &velocityControl,
                        double &distanceControl) {
  velocityControl = 0;
  double *distanceError = &stateConditions.stateMatrix(1, iteration);
  double *distanceReference = &stateConditions.referenceMatrix(1, iteration);
  double *distance = &stateConditions.stateMatrix(1, iteration);
  double *deltaReference = &stateConditions.deltaReference(1, iteration - 1);

  distanceControl = (-1 / internalConditions.g(1)) *
                    ((-internalConditions.beta * sgn<double>(*distanceError)) +
                     (*deltaReference) - *distance);
  return &stateConditions.stateMatrix;
}

template <typename T> int sgn(const T &val) {
  return (T(0) < val) - (val < T(0));
}
