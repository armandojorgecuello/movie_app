
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/entities/recommend_movie.dart';
import 'package:movies_app/core/models/movie_model.dart';

class MovieRecommendModel extends Equatable{
    MovieRecommendModel({
        this.page,
        this.results,
        this.totalPages,
        this.totalResults,
    });

    int? page;
    List<MovieModel>? results;
    int? totalPages;
    int? totalResults;

    factory MovieRecommendModel.fromJson(Map<String, dynamic> json) => MovieRecommendModel(
        page: json["page"],
        results: List<MovieModel>.from(json["results"].map((x) => MovieModel.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );
    
    MovieRecommend toEntity() => MovieRecommend(
      page: page,
      results: results != null ? results!.map((movieResult) => movieResult.toEntity()).toList() : null ,
      totalPages: totalPages,
      totalResults: totalResults,
    );

    @override
    List<Object?> get props => [
      page,
      results,
      totalPages,
      totalResults,
    ];

}

