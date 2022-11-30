
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/entities/movie.dart';

class MovieRecommend extends Equatable{
    MovieRecommend({
        this.page,
        this.results,
        this.totalPages,
        this.totalResults,
    });

    int? page;
    List<Movie>? results;
    int? totalPages;
    int? totalResults;
    
      @override
      List<Object?> get props => [
        page,
        results,
        totalPages,
        totalResults,
      ];

   

}

