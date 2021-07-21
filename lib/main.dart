import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:yts_movies_gat/src/actions/index.dart';
import 'package:yts_movies_gat/src/data/movies_api.dart';
import 'package:yts_movies_gat/src/epics/app_epic.dart';
import 'package:yts_movies_gat/src/models/app_state.dart';
import 'package:yts_movies_gat/src/presentation/home_page.dart';
import 'package:yts_movies_gat/src/presentation/movie_detailes.dart';
import 'package:yts_movies_gat/src/reducer/reducer.dart';

void main() {
  const String apiUrl = 'https://yts.mx/api/v2';
  final Client client = Client();
  final MoviesApi moviesApi = MoviesApi(apiUrl: apiUrl, client: client);
  final AppEpics appEpics = AppEpics(moviesApi: moviesApi);
  final Store<AppState> store = Store<AppState>(
    reducer,
    initialState: AppState(),
    middleware: <Middleware<AppState>>[
      EpicMiddleware<AppState>(appEpics.epics),
    ],
  );
  store.dispatch(const GetMovies());

  runApp(
    YtsApp(
      store: store,
    ),
  );
}

class YtsApp extends StatelessWidget {
  const YtsApp({Key? key, required this.store}) : super(key: key);
  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        home: const HomePage(),
        theme: ThemeData.light(),
        routes: <String, WidgetBuilder>{
          '/details': (BuildContext context) {
            return const MovieDetails();
          }
        },
      ),
    );
  }
}
