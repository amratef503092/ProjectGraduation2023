import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/view/pages/auth/forget_password/Recover_password.dart';
import 'package:graduation_project/view/pages/auth/sign_in_screen/sign_in_screen.dart';
import 'package:graduation_project/view/pages/home_screens/home_screen.dart';
import 'package:graduation_project/view_model/bloc/onBoarding_cubit/on_boarding_cubit.dart';

import '../../view/pages/auth/forget_password/create_new_password.dart';
import '../../view/pages/auth/forget_password/forget_password_screen.dart';
import '../../view/pages/auth/sign_up_screen/Sign_up_screen.dart';
import '../../view/pages/auth/sign_up_screen/welcome_page.dart';
import '../../view/pages/onboarding_screen/onBoarding_screen.dart';

class Routes {
  static const String loginRoute = "/login";
  static const String homeScreen = "/Home";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String onBoarding = '/OnBoarding';
  static const String signIn = "/signIn";
  static const String signUp = "/signUp";
  static const String recoverPassword = "/RecoverPassword";
  static const String createNewPassword = "/CreateNewPassword";
  static const String welcomePage = "/WelcomePage";
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
      case Routes.homeScreen:
        return MaterialPageRoute(
            builder: (_) => const HomeScreen());
      case Routes.signIn:
        return MaterialPageRoute(
            builder: (_) =>  SignInScreen());
      case Routes.signUp:
        return MaterialPageRoute(
            builder: (_) =>   SignupScreen());
        case Routes.forgotPasswordRoute:
        return MaterialPageRoute(
            builder: (_) =>   ForgetPasswordScreen());
        case Routes.recoverPassword:
        return MaterialPageRoute(
            builder: (_) =>   RecoverPasswordScreen());
        case Routes.createNewPassword:
        return MaterialPageRoute(
            builder: (_) =>   CreateNewPasswordScreen());
        case Routes.welcomePage:
        return MaterialPageRoute(
            builder: (_) =>   WelcomePage());
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
