import 'package:get_it/get_it.dart';
import 'package:graduation_project/view_model/repo/interseted_repo/intersted_repo.dart';
import 'package:graduation_project/view_model/repo/register_repo/register_repo.dart';
import 'package:graduation_project/view_model/repo/verifyEmail/verify_email_repo.dart';

import '../../view_model/repo/login_repo/login_repo.dart';

final sl = GetIt.instance;
void setup()
{
  sl.registerSingleton<LoginRepoImpl>(LoginRepoImpl());
  sl.registerSingleton<RegisterRepoImpl>(RegisterRepoImpl());
  sl.registerSingleton<VerifyEmailRepoImpl>(VerifyEmailRepoImpl());
  sl.registerSingleton<InterstedRepoImpl>(InterstedRepoImpl());

}