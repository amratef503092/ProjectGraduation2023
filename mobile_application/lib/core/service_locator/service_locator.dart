import 'package:get_it/get_it.dart';
import 'package:graduation_project/view_model/bloc/interstend_cubit/intersted_cubit.dart';
import 'package:graduation_project/view_model/repo/interseted_repo/intersted_repo.dart';
import 'package:graduation_project/view_model/repo/register_repo/register_repo.dart';
import 'package:graduation_project/view_model/repo/verifyEmail/verify_email_repo.dart';

import '../../view_model/repo/login_repo/login_repo.dart';

final sl = GetIt.instance;

Future<void> setup() async {
  sl.registerLazySingleton<LoginRepoImpl>(() => LoginRepoImpl());
  sl.registerLazySingleton<RegisterRepoImpl>(() => RegisterRepoImpl());
  sl.registerLazySingleton<VerifyEmailRepoImpl>(() => VerifyEmailRepoImpl());
  sl.registerLazySingleton<InterstedRepoImpl>(() => InterstedRepoImpl());

  // cubit

}