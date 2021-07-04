import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:yts_movies_gat/src/actions/get_movies.dart';
import 'package:yts_movies_gat/src/container/is_loading_container.dart';
import 'package:yts_movies_gat/src/container/movies_container.dart';
import 'package:yts_movies_gat/src/models/app_state.dart';
import 'package:yts_movies_gat/src/models/movie.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
        actions: <Widget>[
          IsLoadingContainer(
            builder: (BuildContext context, bool isLoading) {
              if (isLoading) {
                return const CircularProgressIndicator(
                  color: Colors.amber,
                );
              }

              return IconButton(
              icon: const Icon(Icons.movie),
              onPressed: () {
              final Store<AppState> store = StoreProvider.of<AppState>(context);
              store.dispatch(GetMovies());
              },
              );
            },
          ),
        ],
      ),
      body: MoviesContainer(
        builder: (BuildContext context, List<Movie> movies) {
          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (BuildContext context, int index) {
              final Movie movie = movies[index];

              return ListTile(
                title: Text(movie.title),
              );
            },
          );
        },
      ),
    );
  }
}
