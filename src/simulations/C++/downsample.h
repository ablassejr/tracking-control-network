#include <vector>

// Min/max downsampling: preserves visual envelope by keeping the min and max
// y-values within each time bucket, output in chronological order.
// Passes data through unchanged when size <= maxPoints.
inline void downsample(const std::vector<double> &xIn,
                       const std::vector<double> &yIn,
                       std::vector<double> &xOut, std::vector<double> &yOut,
                       int maxPoints = 2000) {
  int n = static_cast<int>(xIn.size());
  if (n <= maxPoints) {
    xOut = xIn;
    yOut = yIn;
    return;
  }

  int buckets = maxPoints / 2;
  double bucketSize = static_cast<double>(n) / buckets;

  xOut.reserve(maxPoints);
  yOut.reserve(maxPoints);

  for (int b = 0; b < buckets; b++) {
    int start = static_cast<int>(b * bucketSize);
    int end = static_cast<int>((b + 1) * bucketSize);
    if (end > n)
      end = n;

    int minIdx = start, maxIdx = start;
    for (int i = start + 1; i < end; i++) {
      if (yIn[i] < yIn[minIdx])
        minIdx = i;
      if (yIn[i] > yIn[maxIdx])
        maxIdx = i;
    }

    int first = (minIdx <= maxIdx) ? minIdx : maxIdx;
    int second = (minIdx <= maxIdx) ? maxIdx : minIdx;

    xOut.push_back(xIn[first]);
    yOut.push_back(yIn[first]);
    if (first != second) {
      xOut.push_back(xIn[second]);
      yOut.push_back(yIn[second]);
    }
  }
}
