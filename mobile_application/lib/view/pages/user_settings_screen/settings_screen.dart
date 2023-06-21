import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resource/color_mananger.dart';
import '../../../view_model/bloc/profile_cubit/profile_cubit.dart';
import '../../components/settings/settings.dart';
import '../../components/text/text_custom.dart';
import '../change_password_screen/change_password_screen.dart';
import '../personal_information/personal_information.dart';


class UserSettingsScreen extends StatefulWidget {
  const UserSettingsScreen({Key? key}) : super(key: key);

  @override
  State<UserSettingsScreen> createState() => _UserSettingsScreenState();
}

class _UserSettingsScreenState extends State<UserSettingsScreen> {
  bool isToggled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'.tr(), style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextCustom(
              text: 'Account Settings'.tr(),
              fontSize: 16.sp,
              color: ColorManage.settingsGrey,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(
              height: 25.h,
            ),
            settingItem(
                context: context,
                lable: 'Personal information'.tr(),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BlocProvider.value(
                      value: BlocProvider.of<ProfileCubit>(context),
                      child: PersonalInformationScreen(),
                    );
                  },));
                }),
            SizedBox(
              height: 36.h,
            ),
            settingItem(
              context: context,
              lable: 'Change password'.tr(),
              onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)
                {
                  return ChangePasswordScreen();
                },));
              },
            ),
            // SizedBox(
            //   height: 36.h,
            // ),
            // Row(
            //   children: [
            //     TextCustom(
            //       text: 'Push Notification',
            //       fontSize: 16.sp,
            //       color: ColorManage.black,
            //       fontWeight: FontWeight.w500,
            //     ),
            //     const Spacer(),
            //     FlutterSwitch(
            //       height: 23.0,
            //       width: 45.0,
            //       padding: 2.0,
            //       toggleSize: 18.0,
            //       borderRadius: 20.0,
            //       activeColor: ColorManage.primary,
            //       value: isToggled,
            //       onToggle: (value) {
            //         setState(() {
            //           isToggled = value;
            //         });
            //       },
            //     ),
            //   ],
            // ),
            SizedBox(
              height: 40.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              color: ColorManage.grey1,
              width: double.infinity,
              height: 1,
            ),
            SizedBox(
              height: 20.h,
            ),
            TextCustom(
              text: 'More'.tr(),
              color: ColorManage.settingsGrey,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 16.h,
            ),
            settingItem(
              context: context,
              lable: 'About Us'.tr(),
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => AboutUs()));
              },
            ),
            SizedBox(
              height: 36.h,
            ),
            settingItem(
                context: context,
                lable: 'Privacy policy'.tr(),
                onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => PrivacyPolicy()));
                }),
            SizedBox(
              height: 36.h,
            ),
            // settingItem(
            //     context: context,
            //     lable: 'Delete account',
            //     onPressed: () {
            //       Navigator.push(context,
            //           MaterialPageRoute(builder: (context) => DeleteAccountScreen()));
            //     }),
            Spacer(),
            // Center(child: InkWell(
            //   onTap: (){
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => DeleteAccountScreen()));
            //   },
            //   child: TextCustom(text:  "Delete Account" ,
            //   decoration: TextDecoration.underline,
            //     color: ColorManage.red,
            //   ),
            // )),
          ],
        ),
      ),
    );
  }
}
