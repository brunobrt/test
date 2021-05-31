import 'package:onboarding/redux/app_state.dart';

import 'movies_actions.dart';

AppState updateMoviesListReducer(AppState currentState, action) {
  if (action is IncrementPageAction) {
    return currentState.copyWith(
      currentPage: currentState.currentPage + 1,
    );
  } else if (action is SetLoadingAction) {
    return currentState.copyWith(hasError: null, isLoading: true);
  } else if (action is FetchMoviesSucceedAction) {
    return currentState.copyWith(
        hasError: null, isLoading: false, movieList: action.moviesList);
  } else if (action is FetchMoviesFailedAction) {
    return currentState.copyWith(hasError: action.error, isLoading: false);
  }
  return currentState;
}
