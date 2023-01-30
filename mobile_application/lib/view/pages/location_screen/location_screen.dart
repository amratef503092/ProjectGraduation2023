import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resource/color_mananger.dart';
import 'package:graduation_project/core/resource/style_manager.dart';
import 'package:graduation_project/view/components/core_components/custom_text_form_faild.dart';
import 'package:graduation_project/view/components/forget_password_components/custom_smoothIndecator.dart';

import '../../components/core_components/custom_button.dart';
class LocationScreen extends StatelessWidget {
   LocationScreen({Key? key}) : super(key: key);
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children:
            [
              SizedBox(
                height: 50.h,
              ),
              // Welcome text
              Text(
                "Welcome Batota" ,
              style: getRegularStyle(
                  color: ColorManage.primaryBlue,
                  height: 1 ,
                fontSize: 32.h,
              ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Could you tell us where you live to get local suggestions, recommendations and more" ,
                style: getRegularStyle(
                  color: ColorManage.secondaryBlack,
                  height: 1 ,
                  fontSize: 16.h,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              TextButton(onPressed: (){}, child: Text(
                "SKIP FOR NOW",
                style: getRegularStyle(
                  color: ColorManage.primaryBlue,
                  height: 1 ,
                  fontSize: 16.h,
                ),
              )),
              SizedBox(
                height: 10.h,
              ),
              // location
              CustomTextField(controller:_controller ,
                  hint: "I live in",
                  fieldValidator: (){
                    if(_controller.text.isEmpty){
                      return "Please enter your location";
                    }
                    return null;

                  },
                iconData: Icon(Icons.location_on_outlined ,
                color: ColorManage.primaryBlue,
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Center(child: CustomSmootIndicatior(index: 0, count: 2)),
              SizedBox(
                height: 50.h,
              ),
              // next button
              Center(
                child: CustomButton(
                  color: ColorManage.primaryYellow,
                  function: (){},
                  disable: true,
                  widget: Text(
                    "NEXT",
                    style: getRegularStyle(
                      color: ColorManage.background,
                      height: 1 ,
                      fontSize: 16.h,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
