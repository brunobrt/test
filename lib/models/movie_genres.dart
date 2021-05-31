import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';

Map<int, String> genres = {
  28: "Action",
  12: "Adventure",
  16: "Animation",
  35: "Comedy",
  80: "Crime",
  99: "Documentary",
  18: "Drama",
  10751: "Family",
  14: "Fantasy",
  36: "History",
  27: "Horror",
  10402: "Music",
  9648: "Mystery",
  10749: "Romance",
  878: "Science Fiction",
  10770: "TV Movie",
  53: "Thriller",
  10752: "War",
  37: "Western"
};

String getGenresList({@required BuiltList<int> ids}) {
  final movieGenres =
      List<String>.generate(ids.length, (index) => genres[ids[index]]);
  final exp = RegExp("(^\\[|\\])");
  return movieGenres.toString().replaceAll(exp, "");
}
