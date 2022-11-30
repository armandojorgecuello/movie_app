import 'package:movies_app/core/data_sources/users_app_data_source.dart';
import 'package:movies_app/core/entities/credits_movie.dart';
import 'package:movies_app/core/entities/recommend_movie.dart';
import 'package:movies_app/core/models/result.dart';
import 'package:movies_app/core/repositories/iuser_repository.dart';


class MoviesRepository extends IMoviesRepository {
  MoviesRepository({required MoviesDataSource movieDataSource})
      : _movieDataSource = movieDataSource;

  final MoviesDataSource _movieDataSource;

  @override
  Future<Result<MovieRecommend, BackendError>> getRecommendsMoviesList({required String movieId, required String page}) async{
    final result = await _movieDataSource.getRecommendsMoviesList(movieId: movieId, page: page);
    return result.when(
      fail: (fail) => Fail(fail), 
      success: (success) =>
          Success((success.toEntity())),
    );
  }

  @override
  Future<Result<MovieRecommend, BackendError>> getTopRatedMovies({required String page}) async{
    final result = await _movieDataSource.getTopRatedMovies(page: page);
    return result.when(
      fail: (fail) => Fail(fail), 
      success: (success) =>
          Success((success.toEntity())),
    );
  }
  
  @override
  Future<Result<CreditsMovie, BackendError>> getMovieCredits({required String movieId})async {
    final result = await _movieDataSource.getMovieCredits(movieId: movieId);
    return result.when(
      fail: (fail) => Fail(fail), 
      success: (success) =>
          Success((success.toEntity())),
    );
  }

  

}
