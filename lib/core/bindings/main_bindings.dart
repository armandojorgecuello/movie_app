import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:movies_app/core/api/api_utils.dart';
import 'package:movies_app/core/data_sources/users_app_data_source.dart';
import 'package:movies_app/core/repositories/iuser_repository.dart';
import 'package:movies_app/core/repositories/users_repository.dart';
import 'package:movies_app/ui/utils/constants/general.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ApiUtils>(() => ApiUtils(client: Dio() ,host: kHost ));
    Get.lazyPut<MoviesDataSource>(() => MoviesDataSource(apiUtils: Get.find()));
    Get.lazyPut<IMoviesRepository>(() => MoviesRepository(movieDataSource: Get.find()));
  }
}