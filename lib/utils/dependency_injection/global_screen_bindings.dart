import 'package:get/get.dart';
import 'package:hyperhire_assignment/controller/dashboard_controller.dart';
import 'package:hyperhire_assignment/controller/home_controller.dart';

class GlobalScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
