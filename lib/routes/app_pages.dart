
import 'package:get/get.dart';
import '../views/modules/doctor_profile_module/doctor_profile_page.dart';
import '../views/modules/home_module/home_bindings.dart';
import '../views/modules/home_module/home_page.dart';
import '../views/modules/view_distance_page.dart';
part './app_routes.dart';

abstract class AppPages {
  static const INITIAL = Routes.HOME;
  static final pages = [

    GetPage(
      name: Routes.HOME,
      page: () => homePage(),
      binding: HomeBinding(),
      transition: Transition.leftToRightWithFade,
      opaque: false,
      showCupertinoParallax: true,
    ),
    GetPage(
      name: Routes.DOCTOR_PROFILE,
      page: () => doctor_profilePage(),
      transition: Transition.leftToRightWithFade,
      opaque: false,
      showCupertinoParallax: true,
    ),
    GetPage(
      name: Routes.VIEW_DISTANCE,
      page: () => ViewDistance(),

    ),
  ];
}