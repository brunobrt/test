import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:onboarding/models/get_movie_built_value.dart';
import 'package:onboarding/models/serializers.dart';
import 'package:http/http.dart' as http;
import 'package:onboarding/widgets/constants.dart';

Future<List<MovieData>> fetchResults({@required int page}) async {
  final getUrl = 'https://api.themoviedb.org/3/movie/upcoming?api_key='
      '$key&language=en-US&page=$page';
  try {
    final response = await http.get(Uri.parse(getUrl));
    final moviesList = json.decode(response.body)['results'];
    if (moviesList == null) {
      throw Exception('Was not able to connect to API');
    } else {
      final list = moviesList
          .map(
              (item) => serializers.deserializeWith(MovieData.serializer, item))
          .toList()
          .cast<MovieData>();
      return list;
    }
  } catch (err) {
    print('Failed to get Movie Data due to $err');
    return [];
  }
}
