import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart';
import 'package:redux/redux.dart';
import 'package:yts_movies_gat/src/actions/get_movies.dart';
import 'package:yts_movies_gat/src/data/movies_api.dart';
import 'package:yts_movies_gat/src/middleware/middleware.dart';
import 'package:yts_movies_gat/src/models/app_state.dart';
import 'package:yts_movies_gat/src/presentation/home_page.dart';
import 'package:yts_movies_gat/src/reducer/reducer.dart';

void main() {
  const String apiUrl = 'https://yts.mx/api/v2';
  final Client client = Client();
  final MoviesApi moviesApi = MoviesApi(apiUrl: apiUrl, client: client);
  final AppMiddleware appMiddleware = AppMiddleware(moviesApi: moviesApi);
  final Store<AppState> store = Store<AppState>(
    reducer,
    initialState: AppState(),
    middleware: appMiddleware.middleware,
  );
  store.dispatch(GetMovies());

  runApp(YtsApp(
    store: store,
  ));
}

class YtsApp extends StatelessWidget {
  const YtsApp({Key? key, required this.store}) : super(key: key);
  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
