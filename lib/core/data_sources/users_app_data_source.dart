import 'package:movies_app/core/api/api_utils.dart';
import 'package:movies_app/core/models/credits_movie_model.dart';
import 'package:movies_app/core/models/recommend_movie_model.dart';
import 'package:movies_app/core/models/result.dart';
import 'package:movies_app/ui/utils/constants/general.dart';

const String basePath = '/3/movie';

class MoviesDataSource {
  MoviesDataSource({
    required ApiUtils apiUtils,
  }) : _apiUtils = apiUtils;

  final ApiUtils _apiUtils;

  

  Future<Result<MovieRecommendModel, BackendError>> getRecommendsMoviesList({required String movieId,required String page}) async {
    Result<dynamic, BackendError> result;
    final queryParameters = {
      'api_key': kApiKey,
      'language':'es-ES',
      'page':page
    };
    String path = "$basePath/$movieId/recommendations";

    result = await _apiUtils.makeRequest(method: Method.get, path: path, queryParameters:queryParameters);

    return result.when(
      fail: (fail) => Fail(fail),
      success: (success) => Success((MovieRecommendModel.fromJson(success)))
    );
  }

  Future<Result<MovieRecommendModel, BackendError>> getTopRatedMovies({required String page}) async {
    Result<dynamic, BackendError> result;
    final queryParameters = {
      'api_key': kApiKey,
      'language':'es',
      'page': page
    };
    String path = "$basePath/top_rated";

    result = await _apiUtils.makeRequest(method: Method.get, path: path, queryParameters:queryParameters);

    return result.when(
      fail: (fail) => Fail(fail),
      success: (success) => Success((MovieRecommendModel.fromJson(success)))
    );
  }


  Future<Result<CreditsMovieModel, BackendError>> getMovieCredits({required String movieId}) async {
    Result<dynamic, BackendError> result;
    final queryParameters = {
      'api_key': kApiKey,
      'language':'es',
    };

    String path = "$basePath/$movieId/credits";


    result = await _apiUtils.makeRequest(method: Method.get, path: path, queryParameters: queryParameters );

    return result.when(
      fail: (fail) => Fail(fail),
      success: (success) => Success((CreditsMovieModel.fromJson(success)))
    );
  }

}
