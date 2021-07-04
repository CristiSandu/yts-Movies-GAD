import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:yts_movies_gat/src/actions/get_movies.dart';
import 'package:yts_movies_gat/src/container/is_loading_container.dart';
import 'package:yts_movies_gat/src/container/movies_container.dart';
import 'package:yts_movies_gat/src/models/app_state.dart';
import 'package:yts_movies_gat/src/models/movie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final double max = _scrollController.position.maxScrollExtent;
    final double offset = _scrollController.offset;
    final double delta = max - offset;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double threshold = screenHeight * 0.2;

    final Store<AppState> store = StoreProvider.of<AppState>(context);
    final bool isLoading = store.state.isLoading;

    if (delta < threshold && !isLoading) {
      store.dispatch(GetMovies(store.state.page));
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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
                  store.dispatch(GetMovies(store.state.page));
                },
              );
            },
          ),
        ],
      ),
      body: MoviesContainer(
        builder: (BuildContext context, List<Movie> movies) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.69,
            ),
            controller: _scrollController,
            itemCount: movies.length,
            itemBuilder: (BuildContext context, int index) {
              final Movie movie = movies[index];

              return GridTile(
                child: Image.network(movie.image),
                footer: GridTileBar(
                  backgroundColor: Colors.black38,
                  title: Text(movie.title),
                ),
                //title: Text('$index. ${movie.title}'),
              );
            },
          );
        },
      ),
    );
  }
}
