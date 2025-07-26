import 'package:get/get.dart';

import '../features/meg/page/mess_list.dart' show MessListScreen;


part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.MAIN;
  static final routes = [


      GetPage(
        name: _Paths.MAIN,
        page: () => const MessListScreen(),
      ),




  ];
}
