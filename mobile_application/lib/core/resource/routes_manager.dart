import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/model/acitvity_model/activity_model.dart';
import 'package:graduation_project/view/pages/activity_details_screen/activity_details_screen.dart';
import 'package:graduation_project/view/pages/auth/forget_password/Recover_password.dart';
import 'package:graduation_project/view/pages/auth/sign_in_screen/sign_in_screen.dart';
import 'package:graduation_project/view/pages/home_screens/home_screen.dart';
import 'package:graduation_project/view/pages/layout_screen/layout_screen.dart';
import 'package:graduation_project/view_model/bloc/onBoarding_cubit/on_boarding_cubit.dart';

import '../../view/pages/Setting_Screen/languages_screen/languages_screen.dart';
import '../../view/pages/Setting_Screen/setting_currency/setting_currency.dart';
import '../../view/pages/Setting_Screen/setting_screen.dart';
import '../../view/pages/Setting_Screen/unit_screen/unit_screen.dart';
import '../../view/pages/auth/forget_password/create_new_password.dart';
import '../../view/pages/auth/forget_password/forget_password_screen.dart';
import '../../view/pages/auth/sign_up_screen/Sign_up_screen.dart';
import '../../view/pages/auth/verification_screen/verification_screen.dart';
import '../../view/pages/booked/main_page.dart';
import '../../view/pages/booked_activity_screen/booked_activity_screen.dart';
import '../../view/pages/home_page_screen/home_page_screen.dart';
import '../../view/pages/location_screen/location_screen.dart';
import '../../view/pages/location_screen/welcome_page.dart';
import '../../view/pages/onboarding_screen/onBoarding_screen.dart';
import '../../view/pages/room_details/room_details_screen.dart';
import '../../view/pages/select_room/select_room.dart';

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
  static const String location = "/LocationScreen";
  static const String HomePageScreen = "/HomePageScreen";
  static const String settingScreen = "/SettingScreen";
  static const String LanguageScreen = "/LanguageScreen";
  static const String SettingCurrency = "/SettingCurrency";
  static const String UnitScreen = "/UnitScreen";
  static const String LayoutScreen = "/LayoutScreen";
  static const String VerificationEmailScreen = "/VerificationEmailScreen";
  static const String SelectRoomScreen = "/SelectRoomScreen";
  static const String RoomDetailsScreen = "/RoomDetailsScreen";
  static const String ActivityDetailsScreen = "/ActivityDetailsScreen";
  static const String BookedActivityScreen = "/BookedActivityScreen";
  static const String mainBookedDetialesScreen = "/mainBookedDetialesScreen";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) => OnBoardingCubit(),
                  child: OnBoardingScreen(),
                ));
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.signIn:
        return MaterialPageRoute(builder: (_) => SignInScreen());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => SignupScreen());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => ForgetPasswordScreen());
      case Routes.recoverPassword:
        return MaterialPageRoute(builder: (_) => RecoverPasswordScreen());
      case Routes.createNewPassword:
        return MaterialPageRoute(
            builder: (_) => const CreateNewPasswordScreen());
      case Routes.welcomePage:
        return MaterialPageRoute(builder: (_) => const WelcomePage());
      case Routes.location:
        return MaterialPageRoute(builder: (_) => LocationScreen());
      case Routes.HomePageScreen:
        return MaterialPageRoute(builder: (_) => HomePageScreen());
      case Routes.settingScreen:
        return MaterialPageRoute(builder: (_) => const SettingScreen());
      case Routes.LanguageScreen:
        return MaterialPageRoute(builder: (_) => const LanguageScreen());
      case Routes.SettingCurrency:
        return MaterialPageRoute(builder: (_) => const SettingCurrency());
      case Routes.UnitScreen:
        return MaterialPageRoute(builder: (_) => const UnitScreen());
      case Routes.LayoutScreen:
        return MaterialPageRoute(builder: (_) => const LayoutScreen());
      case Routes.VerificationEmailScreen:
        return MaterialPageRoute(builder: (_) => VerificationEmailScreen());
      case Routes.SelectRoomScreen:
        return MaterialPageRoute(builder: (_) => const SelectRoomScreen());
      case Routes.RoomDetailsScreen:
        return MaterialPageRoute(
          builder: (_) {
            return RoomDetailsScreen();
          },
        );
      case Routes.BookedActivityScreen:
        return MaterialPageRoute(
          builder: (_) {
            return BookedActivityScreen(
              activityModel: routeSettings.arguments as ActivityModel,
            );
          },
        );
      case Routes.mainBookedDetialesScreen:
        return MaterialPageRoute(
          builder: (_) {
            return MainPageBookedScreen();
          },
        );

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
