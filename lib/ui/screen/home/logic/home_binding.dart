import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:movies_app/core/repositories/users_repository.dart';
import 'package:movies_app/ui/screen/home/logic/home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(
      moviesRepository: Get.put(MoviesRepository(movieDataSource: Get.find()))
    ));
  }
}