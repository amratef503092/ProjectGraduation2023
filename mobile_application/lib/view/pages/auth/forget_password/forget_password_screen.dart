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
import '../../../components/core_components/custom_body.dart';
import '../../../components/core_components/custom_text_form_faild.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManage.primaryBlue,

      body: CustomBody(widget: Padding(
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
              CustomTextField(
                  iconData: Icon(Icons.email),

                  controller: emailController,
                  hint: 'email',
                  fieldValidator: emailValidator),
              const SizedBox(height: 10),
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
                        Navigator.pushNamed(context, Routes.recoverPassword) ;
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
      ),textAppBar: 'Forget Password',),
    );
  }
}



