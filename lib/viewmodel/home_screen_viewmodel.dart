import 'package:onboarding/models/get_movie_built_value.dart';
import 'package:onboarding/redux/app_state.dart';
import 'package:onboarding/redux/movies_actions.dart';
import 'package:redux/redux.dart';

class HomeScreenViewModel {
  final Store<AppState> store;

  HomeScreenViewModel(this.store);

  void getMovies() {
    store.dispatch(SetLoadingAction(true));
    store.dispatch(UpdateMovieListAction());
  }

  List<MovieData> get moviesList => store.state.movieList;

  bool get isLoading => store.state.isLoading;

  bool get hasError => store.state.error != null;
}
