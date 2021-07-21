// GENERATED CODE - DO NOT MODIFY BY HAND

part of movie;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Movie> _$movieSerializer = new _$MovieSerializer();

class _$MovieSerializer implements StructuredSerializer<Movie> {
  @override
  final Iterable<Type> types = const [Movie, _$Movie];
  @override
  final String wireName = 'Movie';

  @override
  Iterable<Object?> serialize(Serializers serializers, Movie object, {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'year',
      serializers.serialize(object.year, specifiedType: const FullType(int)),
      'title',
      serializers.serialize(object.title, specifiedType: const FullType(String)),
      'rating',
      serializers.serialize(object.rating, specifiedType: const FullType(num)),
      'runtime',
      serializers.serialize(object.runtime, specifiedType: const FullType(int)),
      'state',
      serializers.serialize(object.state, specifiedType: const FullType(String)),
      'language',
      serializers.serialize(object.language, specifiedType: const FullType(String)),
      'summary',
      serializers.serialize(object.summary, specifiedType: const FullType(String)),
      'date_uploaded',
      serializers.serialize(object.dateUploaded, specifiedType: const FullType(String)),
      'medium_cover_image',
      serializers.serialize(object.image, specifiedType: const FullType(String)),
      'large_cover_image',
      serializers.serialize(object.largeCoverImage, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Movie deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MovieBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(int)) as int;
          break;
        case 'year':
          result.year = serializers.deserialize(value, specifiedType: const FullType(int)) as int;
          break;
        case 'title':
          result.title = serializers.deserialize(value, specifiedType: const FullType(String)) as String;
          break;
        case 'rating':
          result.rating = serializers.deserialize(value, specifiedType: const FullType(num)) as num;
          break;
        case 'runtime':
          result.runtime = serializers.deserialize(value, specifiedType: const FullType(int)) as int;
          break;
        case 'state':
          result.state = serializers.deserialize(value, specifiedType: const FullType(String)) as String;
          break;
        case 'language':
          result.language = serializers.deserialize(value, specifiedType: const FullType(String)) as String;
          break;
        case 'summary':
          result.summary = serializers.deserialize(value, specifiedType: const FullType(String)) as String;
          break;
        case 'date_uploaded':
          result.dateUploaded = serializers.deserialize(value, specifiedType: const FullType(String)) as String;
          break;
        case 'medium_cover_image':
          result.image = serializers.deserialize(value, specifiedType: const FullType(String)) as String;
          break;
        case 'large_cover_image':
          result.largeCoverImage = serializers.deserialize(value, specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Movie extends Movie {
  @override
  final int id;
  @override
  final int year;
  @override
  final String title;
  @override
  final num rating;
  @override
  final int runtime;
  @override
  final String state;
  @override
  final String language;
  @override
  final String summary;
  @override
  final String dateUploaded;
  @override
  final String image;
  @override
  final String largeCoverImage;

  factory _$Movie([void Function(MovieBuilder)? updates]) => (new MovieBuilder()..update(updates)).build();

  _$Movie._(
      {required this.id,
      required this.year,
      required this.title,
      required this.rating,
      required this.runtime,
      required this.state,
      required this.language,
      required this.summary,
      required this.dateUploaded,
      required this.image,
      required this.largeCoverImage})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'Movie', 'id');
    BuiltValueNullFieldError.checkNotNull(year, 'Movie', 'year');
    BuiltValueNullFieldError.checkNotNull(title, 'Movie', 'title');
    BuiltValueNullFieldError.checkNotNull(rating, 'Movie', 'rating');
    BuiltValueNullFieldError.checkNotNull(runtime, 'Movie', 'runtime');
    BuiltValueNullFieldError.checkNotNull(state, 'Movie', 'state');
    BuiltValueNullFieldError.checkNotNull(language, 'Movie', 'language');
    BuiltValueNullFieldError.checkNotNull(summary, 'Movie', 'summary');
    BuiltValueNullFieldError.checkNotNull(dateUploaded, 'Movie', 'dateUploaded');
    BuiltValueNullFieldError.checkNotNull(image, 'Movie', 'image');
    BuiltValueNullFieldError.checkNotNull(largeCoverImage, 'Movie', 'largeCoverImage');
  }

  @override
  Movie rebuild(void Function(MovieBuilder) updates) => (toBuilder()..update(updates)).build();

  @override
  MovieBuilder toBuilder() => new MovieBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Movie &&
        id == other.id &&
        year == other.year &&
        title == other.title &&
        rating == other.rating &&
        runtime == other.runtime &&
        state == other.state &&
        language == other.language &&
        summary == other.summary &&
        dateUploaded == other.dateUploaded &&
        image == other.image &&
        largeCoverImage == other.largeCoverImage;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc($jc($jc(0, id.hashCode), year.hashCode), title.hashCode), rating.hashCode),
                                runtime.hashCode),
                            state.hashCode),
                        language.hashCode),
                    summary.hashCode),
                dateUploaded.hashCode),
            image.hashCode),
        largeCoverImage.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Movie')
          ..add('id', id)
          ..add('year', year)
          ..add('title', title)
          ..add('rating', rating)
          ..add('runtime', runtime)
          ..add('state', state)
          ..add('language', language)
          ..add('summary', summary)
          ..add('dateUploaded', dateUploaded)
          ..add('image', image)
          ..add('largeCoverImage', largeCoverImage))
        .toString();
  }
}

