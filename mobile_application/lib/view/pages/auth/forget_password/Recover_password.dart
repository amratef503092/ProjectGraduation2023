import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/core/resource/color_mananger.dart';
import 'package:graduation_project/core/resource/routes_manager.dart';
import 'package:graduation_project/core/resource/style_manager.dart';
import 'package:graduation_project/view/components/core_components/custom_button.dart';
import 'package:graduation_project/view_model/bloc/auth_cubit/auth_cubit.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/resource/validator.dart';
import '../../../components/core_components/custom_text_form_faild.dart';

class RecoverPasswordScreen extends StatelessWidget {
  RecoverPasswordScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManage.primaryBlue,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: ColorManage.primaryYellow,
                        size: 36.sp,
                      )),
                  SizedBox(
                    width: 75.w,
                  ),
                  Center(
                      child: Text("Forget Password",
                          style: getSemiBoldStyle(
                              color: Colors.white, height: 1, fontSize: 28.h))),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height-0.20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40.r),
                      topLeft: Radius.circular(40.r),
                    ),
                    color: Colors.white),
                child: Padding(
                  padding: EdgeInsets.all(24.sp),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.h),
                        const Align(
                            alignment: Alignment.topLeft,
                            child: Text('Email')),
                        //email falid
                        PinCodeTextField(
                          length: 6,
                          obscureText: false,
                          animationType: AnimationType.fade,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 50,
                            fieldWidth: 40,
                            activeFillColor: Colors.white,
                          ),
                          animationDuration: Duration(milliseconds: 300),
                          backgroundColor: Colors.blue.shade50,
                          enableActiveFill: true,

                          onCompleted: (v) {
                            print("Completed");
                          },
                          onChanged: (value) {
                            print(value);
                            // setState(() {
                            //   currentText = value;
                            // });
                          },
                          beforeTextPaste: (text) {
                            print("Allowing to paste $text");
                            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                            //but you can show anything you want here, like your pop up saying wrong paste format or etc
                            return true;
                          }, appContext: context,
                        ),
                        //password's


                        SizedBox(height: 30.h),
                        //sign in button
                        BlocBuilder<AuthCubit, AuthState>(
                          buildWhen: (pre, current) {
                            if (current is SignInLoadingState) {
                              return true;
                            } else if (current is SignInSuccessfulState) {
                              return true;
                            } else if (current is SignInErrorState) {
                              return true;
                            } else {
                              return false;
                            }
                          },
                          builder: (context, state) {
                            return (state is SignInLoadingState)
                                ? const Center(
                                child:
                                CircularProgressIndicator.adaptive())
                                : CustomButton(
                                widget: const Text("Receive Code"),
                                function: () {
                                  // if (formKey.currentState!.validate()) {
                                  //   AuthCubit.get(context).signIn(
                                  //       password: passwordController.text,
                                  //       email: emailController.text);
                                  // }
                                },
                                color: ColorManage.primaryYellow,
                                disable: true);
                          },
                        ),
                        SizedBox(height: 25.h),
                        //Register now
                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

