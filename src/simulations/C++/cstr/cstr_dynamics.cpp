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
  std::normal_distribution<double> epsilon(0.0, 2);
  std::default_random_engine randomNumberGenerator;

  for (int i = 1; i < settings.timeSteps; i++) {
    prevX1 = &stateConditions.stateMatrix(0, i - 1);
    prevX2 = &stateConditions.stateMatrix(1, i - 1);
    x1Ref = &stateConditions.referenceMatrix(0, i);
    x2Ref = &stateConditions.referenceMatrix(1, i);

    double e2 = *prevX2 - stateConditions.referenceMatrix(1, i - 1);
    stateConditions.x2ErrorMatrix(1, i) = *x2Ref - *prevX2;
    stateConditions.x1ErrorMatrix(0, i) = *x1Ref - *prevX1;

    double noise = epsilon(randomNumberGenerator);

    // x1 open-loop natural dynamics
    stateConditions.stateMatrix(0, i) =
        *prevX1 +
        settings.tau *
            (-internalConditions.alpha * *prevX1 +
             internalConditions.Da * (1 - *prevX1) *
                 exp(*prevX2 / (1 + *prevX2 / internalConditions.gamma)));

    // x2 closed-loop dynamics with additive noise on error channel
    deltaR2 = &stateConditions.deltaReference(1, i - 1);
    stateConditions.stateMatrix(1, i) =
        *prevX2 +
        settings.tau * (-internalConditions.beta * sgn(e2 + noise) + *deltaR2);

    stateConditions.time = i * settings.tau;
  }
}

void defendedSystemFunction(SimSettings &settings,
                            StateConditions &stateConditions,
                            InternalConditions &internalConditions) {
  double *prevX1, *prevX2, *x1Ref, *x2Ref, *deltaR2;
  std::normal_distribution<double> attackNoise(0.0, 2);
  std::default_random_engine randomNumberGenerator;

  for (int i = 1; i < settings.timeSteps; i++) {
    prevX1 = &stateConditions.stateMatrix(0, i - 1);
    prevX2 = &stateConditions.stateMatrix(1, i - 1);
    x1Ref = &stateConditions.referenceMatrix(0, i);
    x2Ref = &stateConditions.referenceMatrix(1, i);

    double e2 = *prevX2 - stateConditions.referenceMatrix(1, i - 1);
    stateConditions.x2ErrorMatrix(1, i) = *x2Ref - *prevX2;
    stateConditions.x1ErrorMatrix(0, i) = *x1Ref - *prevX1;

    // n=3 parallel processing units computing error independently
    // Clean units are ideal (no noise), corrupted unit has σ²_a = 4
    double e2_ch1 = e2;
    double e2_ch2 = e2;
    double e2_ch3 = e2 + attackNoise(randomNumberGenerator);

    // Pairwise disagreement: V_ij = (e_i - e_j)^2
    double v12 = (e2_ch1 - e2_ch2) * (e2_ch1 - e2_ch2);
    double v13 = (e2_ch1 - e2_ch3) * (e2_ch1 - e2_ch3);
    double v23 = (e2_ch2 - e2_ch3) * (e2_ch2 - e2_ch3);

    // Select minimum-variance pair and average
    double e2_hat;
    if (v12 <= v13 && v12 <= v23) {
      e2_hat = (e2_ch1 + e2_ch2) / 2.0;
    } else if (v13 <= v23) {
      e2_hat = (e2_ch1 + e2_ch3) / 2.0;
    } else {
      e2_hat = (e2_ch2 + e2_ch3) / 2.0;
    }

    // x1 open-loop natural dynamics (unchanged)
    stateConditions.stateMatrix(0, i) =
        *prevX1 +
        settings.tau *
            (-internalConditions.alpha * *prevX1 +
             internalConditions.Da * (1 - *prevX1) *
                 exp(*prevX2 / (1 + *prevX2 / internalConditions.gamma)));

    // x2 closed-loop dynamics with defended error, clean deltaReference
    deltaR2 = &stateConditions.deltaReference(1, i - 1);
    stateConditions.stateMatrix(1, i) =
        *prevX2 +
        settings.tau * (-internalConditions.beta * sgn(e2_hat) + *deltaR2);

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
