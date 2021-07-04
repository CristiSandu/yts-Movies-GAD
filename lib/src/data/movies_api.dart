import 'dart:convert';
import 'package:http/http.dart';
import 'package:yts_movies_gat/src/models/movie.dart';

class MoviesApi {
  const MoviesApi({required String apiUrl, required Client client})
      : _apiUrl = apiUrl,
        _client = client;

  final String _apiUrl;
  final Client _client;

  Future<List<Movie>> getMovies() async {
    final Uri uri = Uri.parse('$_apiUrl/list_movies.json');
    final Response response = await _client.get(uri);

    if (response.statusCode >= 300) {
      throw StateError(response.body);
    }

    final Map<String, dynamic> body = jsonDecode(response.body) as Map<String, dynamic>;
    final Map<String, dynamic> data = body['data'] as Map<String, dynamic>;
    final List<dynamic> movies = data['movies'] as List<dynamic>;

    return movies //
        .map((dynamic json) => Movie.fromJson(json))
        .toList();
  }
}
