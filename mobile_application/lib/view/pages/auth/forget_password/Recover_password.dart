import 'package:flutter/foundation.dart';
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
import '../../../../view_model/bloc/forget_password_cubit/forget_password_cubit.dart';
import '../../../components/core_components/custom_text_form_faild.dart';
import '../../../components/forget_password_components/custom_smoothIndecator.dart';

class RecoverPasswordScreen extends StatelessWidget {
  RecoverPasswordScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => ForgetPasswordCubit(),
  child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
   
      backgroundColor: ColorManage.primaryBlue,
      body: SafeArea(
        child: SingleChildScrollView(
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
                height: 765.h,
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
                         Align(
                            alignment: Alignment.center,
                            child: Text('Enter The Code You received',
                                style: getRegularStyle(
                                    color: ColorManage.secondaryBlack,
                                    fontSize: 20.sp,
                                    height: 1))),
                        SizedBox(height: 20.h),

                        //email falid
                         const CustomPin(),
                        //password's
                        CustomSmootIndicatior(index: 0,count: 2),

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
                                widget: const Text("Next"),
                                function: () {
                                  Navigator.pushNamed(context, Routes.createNewPassword) ;

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

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("I haven't receive the code yet ? ",
                                style: getBoldStyle(
                                    color: ColorManage.secondaryBlack, height: 1, fontSize: 24.sp)),
                            InkWell(
                                onTap: () {

                                },
                                child: Text("RESEND",
                                    style: getBoldStyle(
                                        color: ColorManage.primaryBlue,
                                        height: 1,
                                        fontSize: 24.sp))),
                          ],
                        ),
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
  },
),
);
  }
}

class CustomPin extends StatelessWidget {
  const CustomPin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      length: 4,
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
        if (kDebugMode) {
          print("Completed");
        }
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
