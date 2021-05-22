import 'package:ayov2/const/const.dart';
import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:get/get.dart';

class AppRoute {
  static final routes = [
    GetPage(
      name: INTRO_PAGE,
      binding: IntroPageBinding(),
      page: () => IntroPage(),
    ),
    GetPage(
      name: ONBOARDING_PAGE,
      binding: OnboardingPageBinding(),
      page: () => OnboardingPage(),
    ),
    GetPage(
      name: LOGIN_PAGE,
      binding: LoginPageBinding(),
      page: () => LoginPage(),
    ),
    GetPage(
      name: REGISTER_PAGE,
      binding: RegisterPageBinding(),
      page: () => RegisterPage(),
    ),
    GetPage(
      name: OTP_PAGE,
      binding: OtpPageBinding(),
      page: () => OtpPage(),
    ),
    GetPage(
      name: HOME_PAGE,
      binding: HomePageBinding(),
      page: () => HomePage(),
    ),
  ];
}
