extension NumberExtension on num {
  double interpolate(
      num min,
      num max, {
        lowerBound = 0,
        upperBound = 100,
      }) {
    if (this == 0) return 0;
    return (upperBound - lowerBound) * ((this - min) / (max - min)) +
        lowerBound;
  }
}
