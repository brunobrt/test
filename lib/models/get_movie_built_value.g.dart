// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_movie_built_value.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MovieData> _$movieDataSerializer = new _$MovieDataSerializer();

class _$MovieDataSerializer implements StructuredSerializer<MovieData> {
  @override
  final Iterable<Type> types = const [MovieData, _$MovieData];
  @override
  final String wireName = 'MovieData';

  @override
  Iterable<Object> serialize(Serializers serializers, MovieData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.backdropPath != null) {
      result
        ..add('backdrop_path')
        ..add(serializers.serialize(object.backdropPath,
            specifiedType: const FullType(String)));
    }
    if (object.genreIds != null) {
      result
        ..add('genre_ids')
        ..add(serializers.serialize(object.genreIds,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    if (object.overview != null) {
      result
        ..add('overview')
        ..add(serializers.serialize(object.overview,
            specifiedType: const FullType(String)));
    }
    if (object.posterPath != null) {
      result
        ..add('poster_path')
        ..add(serializers.serialize(object.posterPath,
            specifiedType: const FullType(String)));
    }
    if (object.releaseDate != null) {
      result
        ..add('release_date')
        ..add(serializers.serialize(object.releaseDate,
            specifiedType: const FullType(String)));
    }
    if (object.title != null) {
      result
        ..add('title')
        ..add(serializers.serialize(object.title,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  MovieData deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MovieDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'backdrop_path':
          result.backdropPath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'genre_ids':
          result.genreIds.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList<Object>);
          break;
        case 'overview':
          result.overview = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'poster_path':
          result.posterPath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'release_date':
          result.releaseDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$MovieData extends MovieData {
  @override
  final String backdropPath;
  @override
  final BuiltList<int> genreIds;
  @override
  final String overview;
  @override
  final String posterPath;
  @override
  final String releaseDate;
  @override
  final String title;

  factory _$MovieData([void Function(MovieDataBuilder) updates]) =>
      (new MovieDataBuilder()..update(updates)).build();

  _$MovieData._(
      {this.backdropPath,
      this.genreIds,
      this.overview,
      this.posterPath,
      this.releaseDate,
      this.title})
      : super._();

  @override
  MovieData rebuild(void Function(MovieDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MovieDataBuilder toBuilder() => new MovieDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MovieData &&
        backdropPath == other.backdropPath &&
        genreIds == other.genreIds &&
        overview == other.overview &&
        posterPath == other.posterPath &&
        releaseDate == other.releaseDate &&
        title == other.title;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, backdropPath.hashCode), genreIds.hashCode),
                    overview.hashCode),
                posterPath.hashCode),
            releaseDate.hashCode),
        title.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MovieData')
          ..add('backdropPath', backdropPath)
          ..add('genreIds', genreIds)
          ..add('overview', overview)
          ..add('posterPath', posterPath)
          ..add('releaseDate', releaseDate)
          ..add('title', title))
        .toString();
  }
}

class MovieDataBuilder implements Builder<MovieData, MovieDataBuilder> {
  _$MovieData _$v;

  String _backdropPath;
  String get backdropPath => _$this._backdropPath;
  set backdropPath(String backdropPath) => _$this._backdropPath = backdropPath;

  ListBuilder<int> _genreIds;
  ListBuilder<int> get genreIds => _$this._genreIds ??= new ListBuilder<int>();
  set genreIds(ListBuilder<int> genreIds) => _$this._genreIds = genreIds;

  String _overview;
  String get overview => _$this._overview;
  set overview(String overview) => _$this._overview = overview;

  String _posterPath;
  String get posterPath => _$this._posterPath;
  set posterPath(String posterPath) => _$this._posterPath = posterPath;

  String _releaseDate;
  String get releaseDate => _$this._releaseDate;
  set releaseDate(String releaseDate) => _$this._releaseDate = releaseDate;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  MovieDataBuilder();

  MovieDataBuilder get _$this {
    if (_$v != null) {
      _backdropPath = _$v.backdropPath;
      _genreIds = _$v.genreIds?.toBuilder();
      _overview = _$v.overview;
      _posterPath = _$v.posterPath;
      _releaseDate = _$v.releaseDate;
      _title = _$v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MovieData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MovieData;
  }

  @override
  void update(void Function(MovieDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MovieData build() {
    _$MovieData _$result;
    try {
      _$result = _$v ??
          new _$MovieData._(
              backdropPath: backdropPath,
              genreIds: _genreIds?.build(),
              overview: overview,
              posterPath: posterPath,
              releaseDate: releaseDate,
              title: title);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'genreIds';
        _genreIds?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MovieData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
