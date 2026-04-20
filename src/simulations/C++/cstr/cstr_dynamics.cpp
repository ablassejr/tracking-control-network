#include "cstr_dynamics.h"
#include <cmath>
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
  double *prevX1, *prevX2, *x1Ref, *x2Ref, *deltaR2;
  std::normal_distribution<double> epsilon(0.0, 0.5);
  std::default_random_engine randomNumberGenerator;
  double noise;

  for (int i = 1; i < settings.timeSteps; i++) {
    prevX1 = &stateConditions.stateMatrix(0, i - 1);
    prevX2 = &stateConditions.stateMatrix(1, i - 1);
    x1Ref = &stateConditions.referenceMatrix(0, i);
    x2Ref = &stateConditions.referenceMatrix(1, i);

    double e2 = *prevX2 - stateConditions.referenceMatrix(1, i - 1);
    stateConditions.x2ErrorMatrix(1, i) = *x2Ref - *prevX2;
    stateConditions.x1ErrorMatrix(0, i) = *x1Ref - *prevX1;

    do {
      noise = epsilon(randomNumberGenerator);
    } while (std::abs(noise) >= 0.5);

    // x1 open-loop natural dynamics
    stateConditions.stateMatrix(0, i) =
        *prevX1 +
        settings.tau *
            (-internalConditions.alpha * *prevX1 +
             internalConditions.Da * (1 - *prevX1) *
                 exp(*prevX2 / (1 + *prevX2 / internalConditions.gamma)));

    // x2 closed-loop dynamics with additive noise on sgn output
    deltaR2 = &stateConditions.deltaReference(1, i - 1);
    stateConditions.stateMatrix(1, i) =
        *prevX2 + settings.tau *
                      (-internalConditions.beta * (sgn(e2) + noise) + *deltaR2);

    stateConditions.time = i * settings.tau;
  }
}

void defendedSystemFunction(SimSettings &settings,
                            StateConditions &stateConditions,
                            InternalConditions &internalConditions) {
  double *prevX1, *prevX2, *x1Ref, *x2Ref, *deltaR2;
  std::normal_distribution<double> attackNoise(0.0, 0.5);
  std::default_random_engine randomNumberGenerator;
  double noise;

  for (int i = 1; i < settings.timeSteps; i++) {
    prevX1 = &stateConditions.stateMatrix(0, i - 1);
    prevX2 = &stateConditions.stateMatrix(1, i - 1);
    x1Ref = &stateConditions.referenceMatrix(0, i);
    x2Ref = &stateConditions.referenceMatrix(1, i);

    double e2 = *prevX2 - stateConditions.referenceMatrix(1, i - 1);
    stateConditions.x2ErrorMatrix(1, i) = *x2Ref - *prevX2;
    stateConditions.x1ErrorMatrix(0, i) = *x1Ref - *prevX1;

    // Additive noise (sigma=0.5) on sgn output, then rounding defense
    double s_clean = sgn(e2);
    do {
      noise = attackNoise(randomNumberGenerator);
    } while (std::abs(noise) >= 0.5);
    double s_noisy = s_clean + noise;

    // Rounding defense (eq:rounding_defense): recover sgn(e) from noisy output
    int s_hat;
    if (s_noisy > 0.5) {
      s_hat = 1;
    } else if (s_noisy < -0.5) {
      s_hat = -1;
    } else {
      s_hat = 0;
    }

    // x1 open-loop natural dynamics (unchanged)
    stateConditions.stateMatrix(0, i) =
        *prevX1 +
        settings.tau *
            (-internalConditions.alpha * *prevX1 +
             internalConditions.Da * (1 - *prevX1) *
                 exp(*prevX2 / (1 + *prevX2 / internalConditions.gamma)));

    // x2 closed-loop dynamics with defended sgn output
    deltaR2 = &stateConditions.deltaReference(1, i - 1);
    stateConditions.stateMatrix(1, i) =
        *prevX2 + settings.tau * (-internalConditions.beta * s_hat + *deltaR2);

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
