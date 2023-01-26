import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../view/pages/auth/forget_password/Recover_password.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());
  static ForgetPasswordCubit get(context) => BlocProvider.of<ForgetPasswordCubit>(context);
  List<Widget> widgetForgetPassword =
  [
    CustomPin(),
    SizedBox(),
  ];
}
