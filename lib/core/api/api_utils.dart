
import 'package:dio/dio.dart';
import 'package:movies_app/core/models/result.dart';


enum Method {
  delete,
  get,
  patch,
  post,
  put,
}

class ApiUtils {
  final Dio _client;
  final String _host;

  ApiUtils({
    required Dio client,
    required String host,
  })  : _client = client,
        _host = host;

  Future<Result<dynamic, BackendError>> makeRequest({
    dynamic data,
    Map<String, dynamic>? headers,
    required Method method,
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {

    Map<String, dynamic> _headers = <String, dynamic>{};
    
    //Additional headers
    _headers.addAll(headers ?? {});
    
    Uri uri = Uri.https(_host, path, queryParameters);

    final Response response;

    final Options options = Options(
      headers: _headers,
      
    );

    try {
      switch (method) {
        case Method.delete:
          response = await _client.deleteUri(
            uri,
            options: options,
          );
          break;
        case Method.get:
          response = await _client.getUri(
            uri,
            options: options,
          );
          break;
        case Method.patch:
          response = await _client.patchUri(
            uri,
            data: data,
            options: options,
          );
          break;
        case Method.post:
          response = await _client.postUri(
            uri,
            data: data,
            options: options,
          );
          break;
        case Method.put:
          response = await _client.putUri(
            uri,
            data: data,
            options: options,
          );
          break;
      }
      return Result.success(response.data);
    } on DioError catch (error) {
      switch (error.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
        case DioErrorType.sendTimeout:
          return Result.fail(
            BackendError(
              statusCode: 408,
              description: error.error,
              err: 'TimeOut',
            ),
          );
        default:
          String des = error.response?.data['errors']?[0]['attr'] != null
              ? '${error.response?.data['errors']?[0]['attr'] ?? ''}: ${error.response?.data['errors']?[0]['detail']}'
              : '${error.response?.data['errors']?[0]['detail']}';
          return Result.fail(
            BackendError(
              data: error.response?.data is String
                  ? {"message": ''}
                  : ((error.response?.data ?? {'message': ''}) as Map),
              description: des,
              err: error.error.toString(),
              statusCode: error.response?.statusCode ?? -1,
            ),
          );
      }
    }
  }

}
