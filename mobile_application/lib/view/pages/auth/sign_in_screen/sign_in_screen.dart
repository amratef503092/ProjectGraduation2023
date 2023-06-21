import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/core/resource/color_mananger.dart';
import 'package:graduation_project/core/resource/routes_manager.dart';
import 'package:graduation_project/core/resource/style_manager.dart';
import 'package:graduation_project/view/components/core_components/custom_button.dart';
import 'package:graduation_project/view_model/bloc/auth_cubit/auth_cubit.dart';

import '../../../../core/resource/validator.dart';
import '../../../components/core_components/custom_text_form_faild.dart';
import '../../../components/core_components/toast_message.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                      child: Text("Sign In To Travel".tr(),
                          style: getSemiBoldStyle(
                              color: Colors.white, height: 1, fontSize: 28.h))),
                ],
              ),
              Container(
                height: 720.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40.r),
                      topLeft: Radius.circular(40.r),
                    ),
                    color: Colors.white),
                child: Padding(
                  padding: EdgeInsets.all(24.sp),
                  child: SafeArea(
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 20.h),
                           Align(
                              alignment: Alignment.topLeft,
                              child: Text('Email'.tr())),
                          //email falid
                          CustomTextField(
                              iconData: const Icon(Icons.email),
                              controller: emailController,
                              hint: 'Email'.tr(),
                              fieldValidator: emailValidator),
                          const SizedBox(height: 10),
                          //password's
                           Align(
                              alignment: Alignment.topLeft,
                              child: Text('password'.tr())),

                          BlocConsumer<AuthCubit, AuthState>(
                            listener: (context, state) {
                              // TODO: implement listener
                            },
                            builder: (context, state) {
                              return CustomTextField(
                                iconData: const Icon(FontAwesomeIcons.lock),
                                fieldValidator: (value){
                                  if(value!.isEmpty)
                                    {
                                      return 'password is empty';
                                    }
                                },
                                controller: passwordController,
                                hint: 'password'.tr(),
                                password: AuthCubit.get(context).visibility,
                                passwordTwo: true,
                                function: ()
                                {
                                  AuthCubit.get(context).changeState();
                                },
                              );
                            },
                          ),

                          SizedBox(height: 30.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Remember Password",
                                    style: getSemiBoldStyle(
                                        color: ColorManage.secondaryBlack,
                                        fontSize: 10.sp,
                                        height: 1),
                                  ),
                                  BlocBuilder<AuthCubit, AuthState>(
                                    buildWhen: (previous, current) {
                                      if (current is RememberMe) {
                                        return true;
                                      } else {
                                        return false;
                                      }
                                    },
                                    builder: (context, state) {
                                      return Checkbox(
                                          value: AuthCubit.get(context)
                                              .rememberMe,
                                          onChanged: (value) {
                                            AuthCubit.get(context)
                                                .changeStateRemember();
                                          });
                                    },
                                  )
                                ],
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, Routes.forgotPasswordRoute);
                                  },
                                  child:  Text("Forget Password" ,style: TextStyle(fontSize: 10.sp),))
                            ],
                          ),
                          //sign in button
                          BlocConsumer<AuthCubit, AuthState>(
                            listener: (context, state) {
                              if (state is SignInSuccessfulState)
                              {
                                toastMessage(
                                  color: ColorManage.primaryYellow,
                                  message: "Welcome To Travel X"
                                );
                                Navigator.pushNamed(context, Routes.LayoutScreen);

                              } else if (state is SignInErrorState) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(state.error),
                                  backgroundColor: ColorManage.redError,
                                ));
                              }
                            },
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
                                      widget: const Text("Sign In"),
                                      function: () {
                                        if (formKey.currentState!.validate())
                                        {
                                          AuthCubit.get(context).signIn(
                                              password: passwordController.text,
                                              email: emailController.text);
                                        }
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
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("I don’t have account yet? ",
                      style: getSemiBoldStyle(
                          color: Colors.white, height: 1, fontSize: 24.sp)),
                  InkWell(
                      onTap: ()
                      {
                        Navigator.pushNamed(context, Routes.signUp);
                      },
                      child: Text("Create",
                          style: getSemiBoldStyle(
                              color: ColorManage.primaryYellow,
                              height: 1,
                              fontSize: 24.sp))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
