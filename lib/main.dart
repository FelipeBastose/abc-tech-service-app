
import 'package:abctechapp/pages/home_bind.dart';
import 'package:abctechapp/pages/home_page.dart';
import 'package:abctechapp/pages/login_bind.dart';
import 'package:abctechapp/pages/login_page.dart';
import 'package:abctechapp/pages/order_bind.dart';
import 'package:abctechapp/pages/order_page.dart';
import 'package:abctechapp/provider/assistance_provider.dart';
import 'package:abctechapp/services/assistance_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

final storage = FlutterSecureStorage();

void main() {
  initServices();
  runApp(const MyApp());
}

void initServices() async {
  await Get.putAsync(() => AssistanceService().init(AssistanceProvider()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(name: "/services", page: () => const HomePage(), binding: HomeBind()),
        GetPage(name: "/order_page", page: () => const OrderPage(), binding: OrderBind()),
        GetPage(name: "/", page: () => const LoginPage(), binding: LoginBind())
      ],
    );
  }
}
