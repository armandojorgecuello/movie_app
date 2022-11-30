import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:movies_app/ui/screen/splash/logic/splash_controller.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }

}