import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
//import 'package:movies_app/core/repositories/users_repository.dart';
import 'package:movies_app/ui/screen/movie_details/logic/details_controller.dart';

class DetailsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DetailsController(
      moviesRepository: Get.find()
    ));
  }

}