import 'package:cflix/app/controller/home_controller.dart';
import 'package:cflix/app/data/provider/home_api_client.dart';
import 'package:cflix/app/data/repository/home_repository.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() {
      return HomeController(
          repository: HomeRepository(client: HomeApiClient()));
    });
  }
}
