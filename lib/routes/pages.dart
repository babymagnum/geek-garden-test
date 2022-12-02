import 'package:geek_garden_test/modules/dashboard/dashboard_binding.dart';
import 'package:geek_garden_test/modules/dashboard/dashboard_view.dart';
import 'package:geek_garden_test/routes/routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.dashboard,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
  ];
}
