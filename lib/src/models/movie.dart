library movie;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:yts_movies_gat/src/models/serializers.dart';

part 'movie.g.dart';

abstract class Movie implements Built<Movie, MovieBuilder> {
  factory Movie([void Function(MovieBuilder) updates]) = _$Movie;

  factory Movie.fromJson(dynamic json) {
    return serializers.deserializeWith(serializer, json) as Movie;
  }
// 1:06 to cont
  Movie._();

  int get id;

  int get year;

  String get title;

  num get rating;

  int get runtime;

  String get state;

  String get language;

  String get summary;

  @BuiltValueField(wireName: 'date_uploaded')
  String get dateUploaded;

  @BuiltValueField(wireName: 'medium_cover_image')
  String get image;

  @BuiltValueField(wireName: 'large_cover_image')
  String get largeCoverImage;

  // Map<String, dynamic> get json => serializers.serializeWith(serializer, this) as Map<String, dynamic>;

  static Serializer<Movie> get serializer => _$movieSerializer;
}
