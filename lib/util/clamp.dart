T clamp<T extends Comparable>(T value, {T? min, T? max}) {
  if (min != null && max != null && 0 < min.compareTo(max)) {
    throw ArgumentError.value(
        value, "max", "'Argument 'max' cannot be less than 'min'");
  }

  if (min != null && value.compareTo(min) < 0) {
    return min;
  } else if (max != null && value.compareTo(max) > 0) {
    return max;
  } else {
    return value;
  }
}
