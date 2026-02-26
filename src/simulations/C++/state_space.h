#include "data_structures.h"
#include <cxxplot/cxxplot>
void systemFunction(SimSettings &settings, StateConditions &stateConditions,
                    InternalConditions &internalConditions);

void controller(StateConditions &stateConditions,
                const InternalConditions &internalConditions);
template <typename T> int sgn(const T &val);
