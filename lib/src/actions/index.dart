library actions;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yts_movies_gat/src/models/movie.dart';

part 'index.freezed.dart';
part 'get_movies.dart';
part 'set.dart';

abstract class AppAction {}

abstract class ErrorAction implements AppAction {
  Object get error;
  StackTrace get stackTrace;
}
