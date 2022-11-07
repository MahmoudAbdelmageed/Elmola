import 'package:el_mola/controllers/home_controller.dart';
import 'package:get/get.dart';

class GetBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
