#include <iostream>

int main() {
  std::cout << "This is Figure 2a." << std::endl;
  // *** initial conditions ***
  long x(0);  // concentration
  float y(0); // temperature
  int t(0);   // time

  // *** Simulation Parameters ***
  int n(45000), tmax(45); // number of iterations, max time(in seconds)
  float dt(float(tmax) / float(n)); // time step

  float r1(0), r2(0);           // reference signals
  float e1(x - r1), e2(y - r2); // tracking errors

  // *** Main Simulation Loop ***
  for (int i = 0; i < n; ++i) {
    t = t + dt; // update time
  }
  return 0;
}
