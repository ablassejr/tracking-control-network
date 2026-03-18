#include "../simulation_types.h"
void systemFunction(SimSettings &settings, StateConditions &stateConditions,
                    InternalConditions &internalConditions);

void attackedSystemFunction(SimSettings &settings,
                            StateConditions &stateConditions,
                            InternalConditions &internalConditions);

void controller(StateConditions &stateConditions,
                const InternalConditions &internalConditions,
                const int &iteration, double &x1Control, double &x2Control);
template <typename T> int sgn(const T &val);
