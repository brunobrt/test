import 'package:flutter/material.dart';
import 'package:onboarding/models/get_movie_built_value.dart';

@immutable
class AppState {
  final List<MovieData> movieList;
  final Exception error;
  final bool isLoading;
  final int currentPage;

  AppState(
      {@required this.currentPage,
      @required this.error,
      @required this.isLoading,
      @required this.movieList});

  factory AppState.initialState() =>
      AppState(currentPage: 0, error: null, isLoading: false, movieList: []);

  AppState copyWith(
      {int currentPage,
      Exception hasError,
      bool isLoading,
      List<MovieData> movieList}) {
    return AppState(
        currentPage: currentPage ?? this.currentPage,
        error: hasError ?? this.error,
        isLoading: isLoading ?? this.isLoading,
        movieList: movieList ?? this.movieList);
  }
}
