import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/resource/color_mananger.dart';

class CustomPin extends StatelessWidget {
  const CustomPin({
    Key? key,
    required this.onCompleted
  }) : super(key: key);
  final Function onCompleted;
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      length: 6,
      cursorColor: ColorManage.primaryYellow,
      keyboardType: TextInputType.number,
      blinkWhenObscuring: true,
      textStyle: TextStyle(
          color: ColorManage.background,
          fontSize: 20.sp),
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      pinTheme: PinTheme(
        inactiveColor: ColorManage.primaryBlue,
        inactiveFillColor: ColorManage.background,
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(14.r),
        activeFillColor: ColorManage.primaryBlue,
        selectedFillColor: ColorManage.primaryBlue,
        activeColor: Colors.white,

      ),
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      animationType: AnimationType.fade,
      onCompleted: (v) {
        onCompleted(v);
      },

      onChanged: (value) {
        if (kDebugMode) {
          print(value);
        }
        // setState(() {
        //   currentText = value;
        // });
      },

      beforeTextPaste: (text) {
        if (kDebugMode) {
          print("Allowing to paste $text");
        }
        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
        //but you can show anything you want here, like your pop up saying wrong paste format or etc
        return true;
      }, appContext: context,
    );
  }
}