class MovieBuilder implements Builder<Movie, MovieBuilder> {
  _$Movie? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _year;
  int? get year => _$this._year;
  set year(int? year) => _$this._year = year;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  num? _rating;
  num? get rating => _$this._rating;
  set rating(num? rating) => _$this._rating = rating;

  int? _runtime;
  int? get runtime => _$this._runtime;
  set runtime(int? runtime) => _$this._runtime = runtime;

  String? _state;
  String? get state => _$this._state;
  set state(String? state) => _$this._state = state;

  String? _language;
  String? get language => _$this._language;
  set language(String? language) => _$this._language = language;

  String? _summary;
  String? get summary => _$this._summary;
  set summary(String? summary) => _$this._summary = summary;

  String? _dateUploaded;
  String? get dateUploaded => _$this._dateUploaded;
  set dateUploaded(String? dateUploaded) => _$this._dateUploaded = dateUploaded;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  String? _largeCoverImage;
  String? get largeCoverImage => _$this._largeCoverImage;
  set largeCoverImage(String? largeCoverImage) => _$this._largeCoverImage = largeCoverImage;

  MovieBuilder();

  MovieBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _year = $v.year;
      _title = $v.title;
      _rating = $v.rating;
      _runtime = $v.runtime;
      _state = $v.state;
      _language = $v.language;
      _summary = $v.summary;
      _dateUploaded = $v.dateUploaded;
      _image = $v.image;
      _largeCoverImage = $v.largeCoverImage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Movie other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Movie;
  }

  @override
  void update(void Function(MovieBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Movie build() {
    final _$result = _$v ??
        new _$Movie._(
            id: BuiltValueNullFieldError.checkNotNull(id, 'Movie', 'id'),
            year: BuiltValueNullFieldError.checkNotNull(year, 'Movie', 'year'),
            title: BuiltValueNullFieldError.checkNotNull(title, 'Movie', 'title'),
            rating: BuiltValueNullFieldError.checkNotNull(rating, 'Movie', 'rating'),
            runtime: BuiltValueNullFieldError.checkNotNull(runtime, 'Movie', 'runtime'),
            state: BuiltValueNullFieldError.checkNotNull(state, 'Movie', 'state'),
            language: BuiltValueNullFieldError.checkNotNull(language, 'Movie', 'language'),
            summary: BuiltValueNullFieldError.checkNotNull(summary, 'Movie', 'summary'),
            dateUploaded: BuiltValueNullFieldError.checkNotNull(dateUploaded, 'Movie', 'dateUploaded'),
            image: BuiltValueNullFieldError.checkNotNull(image, 'Movie', 'image'),
            largeCoverImage: BuiltValueNullFieldError.checkNotNull(largeCoverImage, 'Movie', 'largeCoverImage'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
