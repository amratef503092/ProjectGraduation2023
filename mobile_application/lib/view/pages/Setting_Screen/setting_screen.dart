import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resource/color_mananger.dart';
import 'package:graduation_project/core/resource/routes_manager.dart';
import 'package:graduation_project/core/resource/style_manager.dart';
import 'package:graduation_project/view/components/core_components/custom_body.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManage.primaryBlue,
        body: CustomBody(
            widget: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Preferences",
                        style: getSemiBoldStyle(
                            fontSize: 24.sp,
                            color: ColorManage.primaryBlue,
                            height: 1),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                       CustomCardSetting(
                        onTap: () {
                          context.setLocale(const Locale('ar'));
                        },
                        title: "Language".tr(),
                        select: "العربيه",
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomCardSetting(
                        onTap: () {
                          context.setLocale(const Locale('en'));
                        },
                        title: "Language".tr(),
                        select: "English",
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      // CustomCardSetting(
                      //   onTap: () {
                      //     Navigator.pushNamed(context, Routes.UnitScreen);
                      //
                      //   },
                      //   title: "Language",
                      //   select: "English",
                      // ),
                      // SizedBox(
                      //   height: 20.h,
                      // ),
                      // CustomCardSetting(
                      //   onTap: ()
                      //   {
                      //     Navigator.pushNamed(context, Routes.welcomePage);
                      //   },
                      //   title: "Interstes ",
                      //   select: "select",
                      // ),
                      // SizedBox(
                      //   height: 20.h,
                      // ),

                    ],
                  ),
                ),
              ),
            ),
            textAppBar: "Setting"));
  }
}

class CustomCardSetting extends StatelessWidget {
   CustomCardSetting({

    Key? key,
   required this.title,
     required this.select,
     required this.onTap,
  }) : super(key: key);
  String ?title;
  String ?select;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: ListTile(
        title: Text(
          title!,
          style: getRegularStyle(
              color: ColorManage.secondaryBlack,
              height: 1,
              fontSize: 16),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              select!,
              style: getRegularStyle(
                  fontSize: 16.sp,
                  color: ColorManage.primaryBlue,
                  height: 1),
            ),
            Icon(
              Icons.arrow_forward_ios_sharp,
              color: ColorManage.primaryYellow,
              size: 16.sp,
            )
          ],
        ),
        onTap: () {
          onTap!();
        },
      ),
    );
  }
}
