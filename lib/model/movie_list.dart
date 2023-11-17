class MovieList {
  int? id;
  String? backdropPath;
  List<String>? genres;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? title;
  String? contentType;

  MovieList(
      {this.id,
      this.backdropPath,
      this.genres,
      this.originalTitle,
      this.overview,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.contentType});

  MovieList.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is int) {
      id = json["_id"];
    }
    if (json["backdrop_path"] is String) {
      backdropPath = json["backdrop_path"];
    }
    if (json["genres"] is List) {
      genres =
          json["genres"] == null ? null : List<String>.from(json["genres"]);
    }
    if (json["original_title"] is String) {
      originalTitle = json["original_title"];
    }
    if (json["overview"] is String) {
      overview = json["overview"];
    }
    if (json["poster_path"] is String) {
      posterPath = json["poster_path"];
    }
    if (json["release_date"] is String) {
      releaseDate = json["release_date"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["contentType"] is String) {
      contentType = json["contentType"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["backdrop_path"] = backdropPath;
    if (genres != null) {
      _data["genres"] = genres;
    }
    _data["original_title"] = originalTitle;
    _data["overview"] = overview;
    _data["poster_path"] = posterPath;
    _data["release_date"] = releaseDate;
    _data["title"] = title;
    _data["contentType"] = contentType;
    return _data;
  }
}
