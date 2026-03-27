#include "../cstr_dynamics.h"
#include <cmath>
#include <iostream>

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

  defendedSystemFunction(settings, stateConditions, internalConditions);

  for (int i = 0; i < settings.timeSteps; ++i) {
    const double x1 = stateConditions.stateMatrix(0, i);
    const double x2 = stateConditions.stateMatrix(1, i);
    if (!std::isfinite(x1) || !std::isfinite(x2)) {
      std::cerr << "non-finite defended state at step " << i << ": x1=" << x1
                << " x2=" << x2 << std::endl;
      return 1;
    }
  }

  return 0;
}
