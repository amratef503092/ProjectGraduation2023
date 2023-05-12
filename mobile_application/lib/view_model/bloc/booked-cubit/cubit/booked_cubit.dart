import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/view/pages/booked/your_booking.dart';
import 'package:meta/meta.dart';

import '../../../../view/pages/booked/comformation.dart';
import '../../../../view/pages/booked/payment_screen.dart';
import '../../../../view/pages/booked/screen_one_contact_details.dart';
import '../../../repo/booked_activity_repo/booked_activity_repo.dart';

part 'booked_state.dart';

class BookedCubit extends Cubit<BookedState> {
  BookedCubit(this.bookedActivityRepo) : super(BookedInitial());
  BookedActivityRepo bookedActivityRepo;
  static BookedCubit get(context) => BlocProvider.of<BookedCubit>(context);
  PageController pageController = PageController();
  int currentIndex = 0;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool addCard = false;
  void changeAddCard() {
    addCard = true;
    emit(BookedChangeIndex());
  }

  void changeIndex(int index) {
    currentIndex = index;
    emit(BookedChangeIndex());
  }

  List<String> titles = [
    'Book',
    'Details',
    'Payment',
    'Confirmation',
  ];
  void next() {
    if (currentIndex < pages.length - 1) {
      currentIndex++;
      pageController.animateToPage(currentIndex,
          duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
      emit(BookedChangeIndex());
    }
  }

  bool paymentSelected = false;
  void changePayment(bool value) {
    paymentSelected = value;
    emit(BookedChangeIndex());
  }

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<Widget> pages = [
    // const ContanctDetailsScreen(),
    const YourBookingScreen(),
    const PaymentScreen(),
    const ConFormationScreen(),
  ];
  Future<void> bookActivity(
      {required int id,
      required String date,
      required int numberOfPepole}) async {
    emit(BookedActivityLoading());
    var response = await bookedActivityRepo.bookedActivity(
      date: date,
      id: id,
      numberOfPeople: numberOfPepole,
    );
    response.fold((l) => emit(BookedActivityError(l.toString())),
        (r) => emit(BookedActivitySuccessfuly()));
  }
}
