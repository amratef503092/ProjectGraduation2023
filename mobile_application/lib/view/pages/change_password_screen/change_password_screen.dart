import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/core/resource/color_mananger.dart';
import 'package:graduation_project/view/components/core_components/custom_button.dart';
import 'package:graduation_project/view/components/core_components/custom_text_form_faild.dart';
import 'package:graduation_project/view_model/bloc/profile_cubit/profile_cubit.dart';


import '../../components/text/text_custom.dart';


class ChangePasswordScreen extends StatefulWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool currentPassword = true;
  bool newPassword = true;
  bool confirmPassword = true;
  RegExp regExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RegExp passwordRegex =
  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
  String passswordErrorMessage = "Must be at least 6 characters long including uppercase, lowercase, number";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextCustom(
            text: 'Change Password',
            color: ColorManage.black,
            fontSize: 20.sp,
          ),
          centerTitle: true,
        ),
        body: BlocConsumer<ProfileCubit, ProfileState>
          (
          listener: (context, state)
          {

            // TODO: implement listener
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 150.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          'assets/icons/lockLogo.svg',
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      TextCustom(
                        text: 'New Password',
                        textAlign: TextAlign.start,
                        color: ColorManage.textFormLabelColor,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomTextField(
                        controller: passwordController,
                        hint: 'New  password',
                        iconData: Icon(Icons.lock),
                        fieldValidator: (v) {
                          if (v!.isEmpty) {
                            return 'Password must be not empty';
                          } else if (!passwordRegex.hasMatch(v)) {
                            return passswordErrorMessage;
                          }
                          return null;
                        },
                        keyboardType: TextInputType.visiblePassword,

                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      (state is ChangePasswordLoadingState )? const
                      Center(
                        child: CircularProgressIndicator.adaptive(),
                      ):CustomButton(widget: TextCustom(
                        text: 'Change Password',
                        color: ColorManage.white,
                        fontSize: 20.sp,
                      ),
                          function: () {
                            if (formKey.currentState!.validate()) {
                              ProfileCubit.get(context).changePassword(
                                  passwordController.text,
                              );
                            }
                          }, color: ColorManage.primaryBlue)
                      // TextCustom(
                      //   text: 'New Password',
                      //   textAlign: TextAlign.start,
                      //   color: ColorManage.textFormLabelColor,
                      // ),
                      // SizedBox(
                      //   height: 5.h,
                      // ),
                      // TextFormFieldCustom(
                      //   controller: newPasswordController,
                      //   hint: 'New password',
                      //   validate: (v) {
                      //     if (v!.isEmpty) {
                      //       return 'Password must be not empty';
                      //     } else if (!regExp.hasMatch(v)) {
                      //       return 'Password must be at least 8 characters, contain at least one uppercase letter, one lowercase letter, and one number';
                      //     }
                      //     return null;
                      //   },
                      //   keyboardType: TextInputType.visiblePassword,
                      //   suffixIcon: newPassword
                      //       ? Icon(Icons.visibility)
                      //       : Icon(Icons.visibility_off),
                      //   suffix: true,
                      //   obSecure: newPassword,
                      //   suffixOnPressed: () {
                      //     setState(() {
                      //       newPassword = !newPassword;
                      //     });
                      //   },
                      // ),


                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
