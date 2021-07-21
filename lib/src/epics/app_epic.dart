import 'package:redux_epics/redux_epics.dart';
import 'package:yts_movies_gat/src/actions/index.dart';
import 'package:yts_movies_gat/src/data/movies_api.dart';
import 'package:yts_movies_gat/src/models/app_state.dart';
import 'package:yts_movies_gat/src/models/movie.dart';
import 'package:rxdart/rxdart.dart';

class AppEpics {
  const AppEpics({required MoviesApi moviesApi}) : _moviesApi = moviesApi;

  final MoviesApi _moviesApi;

  Epic<AppState> get epics {
    return combineEpics<AppState>(<Epic<AppState>>[
      TypedEpic<AppState, GetMoviesStart>(_getMovies),
    ]);
  }

  Stream<AppAction> _getMovies(Stream<GetMoviesStart> actions, EpicStore<AppState> store) {
    return actions
        .asyncMap((GetMoviesStart action) => _moviesApi.getMovies(store.state.page))
        .map((List<Movie> movies) => GetMovies.successful(movies))
        .onErrorReturnWith((Object error, StackTrace stackTrace) => GetMovies.error(error, stackTrace));
  }
}
