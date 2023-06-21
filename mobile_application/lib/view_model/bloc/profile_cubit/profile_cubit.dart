import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/model/user_model/user_model.dart';
import 'package:meta/meta.dart';

import '../../../view/pages/activity_history_screen/activity_hstory_screen.dart';
import '../../../view/pages/room_history_screen/room_history_screen.dart';
import '../../../view/pages/user_settings_screen/settings_screen.dart';
import '../../../view/pages/wishlist_activity_screen/wish_list_activity_screen.dart';
import '../../../view/pages/wishlist_screen/wishlist_screen.dart';
import '../../repo/profile_repo/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of<ProfileCubit>(context);
  ProfileRepo profileRepo;

  List<String> profileNames = [
    // 'My Wallet',
    'Wishlist Hotels'.tr(),
    'Wishlist Activities'.tr(),
    'Activities History'.tr(),
    'Rooms History'.tr(),
    'Settings'.tr()
  ];
  List<Widget> screenNames = [
    // WalletScreen(),
    const WishlistScreen(),
    const WishListActivityScreen(),
    const ActivityHistoryScreen(),
    const RoomHistoryScreen(),
    const UserSettingsScreen()
  ];
  List<String> profileIconName = [
    // 'wallet-2',
    'Heart2',
    'Heart2',
    'clock',
    'clock',
    'setting-2'
  ];
  User? user;

  Future<void> getProfile() async {
    emit(ProfileLoadingState());
    var result = await profileRepo.getProfile();
    result.fold((failure) {
      emit(ProfileErrorState(error: failure.message));
    }, (responseProfileData) {
      user = responseProfileData;
      emit(ProfileSuccessfullyState(userModel: responseProfileData));
    });
  }

  Future<void> updateProfileInfo(String phone, String nationality) async {
    emit(ProfileLoadingUpdateState());
    var result = await profileRepo.updateProfile(phone, nationality);
    result.fold((failure) {
      emit(ProfileErrorUpdateState(error: failure.message));
    }, (responseProfileData) {
      user = responseProfileData;
      emit(ProfileSuccessfullyUpdateState(userModel: responseProfileData));
    });
  }
  Future<void> changePassword(String newPassword) async
  {
    emit(ChangePasswordLoadingState());
    var result = await profileRepo.updatePassword(newPassword);
    result.fold((failure) {
      emit(ChangePasswordErrorState(error: failure.message));
    }, (message) {
      emit(ChangePasswordSuccessfullyState(message: message));
    });
  }

}
