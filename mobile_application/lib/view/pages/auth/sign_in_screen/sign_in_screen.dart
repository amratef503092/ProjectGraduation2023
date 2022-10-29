import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resource/color_mananger.dart';
import 'package:graduation_project/view/components/core_components/custom_button.dart';
import 'package:graduation_project/view_model/bloc/auth_cubit/auth_cubit.dart';

import '../../../../core/resource/validator.dart';

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: ColorManage.primaryYellow,
                        size: 36.sp,
                      )),
                  const Center(
                      child: Text('Amr is here',
                          style: TextStyle(color: Colors.red))),
                  IconButton(
                      onPressed: () {

                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: ColorManage.primaryYellow,
                        size: 36.sp,
                      )),
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
                child: SafeArea(
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.h),
                        //email falid
                        CustomTextField(
                            controller: emailController,
                            hint: 'email',
                            fieldValidator: emailValidator),
                        const SizedBox(height: 10),
                        //password's
                        BlocConsumer<AuthCubit, AuthState>(
                          listener: (context, state) {
                            // TODO: implement listener
                          },
                          builder: (context, state) {
                            return CustomTextField(
                              fieldValidator: passwordValidator,
                              controller: passwordController,
                              hint: 'password',
                              password: AuthCubit.get(context).visibility,
                              passwordTwo: true,
                              function: () {
                                AuthCubit.get(context).changeState();
                              },
                            );
                          },
                        ),

                        const SizedBox(height: 10),
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
                                    child: CircularProgressIndicator.adaptive())
                                : CustomButton(
                                    widget: const Text("Sign In"),
                                    function: () {
                                      if (formKey.currentState!.validate()) {
                                        AuthCubit.get(context).signIn(
                                            password: passwordController.text,
                                            email: emailController.text);
                                      }
                                    },
                                    color: ColorManage.primaryYellow,
                                    disable: true);
                          },
                        ),
                        const SizedBox(height: 25),
                        //regster now
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Not a Member?',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'register now',
                              style: TextStyle(
                                color: Colors.indigoAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
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

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.controller,
    required this.hint,
    this.password = false,
    this.passwordTwo = false,
    this.function,
    required this.fieldValidator,
    Key? key,
  }) : super(key: key);
  final TextEditingController controller;
  final String hint;
  final bool password;
  final bool passwordTwo;
  final Function fieldValidator;
  final Function? function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0.w),
      child: TextFormField(
        controller: controller,
        validator: (value) => fieldValidator(value),
        decoration: InputDecoration(
            errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: ColorManage.redError)),
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: ColorManage.gray)),
            hintText: hint,
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
      ),
    );
  }
}
