import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/view/components/core_components/custom_button.dart';
import 'package:graduation_project/view/pages/layout_screen/layout_screen.dart';

import '../../../core/resource/assets_manager.dart';
import '../../../core/resource/color_mananger.dart';
import '../../../core/resource/style_manager.dart';
class BookedSuccessfulyScreen extends StatelessWidget {
  const BookedSuccessfulyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                """Congratulations!\nYour Booking Is Complete""",
                style: getBoldStyle(
                    color: ColorManage.primaryBlue,
                    height: 1,
                    fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 0.02.sh,
              ),
              SvgPicture.asset(AssetsManager.confiremd) ,
              const SizedBox(height: 10,),
              CustomButton(widget: Text("Home") , function: ()
              {
                Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder:
                (context) {
                  return  LayoutScreen();
                },
                ), (route) => false);
              }, color: ColorManage.primaryYellow)
            ]),
      ),
    );
  }
}
