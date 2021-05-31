import 'package:flutter/material.dart';
import 'package:onboarding/models/get_movie_built_value.dart';
import 'package:onboarding/models/movie_data_storage.dart';
import 'package:onboarding/services/movie_API.dart';

class MovieRepository {
  static Future<List<MovieData>> getMovieData({@required int page}) async {
    final movieDataList = await fetchResults(page: page);
    if (movieDataList.isEmpty) {
      return getFromPersistence();
    }
    saveOnPersistence(movieDataList);
    return movieDataList;
  }
}

Future<List<MovieData>> getFromPersistence() {
  try {
    return MovieDataStorage.readData().then((value) => value);
  } catch (e) {
    print('getFromPersistenceError: $e');
    return Future.value([]);
  }
}

void saveOnPersistence(List<MovieData> movieDataList) =>
    MovieDataStorage.writeData(movieDataList);
