import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resource/color_mananger.dart';
class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.controller,
    required this.hint,
    this.password = false,
    this.passwordTwo = false,
    this.function,
    required this.fieldValidator,
    this.iconData,
    this.border = false,
    this.keyboardType = TextInputType.text,
    this.enable = true,
    Key? key,
  }) : super(key: key);
  final TextEditingController controller;
  final String hint;
  final bool password;
  final bool passwordTwo;
  final Function fieldValidator;
  final Function? function;
  final Widget ?iconData;
  final bool ?border;
  final TextInputType ?keyboardType;
  final bool ?enable;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      enabled: enable,
      validator: (value) => fieldValidator(value),
      decoration: InputDecoration(
        border: border==true?InputBorder.none:OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(
            color: ColorManage.primaryBlue,
          ),
        ),
          errorBorder:  const UnderlineInputBorder(
              borderSide: BorderSide(color: ColorManage.redError)),
          enabledBorder:(border!)?InputBorder.none: const UnderlineInputBorder(
              borderSide: BorderSide(color: ColorManage.gray)),
          hintText: hint,
          prefixIcon: (iconData==null)?const SizedBox():iconData!,
          suffix: (passwordTwo)
              ? GestureDetector(
            child: (password)
                ? const Icon(Icons.visibility_outlined)
                : const Icon(Icons.visibility_off),
            onTap: () {
              function!();
            },
          )
              : SizedBox()),
      obscureText: password,
    );
  }
}
