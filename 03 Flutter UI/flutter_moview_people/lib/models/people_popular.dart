class PeoplePopularResponse {
  final int? page;
  final List<Actor>? results;
  final int? totalPages;
  final int? totalResults;

  PeoplePopularResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  PeoplePopularResponse.fromJson(Map<String, dynamic> json)
    : page = json['page'] as int?,
      results = (json['results'] as List?)?.map((dynamic e) => Actor.fromJson(e as Map<String,dynamic>)).toList(),
      totalPages = json['total_pages'] as int?,
      totalResults = json['total_results'] as int?;

  Map<String, dynamic> toJson() => {
    'page' : page,
    'results' : results?.map((e) => e.toJson()).toList(),
    'total_pages' : totalPages,
    'total_results' : totalResults
  };
}

class Actor {
  final bool? adult;
  final int? gender;
  final int? id;
  final List<KnownFor>? knownFor;
  final String? knownForDepartment;
  final String? name;
  final double? popularity;
  final String? profilePath;

  Actor({
    this.adult,
    this.gender,
    this.id,
    this.knownFor,
    this.knownForDepartment,
    this.name,
    this.popularity,
    this.profilePath,
  });

  Actor.fromJson(Map<String, dynamic> json)
    : adult = json['adult'] as bool?,
      gender = json['gender'] as int?,
      id = json['id'] as int?,
      knownFor = (json['known_for'] as List?)?.map((dynamic e) => KnownFor.fromJson(e as Map<String,dynamic>)).toList(),
      knownForDepartment = json['known_for_department'] as String?,
      name = json['name'] as String?,
      popularity = json['popularity'] as double?,
      profilePath = json['profile_path'] as String?;

  Map<String, dynamic> toJson() => {
    'adult' : adult,
    'gender' : gender,
    'id' : id,
    'known_for' : knownFor?.map((e) => e.toJson()).toList(),
    'known_for_department' : knownForDepartment,
    'name' : name,
    'popularity' : popularity,
    'profile_path' : profilePath
  };
}

class KnownFor {
  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final int? id;
  final String? mediaType;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final bool? video;
  final dynamic voteAverage;
  final int? voteCount;

  KnownFor({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.mediaType,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  KnownFor.fromJson(Map<String, dynamic> json)
    : adult = json['adult'] as bool?,
      backdropPath = json['backdrop_path'] as String?,
      genreIds = (json['genre_ids'] as List?)?.map((dynamic e) => e as int).toList(),
      id = json['id'] as int?,
      mediaType = json['media_type'] as String?,
      originalLanguage = json['original_language'] as String?,
      originalTitle = json['original_title'] as String?,
      overview = json['overview'] as String?,
      posterPath = json['poster_path'] as String?,
      releaseDate = json['release_date'] as String?,
      title = json['title'] as String?,
      video = json['video'] as bool?,
      voteAverage = json['vote_average'] is int? json['vote_average'].toDouble(): json['vote_average'] as double,
      voteCount = json['vote_count'] as int?;

  Map<String, dynamic> toJson() => {
    'adult' : adult,
    'backdrop_path' : backdropPath,
    'genre_ids' : genreIds,
    'id' : id,
    'media_type' : mediaType,
    'original_language' : originalLanguage,
    'original_title' : originalTitle,
    'overview' : overview,
    'poster_path' : posterPath,
    'release_date' : releaseDate,
    'title' : title,
    'video' : video,
    'vote_average' : voteAverage,
    'vote_count' : voteCount
  };
}