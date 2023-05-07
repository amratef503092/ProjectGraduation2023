import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/view_model/bloc/auth_cubit/auth_cubit.dart';
import 'package:motion_toast/motion_toast.dart';

import '../../../../core/resource/color_mananger.dart';
import '../../../../core/resource/routes_manager.dart';
import '../../../../core/resource/style_manager.dart';
import '../../../components/core_components/custom_body.dart';
import '../../../components/core_components/custom_pin/custom_pin.dart';

class VerificationEmailScreen extends StatelessWidget {
  VerificationEmailScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is VerifyEmailErrorState) {
            MotionToast.error(
              title: Text(state.error),
              description: const Text('Please try again'),
            ).show(context);
          }else if (state is SendOtpVerifyEmailSuccessfulState)
            {
              MotionToast.success(
                title: Text(state.message),
                description: const Text('Check your email'),
              ).show(context);
            }else if(state is VerifyEmailSuccessfulState)
              {

                Navigator.pushReplacementNamed(context, Routes.welcomePage);
              }
          // TODO: implement listener
        },
        builder: (context, state) {
          return CustomBody(
            isBack: false,
            colorAppBar: ColorManage.primaryBlue,
            colorBackGround: ColorManage.background,
            widget: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20.h),
                    Text(
                      'Enter the code you received by phone number or find in your email',
                      style: getRegularStyle(
                          color: ColorManage.secondaryBlack,
                          fontSize: 20.sp,
                          height: 1.5),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20.h),

                    //email Field
                    CustomPin(onCompleted: (v) {
                      AuthCubit.get(context).verifyEmail(v);
                      // Navigator.pushNamed(context, Routes.welcomePage);
                    }),
                    //password's

                    SizedBox(height: 30.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("I haven't receive the code yet ? ",
                            style: getBoldStyle(
                                color: ColorManage.secondaryBlack,
                                height: 1,
                                fontSize: 24.sp)),
                        InkWell(
                            onTap: () {
                              AuthCubit.get(context).sendOtpVerifyEmail(AuthCubit.get(context).email!);
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
            textAppBar: "Verify Account",
          );
        },
      ),
    );
  }
}
