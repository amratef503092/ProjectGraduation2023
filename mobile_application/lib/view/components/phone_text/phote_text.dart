import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resource/color_mananger.dart';
import 'package:intl_phone_field/intl_phone_field.dart';


class phoneText extends StatelessWidget {
  const phoneText({
    super.key,
    required this.phoneNumber,
    required this.function,
    this.textColor = ColorManage.primary,
    this.fillColor = ColorManage.textFormColor,
    this.initCountryCode,
  });
  final Function function ;
  final TextEditingController phoneNumber;
  final Color textColor ;
  final Color fillColor;
  final String ?initCountryCode;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(

      validator: (value) {
        if ( value == ' ') {
          return 'phone must be not Empty';
        }

        return null;
      },
      controller:phoneNumber ,
      initialCountryCode : initCountryCode,
      decoration: InputDecoration(

        filled: true,
        fillColor: fillColor,
        isDense: true,
        //floatingLabelBehavior: FloatingLabelBehavior.auto,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),

          borderSide:  BorderSide(
            color: ColorManage.textFormColor,
            width: 1.w,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide:  BorderSide(
            color: ColorManage.textFormColor,
            width: 1.w,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 16.0.h,
          horizontal: 16.w,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide:  BorderSide(
            color: ColorManage.textFormColor,
            width: 1.w,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.5.w,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        suffixIconColor: ColorManage.textFormIconColor,
        focusColor: ColorManage.textFormColor,

        labelStyle: TextStyle(
          color: ColorManage.grey,
          fontSize: 15.sp,
        ),
        floatingLabelStyle: TextStyle(
          color:textColor,
          fontSize: 15.sp,
        ),
      ),
      cursorColor: textColor,


      style: TextStyle(
          color: textColor
      ),
      dropdownTextStyle: TextStyle(
          color:textColor
      ),

      onChanged: (phone)
      {
        print(  phone.countryCode);
        function(phone);
        print(phone.completeNumber);
      },
    );
  }
}

