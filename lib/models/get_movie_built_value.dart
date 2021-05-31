import 'dart:convert';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:onboarding/models/serializers.dart';
part 'get_movie_built_value.g.dart';

abstract class MovieData implements Built<MovieData, MovieDataBuilder> {
  @nullable
  @BuiltValueField(wireName: 'backdrop_path')
  String get backdropPath;

  @nullable
  @BuiltValueField(wireName: 'genre_ids')
  BuiltList<int> get genreIds;

  @nullable
  @BuiltValueField(wireName: 'overview')
  String get overview;

  @nullable
  @BuiltValueField(wireName: 'poster_path')
  String get posterPath;

  @nullable
  @BuiltValueField(wireName: 'release_date')
  String get releaseDate;

  @nullable
  @BuiltValueField(wireName: 'title')
  String get title;

  MovieData._();
  static Serializer<MovieData> get serializer => _$movieDataSerializer;
  factory MovieData([void Function(MovieDataBuilder) updates]) = _$MovieData;

  String toJson() =>
      json.encode(serializers.serializeWith(MovieData.serializer, this));

  static MovieData fromJson(String jsonString) => serializers.deserializeWith(
      MovieData.serializer, json.decode(jsonString));
}
