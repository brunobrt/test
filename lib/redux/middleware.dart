import 'package:onboarding/repository/movie_repository.dart';
import 'package:redux/redux.dart';

import 'app_state.dart';
import 'movies_actions.dart';

void fetchMovieListMiddleware(
    Store<AppState> store, action, NextDispatcher next) async {
  if (action is UpdateMovieListAction) {
    try {
      final getMovies =
          await MovieRepository.getMovieData(page: store.state.currentPage);
      if (getMovies.isEmpty) throw Exception("getMovies returned empty");
      store.dispatch(FetchMoviesSucceedAction(getMovies));
    } catch (e) {
      print('fetchMoviesListMiddleware: $e');
      store.dispatch(FetchMoviesFailedAction(e));
    }
  }
  next(action);
}
