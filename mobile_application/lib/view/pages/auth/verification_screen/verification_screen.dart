import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resource/routes_manager.dart';

import '../../../../core/resource/color_mananger.dart';
import '../../../../core/resource/style_manager.dart';
import '../../../components/core_components/custom_pin/custom_pin.dart';
import '../../../components/forget_password_components/custom_smoothIndecator.dart';

class VerificationEmailScreen extends StatelessWidget {
  VerificationEmailScreen({Key? key}) : super(key: key);

  @override
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
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

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 32.0),
                        child: Text(
                          "Verification",
                          textAlign: TextAlign.center,
                            style: getSemiBoldStyle(
                                color: Colors.white,
                                height: 1,
                                fontSize: 28.h)
                        ),
                      ),
                    ),
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
                          CustomPin(onCompleted: (v) {
                            Navigator.pushNamed(context, Routes.storeDetailsRoute);
                          }),
                          //password's
                          CustomSmootIndicatior(index: 0, count: 2),

                          SizedBox(height: 30.h),
                          //sign in button
                          // BlocBuilder<AuthCubit, AuthState>(
                          //   buildWhen: (pre, current) {
                          //     if (current is SignInLoadingState) {
                          //       return true;
                          //     } else if (current is SignInSuccessfulState) {
                          //       return true;
                          //     } else if (current is SignInErrorState) {
                          //       return true;
                          //     } else {
                          //       return false;
                          //     }
                          //   },
                          //   builder: (context, state) {
                          //     return (state is SignInLoadingState)
                          //         ? const Center(
                          //         child:
                          //         CircularProgressIndicator.adaptive())
                          //         : CustomButton(
                          //         widget: const Text("Next"),
                          //         function: () {
                          //           Navigator.pushNamed(context, Routes.createNewPassword) ;
                          //
                          //           // if (formKey.currentState!.validate()) {
                          //           //   AuthCubit.get(context).signIn(
                          //           //       password: passwordController.text,
                          //           //       email: emailController.text);
                          //           // }
                          //         },
                          //         color: ColorManage.primaryYellow,
                          //         disable: true);
                          //   },
                          // ),
                          SizedBox(height: 25.h),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("I haven't receive the code yet ? ",
                                  style: getBoldStyle(
                                      color: ColorManage.secondaryBlack,
                                      height: 1,
                                      fontSize: 24.sp)),
                              InkWell(
                                  onTap: () {},
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
      ),
    );
  }
}
