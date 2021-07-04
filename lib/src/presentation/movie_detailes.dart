import 'package:flutter/material.dart';
import 'package:yts_movies_gat/src/container/selected_movie_container.dart';
import 'package:yts_movies_gat/src/models/movie.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({Key? key}) : super(key: key);

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SelectedMovieContainer(builder: (BuildContext context, Movie movie) {
      return Scaffold(
        appBar: AppBar(
          title: Text(movie.title),
        ),
        body: _isLoading
            ? GestureDetector(
                onTap: () {
                  setState(
                    () {
                      if (_isLoading) {
                        _isLoading = false;
                      }
                    },
                  );
                },
                child: AnimatedContainer(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(movie.largeCoverImage),
                    ),
                  ),
                  duration: const Duration(seconds: 2),
                ),
              )
            : Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(movie.largeCoverImage),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.dstATop),
                    ),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      // final String genre = movie.genres.join('/');
                      if (index == 0) {
                        return Text(
                          movie.title,
                          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                        );
                      } else if (index == 1) {
                        return Text(
                          movie.year.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        );
                      } else if (index == 2) {
                        return const Text(
                          '',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        );
                      } else if (index == 3)
                        return Wrap(
                          direction: Axis.horizontal,
                          spacing: 100,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          alignment: WrapAlignment.start,
                          children: <Widget>[
                            Wrap(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    setState(
                                      () {
                                        if (!_isLoading) {
                                          _isLoading = true;
                                        }
                                      },
                                    );
                                  },
                                  child: Image.network(
                                    movie.image,
                                    width: 230,
                                    height: 345,
                                  ),
                                ),
                              ],
                            ),
                            Wrap(
                              direction: Axis.vertical,
                              spacing: 32,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              alignment: WrapAlignment.start,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: <Widget>[
                                Wrap(
                                  direction: Axis.horizontal,
                                  spacing: 10,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: <Widget>[
                                    const Icon(Icons.favorite, color: Colors.lightGreen, semanticLabel: 'Likes'),
                                    Text(
                                      movie.rating.toString(),
                                      style: const TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Wrap(
                                  direction: Axis.horizontal,
                                  spacing: 10,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: <Widget>[
                                    const Icon(Icons.timer, color: Colors.lightGreen, semanticLabel: 'RunTime'),
                                    Text(
                                      movie.runtime.toString(),
                                      style: const TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Wrap(
                                  direction: Axis.horizontal,
                                  spacing: 10,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: <Widget>[
                                    const Icon(Icons.language, color: Colors.lightGreen, semanticLabel: 'language'),
                                    Text(
                                      movie.language.toUpperCase(),
                                      style: const TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        );
                      else if (index == 4) {
                        return Column(
                          children: <Widget>[
                            const Text(
                              'Description',
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Center(
                              child: Text(movie.summary),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Uploaded at: ${movie.dateUploaded}',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        );
                      }
                      return Text(movie.image);
                    },
                  ),
                ),
              ),
      );
    });
  }
}
