
import 'package:movies_app/core/entities/credits_movie.dart';
import 'package:movies_app/core/entities/recommend_movie.dart';
import 'package:movies_app/core/models/result.dart';

abstract class IMoviesRepository {

  Future<Result<MovieRecommend, BackendError>> getRecommendsMoviesList({required String movieId, required String page});
  Future<Result<MovieRecommend, BackendError>> getTopRatedMovies({required String page});
  Future<Result<CreditsMovie, BackendError>> getMovieCredits({required String movieId});

}
