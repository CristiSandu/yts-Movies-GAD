import 'package:redux/redux.dart';
import 'package:yts_movies_gat/src/actions/get_movies.dart';
import 'package:yts_movies_gat/src/actions/set.dart';
import 'package:yts_movies_gat/src/models/app_state.dart';

Reducer<AppState> reducer = combineReducers(<Reducer<AppState>>[
  TypedReducer<AppState, GetMovies>(_getMovies),
  TypedReducer<AppState, GetMoviesSuccessful>(_getMoviesSuccessful),
  TypedReducer<AppState, GetMoviesError>(_getMoviesError),
  TypedReducer<AppState, SetSelectedMovie>(_setSelectedMovie)
]);

AppState _getMoviesSuccessful(AppState state, GetMoviesSuccessful action) {
  return state.rebuild((AppStateBuilder b) {
    b
      ..movies.addAll(action.movies)
      ..isLoading = false
      ..page = state.page + 1;
  });
}

AppState _getMovies(AppState state, GetMovies action) {
  return state.rebuild((AppStateBuilder b) {
    b.isLoading = true;
  });
}

AppState _getMoviesError(AppState state, GetMoviesError action) {
  return state.rebuild((AppStateBuilder b) {
    b
      ..isLoading = false
      ..error = '${action.error}';
  });
}

AppState _setSelectedMovie(AppState state, SetSelectedMovie action) {
  return state.rebuild((AppStateBuilder b) {
    b.selectedMovie = action.movieId;
  });
}
