part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const SPLASH_SCREEN = _Paths.SPLASH_SCREEN;
  static const MAIN = _Paths.MAIN;


}

abstract class _Paths {
  _Paths._();

  static const SPLASH_SCREEN = '/splash-screen';
  static const MAIN = "/main_screen";


}
