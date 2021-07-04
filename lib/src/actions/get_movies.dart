import 'package:yts_movies_gat/src/models/movie.dart';

class GetMovies {}

class GetMoviesSuccessful {
  GetMoviesSuccessful(this.movies);

  final List<Movie> movies;
}

class GetMoviesError {
  GetMoviesError(this.error);

  final Object error;
}
