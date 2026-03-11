#include "state_space.h"
#include <cmath>
#include <cxxplot/cxxplot>
#include <random>

void systemFunction(SimSettings &settings, StateConditions &stateConditions,
                    InternalConditions &internalConditions) {
  // Pre Simulation Variable Declarations
  double *prevX1, *prevX2, *x1Ref, *x2Ref, *deltaR2;

  // Simulation loop
  for (int i = 1; i < settings.timeSteps; i++) {
    prevX1 = &stateConditions.stateMatrix(0, i - 1);
    prevX2 = &stateConditions.stateMatrix(1, i - 1);
    x1Ref = &stateConditions.referenceMatrix(0, i);
    x2Ref = &stateConditions.referenceMatrix(1, i);

    // Error Update
    double e2 = *prevX2 - stateConditions.referenceMatrix(1, i - 1);
    stateConditions.x2ErrorMatrix(1, i) = *x2Ref - *prevX2;
    stateConditions.x1ErrorMatrix(0, i) = *x1Ref - *prevX1;

    // x1 open-loop natural dynamics
    stateConditions.stateMatrix(0, i) =
        *prevX1 +
        settings.tau *
            (-internalConditions.alpha * *prevX1 +
             internalConditions.Da * (1 - *prevX1) *
                 exp(*prevX2 / (1 + *prevX2 / internalConditions.gamma)));

    // x2 closed-loop dynamics with control
    deltaR2 = &stateConditions.deltaReference(1, i - 1);
    stateConditions.stateMatrix(1, i) =
        *prevX2 +
        settings.tau * (-internalConditions.beta * sgn(e2) + *deltaR2);

    stateConditions.time = i * settings.tau;
  }
}

void attackedSystemFunction(SimSettings &settings,
                            StateConditions &stateConditions,
                            InternalConditions &internalConditions) {
  // Pre Simulation Variable Declarations
  double *prevX1, *prevX2, *x1Ref, *x2Ref, *deltaR2;
  std::normal_distribution<double> noise(0.0, 2);
  std::default_random_engine randomNumberGenerator;

  // Simulation loop
  for (int i = 1; i < settings.timeSteps; i++) {
    prevX1 = &stateConditions.stateMatrix(0, i - 1);
    prevX2 = &stateConditions.stateMatrix(1, i - 1);
    x1Ref = &stateConditions.referenceMatrix(0, i);
    x2Ref = &stateConditions.referenceMatrix(1, i);
    // Error Update
    double e2 = *prevX2 - stateConditions.referenceMatrix(1, i - 1);
    stateConditions.x2ErrorMatrix(1, i) = *x2Ref - *prevX2;
    stateConditions.x1ErrorMatrix(0, i) = *x1Ref - *prevX1;

    // x1 open-loop natural dynamics
    stateConditions.stateMatrix(0, i) =
        *prevX1 +
        settings.tau *
            (-internalConditions.alpha * *prevX1 +
             internalConditions.Da * (1 - *prevX1) *
                 exp(*prevX2 / (1 + *prevX2 / internalConditions.gamma)));

    // x2 closed-loop dynamics with control
    deltaR2 = &stateConditions.deltaReference(1, i - 1);
    stateConditions.stateMatrix(1, i) =
        *prevX2 +
        settings.tau * (-internalConditions.beta * sgn(e2) + *deltaR2) +
        (settings.tau * noise(randomNumberGenerator));

    stateConditions.time = i * settings.tau;
  }
}

void controller(StateConditions &stateConditions,
                const InternalConditions &internalConditions,
                const int &iteration, double &x1Control, double &x2Control) {
  x1Control = 0;
  double *x2Error = &stateConditions.stateMatrix(1, iteration);
  double *x2Ref = &stateConditions.referenceMatrix(1, iteration);
  double *x2 = &stateConditions.stateMatrix(1, iteration);
  double *deltaReference = &stateConditions.deltaReference(1, iteration - 1);

  x2Control = (-1 / internalConditions.g(1)) *
              ((-internalConditions.beta * sgn<double>(*x2Error)) +
               (*deltaReference) - *x2);
}

template <typename T> int sgn(const T &val) {
  return (T(0) < val) - (val < T(0));
}
