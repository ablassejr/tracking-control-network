#include <cmath>
#include <fstream>
#include <iostream>
#include <vector>

int main() {
  std::cout << "Fig2a - State Tracking Performance for CSTR Sliding Mode Control"
            << std::endl;

  // ==================== Initial Conditions ====================
  std::vector<double> x(1, 0.0); // Initial concentration (x1)
  std::vector<double> t(1, 0.0); // Initial time
  std::vector<double> y(1, 0.0); // Initial temperature (x2)

  // ==================== Simulation Parameters ====================
  int n = 45000;            // Number of simulation steps
  double tmax = 45.0;       // Total simulation time (seconds)
  double dt = tmax / n;     // Time step size (delta t)

  // ==================== Cost Function Weights (unused in this script) ====================
  double Q = 10.0;          // State weighting matrix coefficient
  double R = 0.01;          // Control input weighting coefficient
  (void)Q; (void)R;         // Suppress unused variable warnings

  // ==================== System and Controller Parameters ====================
  std::vector<int> m(1, 1); // Step counter initialization
  double alpha = 1.0;       // System decay rate coefficient
  double betta = 100.0;     // Sliding mode control gain (reaching law parameter)
  double lambda = 0.3;      // Control input gain (g2 coefficient)
  double gamma = 20.0;      // Activation energy parameter for reaction kinetics
  double B = 1.0;           // Heat of reaction coefficient
  double Da = 0.072;        // Damkohler number (ratio of reaction rate to flow rate)

  // ==================== Reference Signal Initialization ====================
  std::vector<double> r1(1, 0.0); // Initial reference for x1 (concentration)
  std::vector<double> r2(1, 0.0); // Initial reference for x2 (temperature)

  // ==================== Tracking Error Initialization ====================
  std::vector<double> e1(1, x[0] - r1[0]); // Initial tracking error for concentration
  std::vector<double> e2(1, y[0] - r2[0]); // Initial tracking error for temperature

  // ==================== Control Input Initialization ====================
  std::vector<double> u(1, 0.0); // Initial control input
  (void)u;                       // Suppress unused variable warning

  // Preallocate vectors for dynamics
  std::vector<double> g1(n, 0.0);
  std::vector<double> g2(n, 0.0);
  std::vector<double> f1(n, 0.0);
  std::vector<double> f2(n, 0.0);
  std::vector<double> S(n, 0.0);
  std::vector<double> u1(n, 0.0);
  std::vector<double> u2(n, 0.0);
  (void)u1; (void)u2;           // Suppress unused variable warnings

  // Resize state vectors
  x.resize(n);
  y.resize(n);
  t.resize(n);
  r1.resize(n);
  r2.resize(n);
  e1.resize(n);
  e2.resize(n);
  m.resize(n);

  // ==================== Main Simulation Loop ====================
  for (int i = 0; i < n - 1; ++i) {
    m[i + 1] = m[i] + 1; // Increment step counter

    // ---------- Control Input Coefficients (Affine System: x_dot = f + g*u) ----------
    g1[i] = 0.0;      // Control coefficient for x1 equation (no direct control)
    g2[i] = lambda;   // Control coefficient for x2 equation

    // ---------- System Dynamics (Euler Discretization of CSTR Model) ----------
    // f1: Concentration dynamics with reaction term (Arrhenius kinetics)
    f1[i] = x[i] + dt * (-alpha * x[i] + Da * (1 - x[i]) * std::exp(y[i] / (1 + y[i] / gamma)));

    // f2: Temperature dynamics with reaction heat generation
    f2[i] = y[i] + dt * (-alpha * y[i] + B * Da * (1 - x[i]) * std::exp(y[i] / (1 + y[i] / gamma)));

    // ---------- Time Update ----------
    t[i + 1] = t[i] + dt;

    // ---------- Piecewise Constant Reference for x1 (Concentration) ----------
    // Reference changes at t=15s and t=30s to test tracking performance
    if (0 <= t[i + 1] && t[i + 1] <= 15) {
      r1[i + 1] = 0.4472;           // Low concentration setpoint
    } else if (15 < t[i + 1] && t[i + 1] < 30) {
      r1[i + 1] = 0.7646;           // High concentration setpoint
    } else if (30 <= t[i + 1] && t[i + 1] < tmax) {
      r1[i + 1] = 0.4472;           // Return to low concentration
    }

    // ---------- Piecewise Constant Reference for x2 (Temperature) ----------
    if (0 <= t[i + 1] && t[i + 1] <= 15) {
      r2[i + 1] = 2.752;            // Low temperature setpoint
    } else if (15 < t[i + 1] && t[i + 1] < 30) {
      r2[i + 1] = 4.7052;           // High temperature setpoint
    } else if (30 <= t[i + 1] && t[i + 1] < tmax) {
      r2[i + 1] = 2.752;            // Return to low temperature
    }

    // ---------- Sliding Surface Sign Function ----------
    // S(i) = sign(e2) determines the switching control action
    if ((y[i] - r2[i]) > 0) {
      S[i] = 1.0;                   // Error positive: above reference
    } else if ((y[i] - r2[i]) < 0) {
      S[i] = -1.0;                  // Error negative: below reference
    } else {
      S[i] = 0.0;                   // On the sliding surface
    }

    // ---------- Control Law Computation ----------
    u1[i] = 0.0;                    // No control for concentration (indirectly controlled)
    // Sliding mode control law for temperature tracking
    u2[i] = -1.0 / g2[i] * (-betta * S[i] + r2[i + 1] - r2[i] - f2[i]);

    // ---------- State Update (Closed-Loop Dynamics) ----------
    x[i + 1] = f1[i];               // Concentration evolves according to open-loop dynamics
    y[i + 1] = y[i] + dt * (-betta * S[i] + r2[i + 1] - r2[i]); // Temperature with sliding mode control

    // ---------- Tracking Error Update ----------
    e1[i + 1] = x[i + 1] - r1[i + 1]; // Concentration tracking error
    e2[i + 1] = y[i + 1] - r2[i + 1]; // Temperature tracking error
  }

  // ==================== Output Results to CSV Files ====================
  // (For plotting in external tools like Python/gnuplot/MATLAB)
  std::ofstream file("fig2a_results.csv");
  if (file.is_open()) {
    file << "t,x,y,r1,r2,e1,e2\n";
    for (int i = 0; i < n; ++i) {
      file << t[i] << "," << x[i] << "," << y[i] << ","
           << r1[i] << "," << r2[i] << "," << e1[i] << "," << e2[i] << "\n";
    }
    file.close();
    std::cout << "Results written to fig2a_results.csv" << std::endl;
  } else {
    std::cerr << "Error: Could not open output file." << std::endl;
    return 1;
  }

  std::cout << "Simulation complete." << std::endl;
  return 0;
}
