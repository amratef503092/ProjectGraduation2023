import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/view_model/bloc/onBoarding_cubit/on_boarding_cubit.dart';

import '../../view/pages/onboarding_screen/onBoarding_screen.dart';

class Routes {
  static const String loginRoute = "/login";
  static const String homeScreen = "/Home";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String onBoarding = '/OnBoarding';
  static const String storeDetailsRoute = "/storeDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) => OnBoardingCubit(),
                  child:  OnBoardingScreen(),
                ));
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(
                    "No Route Found"), // todo move this string to strings manager
              ),
              body: const Center(
                  child: Text(
                      "No Route Found")), // todo move this string to strings manager
            ));
  }
}
