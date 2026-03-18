#include "simulation_types.h"
#include <cstdlib>
#include <iostream>

Eigen::VectorXd extractColumn(const Eigen::VectorXd &flat, int numCols,
                              int col) {
  int numRows = flat.size() / numCols;
  Eigen::VectorXd result(numRows);
  for (int i = 0; i < numRows; ++i)
    result(i) = flat(i * numCols + col);
  return result;
}

int main(int argc, char *argv[]) {
  if (argc != 3) {
    std::cerr << "Usage: validate_matlab_cpp <matlab_csv> <cpp_csv>" << std::endl;
    return 1;
  }

  auto matlab = loadCSV(argv[1]);
  if (matlab.size() == 0) {
    std::cerr << "Failed to load MATLAB CSV: " << argv[1] << std::endl;
    return 1;
  }

  auto cpp = loadCSV(argv[2]);
  if (cpp.size() == 0) {
    std::cerr << "Failed to load C++ CSV: " << argv[2] << std::endl;
    return 1;
  }

  // columns: t(0), x1(1), x2(2), r1(3), r2(4), e1(5), e2(6)
  int numCols = 7;

  Eigen::VectorXd matlab_x1 = extractColumn(matlab, numCols, 1);
  Eigen::VectorXd matlab_x2 = extractColumn(matlab, numCols, 2);
  Eigen::VectorXd matlab_e1 = extractColumn(matlab, numCols, 5);
  Eigen::VectorXd matlab_e2 = extractColumn(matlab, numCols, 6);

  Eigen::VectorXd cpp_x1 = extractColumn(cpp, numCols, 1);
  Eigen::VectorXd cpp_x2 = extractColumn(cpp, numCols, 2);
  Eigen::VectorXd cpp_e1 = extractColumn(cpp, numCols, 5);
  Eigen::VectorXd cpp_e2 = extractColumn(cpp, numCols, 6);

  double tol = 1e-6;
  int failures = 0;

  double x1_err = (cpp_x1 - matlab_x1).cwiseAbs().maxCoeff();
  double x2_err = (cpp_x2 - matlab_x2).cwiseAbs().maxCoeff();
  double e1_err = (cpp_e1 - matlab_e1).cwiseAbs().maxCoeff();
  double e2_err = (cpp_e2 - matlab_e2).cwiseAbs().maxCoeff();

  std::cout << "x1 (conversion)  max error: " << x1_err
            << (x1_err < tol ? " PASS" : " FAIL") << std::endl;
  std::cout << "x2 (temperature) max error: " << x2_err
            << (x2_err < tol ? " PASS" : " FAIL") << std::endl;
  std::cout << "e1 (x1 error)    max error: " << e1_err
            << (e1_err < tol ? " PASS" : " FAIL") << std::endl;
  std::cout << "e2 (x2 error)    max error: " << e2_err
            << (e2_err < tol ? " PASS" : " FAIL") << std::endl;

  if (x1_err >= tol) failures++;
  if (x2_err >= tol) failures++;
  if (e1_err >= tol) failures++;
  if (e2_err >= tol) failures++;

  if (failures > 0) {
    std::cerr << failures << " validation(s) failed (tolerance=" << tol << ")"
              << std::endl;
    return 1;
  }

  std::cout << "All validations passed (tolerance=" << tol << ")" << std::endl;
  return 0;
}
