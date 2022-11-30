


import 'package:equatable/equatable.dart';

class Movie extends Equatable{
    Movie({
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
    
      @override
      List<Object?> get props => [
        adult,
        backdropPath,
        id,
        title,
        originalLanguage,
        originalTitle,
        overview,
        posterPath,
        mediaType,
        genreIds,
        popularity,
        releaseDate,
        video,
        voteAverage,
        voteCount,
      ];


}
