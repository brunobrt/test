import 'package:onboarding/models/get_movie_built_value.dart';

class SetLoadingAction {
  final bool isLoading;

  SetLoadingAction(this.isLoading);
}

class UpdateMovieListAction {}

class FetchMoviesSucceedAction {
  final List<MovieData> moviesList;

  FetchMoviesSucceedAction(this.moviesList);
}

class FetchMoviesFailedAction {
  final Exception error;

  FetchMoviesFailedAction(this.error);
}

class IncrementPageAction {}
