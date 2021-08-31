import 'package:json_annotation/json_annotation.dart';

part 'places_model.g.dart';

@JsonSerializable(nullable: true)
class PlacesModel {
  PlacesModel({
    this.placeSuggestionId,
    this.placeSuggestionPlaceId,
    this.placeSuggestionLatitude,
    this.placeSuggestionLongitude,
    this.placeSuggestionStreet,
    this.placeSuggestionSubLocality,
    this.placeSuggestionLocality,
    this.placeSuggestionSubAdmArea,
    this.placeSuggestionAdmArea,
    this.placeSuggestionPostalCode,
    this.placeSuggestionCountry,
    this.placeSuggestionDescription,
  });

  @JsonKey(name: 'place_suggestion_id', nullable: true)
  String placeSuggestionId;
  @JsonKey(name: 'place_suggestion_place_id', nullable: true)
  String placeSuggestionPlaceId;
  @JsonKey(name: 'place_suggestion_latitude', nullable: true)
  String placeSuggestionLatitude;
  @JsonKey(name: 'place_suggestion_longitude', nullable: true)
  String placeSuggestionLongitude;
  @JsonKey(name: 'place_suggestion_street', nullable: true)
  String placeSuggestionStreet;
  @JsonKey(name: 'place_suggestion_sub_locality', nullable: true)
  String placeSuggestionSubLocality;
  @JsonKey(name: 'place_suggestion_locality', nullable: true)
  String placeSuggestionLocality;
  @JsonKey(name: 'place_suggestion_sub_adm_area', nullable: true)
  String placeSuggestionSubAdmArea;
  @JsonKey(name: 'place_suggestion_adm_area', nullable: true)
  String placeSuggestionAdmArea;
  @JsonKey(name: 'place_suggestion_postal_code', nullable: true)
  String placeSuggestionPostalCode;
  @JsonKey(name: 'place_suggestion_country', nullable: true)
  String placeSuggestionCountry;
  @JsonKey(name: 'place_suggestion_description', nullable: true)
  String placeSuggestionDescription;

  PlacesModel copyWith({
    String placeSuggestionId,
    String placeSuggestionPlaceId,
    String placeSuggestionLatitude,
    String placeSuggestionLongitude,
    String placeSuggestionStreet,
    String placeSuggestionSubLocality,
    String placeSuggestionLocality,
    String placeSuggestionSubAdmArea,
    String placeSuggestionAdmArea,
    String placeSuggestionPostalCode,
    String placeSuggestionCountry,
    String placeSuggestionDescription,
  }) =>
      PlacesModel(
        placeSuggestionId: placeSuggestionId ?? this.placeSuggestionId,
        placeSuggestionPlaceId:
            placeSuggestionPlaceId ?? this.placeSuggestionPlaceId,
        placeSuggestionLatitude:
            placeSuggestionLatitude ?? this.placeSuggestionLatitude,
        placeSuggestionLongitude:
            placeSuggestionLongitude ?? this.placeSuggestionLongitude,
        placeSuggestionStreet:
            placeSuggestionStreet ?? this.placeSuggestionStreet,
        placeSuggestionSubLocality:
            placeSuggestionSubLocality ?? this.placeSuggestionSubLocality,
        placeSuggestionLocality:
            placeSuggestionLocality ?? this.placeSuggestionLocality,
        placeSuggestionSubAdmArea:
            placeSuggestionSubAdmArea ?? this.placeSuggestionSubAdmArea,
        placeSuggestionAdmArea:
            placeSuggestionAdmArea ?? this.placeSuggestionAdmArea,
        placeSuggestionPostalCode:
            placeSuggestionPostalCode ?? this.placeSuggestionPostalCode,
        placeSuggestionCountry:
            placeSuggestionCountry ?? this.placeSuggestionCountry,
        placeSuggestionDescription:
            placeSuggestionDescription ?? this.placeSuggestionDescription,
      );

  factory PlacesModel.fromJson(Map<String, dynamic> json) =>
      _$PlacesModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlacesModelToJson(this);
}
