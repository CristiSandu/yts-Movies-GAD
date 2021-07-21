// class SetSelectedMovie {
//   SetSelectedMovie(this.movieId);
//
//   final int movieId;
// }
part of actions;

@freezed
class SetSelectedMovie with _$SetSelectedMovie implements AppAction {
  const factory SetSelectedMovie(int movieId) = SetSelectedMovie$;
}
