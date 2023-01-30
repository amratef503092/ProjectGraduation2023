import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resource/color_mananger.dart';
import 'package:graduation_project/core/resource/style_manager.dart';
import 'package:graduation_project/view/components/core_components/custom_body.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/resource/validator.dart';
import '../../../components/core_components/custom_button.dart';
import '../../../components/core_components/custom_text_form_faild.dart';
import '../../../components/forget_password_components/custom_smoothIndecator.dart';
class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManage.primaryBlue,
      body: CustomBody(
          widget: Padding(
        padding: EdgeInsets.all(24.sp),
    child:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        SizedBox(height: 20.h),
            const Align(
                alignment: Alignment.topLeft,
                child: Text('Email')),
            //email falid
            CustomTextField(
                iconData: const Icon(Icons.lock)
                ,controller: TextEditingController(),
                password: true,
                passwordTwo: true,
                function: () {},
                hint: 'New Password',
                fieldValidator: emailValidator),
            SizedBox(height: 30.h),

            CustomTextField(
              iconData: const Icon(Icons.lock)
              ,controller: TextEditingController(),
              password: true,
              passwordTwo: true,
              function: () {},
              hint: 'New Password',
              fieldValidator: emailValidator),
          SizedBox(height: 30.h),
           CustomSmootIndicatior(index: 1,count: 2),
          SizedBox(height: 30.h),

          CustomButton(
              widget: const Text("Create New Password"),
              function: () {
                // if (formKey.currentState!.validate()) {
                //   AuthCubit.get(context).signIn(
                //       password: passwordController.text,
                //       email: emailController.text);
                // }
                // Navigator.pushNamed(context, Routes.recoverPassword) ;
              },
              color: ColorManage.primaryYellow,
              disable: true),
          const SizedBox(height: 10),])), textAppBar: 'Create New Password'),
    );
  }
}

