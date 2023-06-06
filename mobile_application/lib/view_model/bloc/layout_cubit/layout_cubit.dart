import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/view/pages/home_page_screen/home_page_screen.dart';
import 'package:meta/meta.dart';

import '../../../view/pages/create_program_screen/create_program_screen.dart';
import '../../../view/pages/hotels_booking_screens/hotels_booking_screens.dart';
import '../../../view/pages/profile_screen/profile_screen.dart';
import '../../../view/pages/social_media_screen/social_media_screen.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(context) => BlocProvider.of<LayoutCubit>(context);
  int currentIndex = 0;
  List<Widget> screen =
  [
    HomePageScreen(),
    const SocialMediaScreen(),
    const HotelBookingScreen(),
    const ProfileScreen(),


  ];
  void changeIndex(int index)
  {
    currentIndex = index;
    emit(LayoutChangeIndexState());
  }
}
