
import 'package:movies_app/core/entities/movie.dart';
import 'package:movies_app/ui/utils/constants/general.dart';

class MovieModel {
    MovieModel({
        this.adult,
        this.backdropPath,
        this.id,
        this.title,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.posterPath,
        this.mediaType,
        this.genreIds,
        this.popularity,
        this.releaseDate,
        this.video,
        this.voteAverage,
        this.voteCount,
    });

    bool? adult;
    String? backdropPath;
    int? id;
    String? title;
    String? originalLanguage;
    String? originalTitle;
    String? overview;
    String? posterPath;
    dynamic mediaType;
    List<int>? genreIds;
    double? popularity;
    DateTime? releaseDate;
    bool? video;
    double? voteAverage;
    int? voteCount;

    factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        adult: json["adult"] ?? false,
        backdropPath: json["backdrop_path"] == null ? null : json["backdrop_path"],
        id: ((json["id"] ?? 0) as num).toInt() ,
        title: json["title"] ?? kEmptyString,
        originalLanguage: json["original_language"] ?? kEmptyString,
        originalTitle: json["original_title"] ?? kEmptyString,
        overview: json["overview"] ?? kEmptyString,
        posterPath: json["poster_path"] == null ? null : json["poster_path"],
        mediaType: json["media_type"],
        genreIds: json["genre_ids"] != null ? List<int>.from(json["genre_ids"].map((x) => x)) : null,
        popularity: ((json["popularity"].toDouble() ?? 0 ) as num).toDouble(),
        releaseDate: json["release_date"] != null ? DateTime.parse(json["release_date"]) : DateTime.now(),
        video: json["video"] ?? false,
        voteAverage: ((json["vote_average"].toDouble() ?? 0) as num ).toDouble(),
        voteCount: ((json["vote_count"] ?? 0 )as num).toInt() ,
    );

  Movie toEntity()=> Movie(
    adult : adult,
    backdropPath : backdropPath,
    id : id,
    title : title,
    originalLanguage : originalLanguage,
    originalTitle : originalTitle,
    overview : overview,
    posterPath : posterPath,
    mediaType : mediaType,
    genreIds : genreIds,
    popularity : popularity,
    releaseDate : releaseDate,
    video : video,
    voteAverage : voteAverage,
    voteCount : voteCount,
  );
  
}



