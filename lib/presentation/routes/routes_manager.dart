import 'package:flutter/material.dart';
import 'package:store_mvvm/presentation/resource/strings_manager.dart';
import 'package:store_mvvm/presentation/screens/forget_password/view/forget_password_view.dart';
import 'package:store_mvvm/presentation/screens/login/view/login_view.dart';
import 'package:store_mvvm/presentation/screens/main/view/main_view.dart';
import 'package:store_mvvm/presentation/screens/onboarding/view/onboarding_view.dart';
import 'package:store_mvvm/presentation/screens/registeration/view/registration_view.dart';
import 'package:store_mvvm/presentation/screens/splash/view/splash_view.dart';
import 'package:store_mvvm/presentation/screens/store_details/view/store_details_view.dart';

class Routes {
  static const String splashRoute = '/';
  static const String onBoaringRoute = '/onBoarding';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgetPassswordRoute = '/forgetPassword';
  static const String mainRoute = '/mian';
  static const String storeDetailsRoute = '/storeDetails';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.forgetPassswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegistrationView());
      case Routes.onBoaringRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => const StoreDetailsView());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: const Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
