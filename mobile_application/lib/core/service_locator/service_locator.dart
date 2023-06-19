import 'package:get_it/get_it.dart';
import 'package:graduation_project/view_model/bloc/interstend_cubit/intersted_cubit.dart';
import 'package:graduation_project/view_model/repo/activity_repo/activity_repo.dart';
import 'package:graduation_project/view_model/repo/booking_user_repo/booking_user_repo.dart';
import 'package:graduation_project/view_model/repo/hotel_repo/hotel_repo.dart';
import 'package:graduation_project/view_model/repo/interseted_repo/intersted_repo.dart';
import 'package:graduation_project/view_model/repo/profile_repo/profile_repo.dart';
import 'package:graduation_project/view_model/repo/register_repo/register_repo.dart';
import 'package:graduation_project/view_model/repo/room_repo/room_repo.dart';
import 'package:graduation_project/view_model/repo/search_repo/serarch_repo.dart';
import 'package:graduation_project/view_model/repo/verifyEmail/verify_email_repo.dart';

import '../../view_model/repo/book_room_repo/book_room_repo.dart';
import '../../view_model/repo/booked_activity_repo/booked_activity_repo.dart';
import '../../view_model/repo/hotel_wish_list_repo/hotel_wish_list_repo.dart';
import '../../view_model/repo/login_repo/login_repo.dart';
import '../../view_model/repo/whish_list_activity/whish_list_activity.dart';

final sl = GetIt.instance;

Future<void> setup() async {
  sl.registerLazySingleton<LoginRepoImpl>(() => LoginRepoImpl());
  sl.registerLazySingleton<RegisterRepoImpl>(() => RegisterRepoImpl());
  sl.registerLazySingleton<VerifyEmailRepoImpl>(() => VerifyEmailRepoImpl());
  sl.registerLazySingleton<InterstedRepoImpl>(() => InterstedRepoImpl());
  sl.registerLazySingleton<ActivityRepImpl>(() => ActivityRepImpl());
  sl.registerLazySingleton<BookedActivityRepoImpl>(
      () => BookedActivityRepoImpl());
  sl.registerLazySingleton<HotelRepoImpl>(() => HotelRepoImpl());
  sl.registerLazySingleton<RoomRepoImpl>(() => RoomRepoImpl());
  sl.registerLazySingleton<ProfileRepoImpl>(() => ProfileRepoImpl());
  sl.registerLazySingleton<BookingUserRepoImpl>(() => BookingUserRepoImpl());
  sl.registerLazySingleton<BookingRoomRepoImpl>(() => BookingRoomRepoImpl());
  sl.registerLazySingleton<SearchRepoImpl>(() => SearchRepoImpl());
  sl.registerLazySingleton<HotelWishListRepoImpl>(() => HotelWishListRepoImpl());
  sl.registerLazySingleton<ActivityWishListRepoImpl>(() => ActivityWishListRepoImpl());



  // cubit
}
