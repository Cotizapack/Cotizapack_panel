
import 'package:cotizaweb/app/data/services/categoryuser.dart';
import 'package:get/get.dart';
import '../controllers/categoryusers_controller.dart';


class CategoryUsersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryUsersController>(() => CategoryUsersController(categoryUserServices: CategoryUserServices()));
  }
}