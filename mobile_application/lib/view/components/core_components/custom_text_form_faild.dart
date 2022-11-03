import 'package:flutter/material.dart';

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
    Key? key,
  }) : super(key: key);
  final TextEditingController controller;
  final String hint;
  final bool password;
  final bool passwordTwo;
  final Function fieldValidator;
  final Function? function;
  final Widget ?iconData;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) => fieldValidator(value),
      decoration: InputDecoration(
          errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: ColorManage.redError)),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: ColorManage.gray)),
          hintText: hint,
          prefixIcon: (iconData==null)?SizedBox():iconData!,
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
