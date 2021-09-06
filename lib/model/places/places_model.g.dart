// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'places_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlacesModel _$PlacesModelFromJson(Map<String, dynamic> json) {
  return PlacesModel(
    placeSuggestionId: json['place_suggestion_id'] as String,
    placeSuggestionPlaceId: json['place_suggestion_place_id'] as String,
    placeSuggestionLatitude: json['place_suggestion_latitude'] as String,
    placeSuggestionLongitude: json['place_suggestion_longitude'] as String,
    placeSuggestionStreet: json['place_suggestion_street'] as String,
    placeSuggestionSubLocality: json['place_suggestion_sub_locality'] as String,
    placeSuggestionLocality: json['place_suggestion_locality'] as String,
    placeSuggestionSubAdmArea: json['place_suggestion_sub_adm_area'] as String,
    placeSuggestionAdmArea: json['place_suggestion_adm_area'] as String,
    placeSuggestionPostalCode: json['place_suggestion_postal_code'] as String,
    placeSuggestionCountry: json['place_suggestion_country'] as String,
    placeSuggestionDescription: json['place_suggestion_description'] as String,
  );
}

Map<String, dynamic> _$PlacesModelToJson(PlacesModel instance) =>
    <String, dynamic>{
      'place_suggestion_id': instance.placeSuggestionId,
      'place_suggestion_place_id': instance.placeSuggestionPlaceId,
      'place_suggestion_latitude': instance.placeSuggestionLatitude,
      'place_suggestion_longitude': instance.placeSuggestionLongitude,
      'place_suggestion_street': instance.placeSuggestionStreet,
      'place_suggestion_sub_locality': instance.placeSuggestionSubLocality,
      'place_suggestion_locality': instance.placeSuggestionLocality,
      'place_suggestion_sub_adm_area': instance.placeSuggestionSubAdmArea,
      'place_suggestion_adm_area': instance.placeSuggestionAdmArea,
      'place_suggestion_postal_code': instance.placeSuggestionPostalCode,
      'place_suggestion_country': instance.placeSuggestionCountry,
      'place_suggestion_description': instance.placeSuggestionDescription,
    };
