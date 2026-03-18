#include "../plot_downsample.h"
#include "cstr_dynamics.h"
#include <Eigen/Dense>
#include <chrono>
#include <fstream>
#include <matplot/matplot.h>
#include <vector>

int main() {
  SimSettings settings;
  StateConditions stateConditions(settings.timeSteps);
  InternalConditions internalConditions;
  std::vector<double> timeVector, controlVector;

  for (int i = 0; i < settings.timeSteps; i++) {
    timeVector.push_back(i * settings.tau);
    stateConditions.referenceMatrix(0, i) =
        i > 15000 && i < 30000 ? 0.7646 : 0.4472;
    stateConditions.referenceMatrix(1, i) =
        i > 15000 && i < 30000 ? 4.7052 : 2.7520;
  }

  stateConditions.deltaReference =
      stateConditions.referenceMatrix.rightCols(settings.timeSteps - 1) -
      stateConditions.referenceMatrix.leftCols(settings.timeSteps - 1);

  stateConditions.stateMatrix(0, 0) = 0.0;
  stateConditions.stateMatrix(1, 0) = 0.0;

  systemFunction(settings, stateConditions, internalConditions);

  // Compute control input u at each timestep
  auto start = std::chrono::high_resolution_clock::now();
  for (int i = 0; i < settings.timeSteps - 1; i++) {
    double x = stateConditions.stateMatrix(0, i);
    double y = stateConditions.stateMatrix(1, i);
    double r2i = stateConditions.referenceMatrix(1, i);
    double deltaR2 = stateConditions.deltaReference(1, i);
    double f2 =
        y + settings.tau *
                (-internalConditions.alpha * y +
                 internalConditions.B * internalConditions.Da * (1 - x) *
                     std::exp(y / (1 + y / internalConditions.gamma)));
    double e2 = y - r2i;
    double S = (e2 > 0) ? 1.0 : (e2 < 0 ? -1.0 : 0.0);
    controlVector.push_back(-(1.0 / internalConditions.lambda) *
                            (-internalConditions.beta * S + deltaR2 - f2));
  }

  auto end = std::chrono::high_resolution_clock::now();
  auto duration =
      std::chrono::duration_cast<std::chrono::microseconds>(end - start);
  std::ofstream outFile("cstr_control_input_cpp_output.log");
  outFile << "Execution time: "
          << static_cast<double>(duration.count()) / 1000000 << " seconds"
          << std::endl;

  std::vector<double> timeCtrl(timeVector.begin(),
                               timeVector.begin() + settings.timeSteps - 1);

  std::vector<double> tCtrl, ctrlDs;
  downsample(timeCtrl, controlVector, tCtrl, ctrlDs);

  // Zoomed view: filter to 0.25-0.5s range
  std::vector<double> tZoom, ctrlZoom;
  for (size_t i = 0; i < timeCtrl.size(); i++) {
    if (timeCtrl[i] >= 0.25 && timeCtrl[i] <= 0.5) {
      tZoom.push_back(timeCtrl[i]);
      ctrlZoom.push_back(controlVector[i]);
    }
  }

  // Plot 1: Control Input (full)
  auto f1 = matplot::figure(true);
  matplot::plot(tCtrl, ctrlDs);
  matplot::title("Control Input");
  matplot::xlabel("Time (s)");
  matplot::ylabel("u");

  // Plot 2: Control Input (zoomed)
  auto f2 = matplot::figure(true);
  matplot::plot(tZoom, ctrlZoom);
  matplot::title("Control Input (Zoomed 0.25-0.5s)");
  matplot::xlabel("Time (s)");
  matplot::ylabel("u");

  matplot::show();
  return 0;
}
