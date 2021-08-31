class DistanceModel {
  num distanceValue;
  num durationValue;
  String distanceText;
  String durationText;

  DistanceModel({
    this.distanceValue,
    this.durationValue,
    this.distanceText,
    this.durationText,
  });

  DistanceModel copyWith({
    num distanceValue,
    num durationValue,
    String distanceText,
    String durationText,
  }) =>
      DistanceModel(
        distanceValue: distanceValue ?? this.distanceValue,
        durationValue: durationValue ?? this.durationValue,
        distanceText: distanceText ?? this.distanceText,
        durationText: durationText ?? this.durationText,
      );
}
