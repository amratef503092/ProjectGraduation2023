import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project/view_model/bloc/auth_cubit/auth_cubit.dart';
import 'package:graduation_project/view_model/bloc/internet_services/internet_service_bloc.dart';
import 'package:graduation_project/view_model/bloc/location_cubit/location_cubit.dart';
import 'package:graduation_project/view_model/database/local/cache_helper.dart';
import 'package:graduation_project/view_model/database/network/dio-helper.dart';
import 'package:graduation_project/view_model/repo/login_repo/login_repo.dart';
import 'package:graduation_project/view_model/repo/register_repo/register_repo.dart';
import 'package:graduation_project/view_model/repo/verifyEmail/verify_email_repo.dart';

import 'core/BlocObserver.dart';
import 'core/resource/color_mananger.dart';
import 'core/resource/routes_manager.dart';
import 'core/resource/theme_manager.dart';
import 'core/service_locator/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await DioHelper.init();
  await EasyLocalization.ensureInitialized();
  await CacheHelper.init();
  setup();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.white));
  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale(
            'en',
          ),
          Locale(
            'ar',
          )
        ],
        path: 'assets/lang',
        fallbackLocale: const Locale(
          'en',
        ),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ColorManage.primaryBlue,
    ));
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => InternetServiceBloc()),
            BlocProvider(
                create: (context) => AuthCubit(sl.get<LoginRepoImpl>(),
                    sl.get<RegisterRepoImpl>(), sl.get<VerifyEmailRepoImpl>())),
            BlocProvider(
              create: (context) => LocationCubit()..determinePosition(),
            )
          ],
          child: BlocListener<InternetServiceBloc, InternetServiceState>(
            listener: (context, state) {
              if (state is Connected) {
                Fluttertoast.showToast(
                    msg: state.message,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.TOP,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0);
              } else if (state is NoConnected) {
                Fluttertoast.showToast(
                    msg: state.message,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.TOP,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
            },
            child: MaterialApp(
              supportedLocales: context.supportedLocales,
              localizationsDelegates: context.localizationDelegates,
              locale: context.locale,
              debugShowCheckedModeBanner: false,
              onGenerateRoute: RouteGenerator.getRoute,
              initialRoute: Routes.onBoarding,
              theme: getTheme(),
            ),
          ),
        );
      },
    );
  }
}
