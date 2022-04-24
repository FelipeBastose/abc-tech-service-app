///home_bind.dart

import 'package:abctechapp/controller/login_controller.dart';
import 'package:abctechapp/provider/login_provider.dart';
import 'package:abctechapp/services/login_service.dart';
import 'package:get/get.dart';

class LoginBind extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<LoginController>(() => LoginController(
      LoginService(LoginProvider())
    ));
  
  }

  
}
