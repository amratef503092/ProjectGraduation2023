import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resource/color_mananger.dart';
import 'package:graduation_project/view/components/core_components/custom_body.dart';
class CreateProgramScreen extends StatelessWidget {
  const CreateProgramScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManage.primaryBlue,
      body: CustomBody(
        textAppBar: 'Create Program',
        widget: SizedBox(
          width: double.infinity,
          child: Column(
            children:
             [
              SizedBox(height: 20.sp,),
              Text("Select your destination"
              ,
              style: TextStyle(
                color: ColorManage.black,
                fontSize: 30.sp,
                fontWeight: FontWeight.bold
              ),
              ),
              SizedBox(height: 20.sp,),
               // select country
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: DropdownButton(

                 isExpanded: true
                 ,items: [
                   "Egypt",
                    "USA",

                 ].map((e) {
                    return DropdownMenuItem(
                      child: Text(e),
                      value: e,
                    );
                 } ).toList(),
                     value: "Egypt"
                     ,onChanged: (value) {  },),
               ),
                SizedBox(height: 20.sp,),
               Text("Select your destination"
                 ,
                 style: TextStyle(
                     color: ColorManage.black,
                     fontSize: 30.sp,
                     fontWeight: FontWeight.bold
                 ),
               ),
               SizedBox(height: 20.sp,),
               // select country
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: DropdownButton(

                   isExpanded: true
                   ,items: [
                   "Egypt",
                   "USA",

                 ].map((e) {
                   return DropdownMenuItem(
                     child: Text(e),
                     value: e,
                   );
                 } ).toList(),
                   value: "Egypt"
                   ,onChanged: (value) {  },),
               ),
               Text("Select your destination"
                 ,
                 style: TextStyle(
                     color: ColorManage.black,
                     fontSize: 30.sp,
                     fontWeight: FontWeight.bold
                 ),
               ),
               SizedBox(height: 20.sp,),
               // select country
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: DropdownButton(

                   isExpanded: true
                   ,items: [
                   "Egypt",
                   "USA",

                 ].map((e) {
                   return DropdownMenuItem(
                     child: Text(e),
                     value: e,
                   );
                 } ).toList(),
                   value: "Egypt"
                   ,onChanged: (value) {  },),
               ),
               Text("Select your destination"
                 ,
                 style: TextStyle(
                     color: ColorManage.black,
                     fontSize: 30.sp,
                     fontWeight: FontWeight.bold
                 ),
               ),
               SizedBox(height: 20.sp,),
               // select country
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: DropdownButton(

                   isExpanded: true
                   ,items: [
                   "Egypt",
                   "USA",

                 ].map((e) {
                   return DropdownMenuItem(
                     child: Text(e),
                     value: e,
                   );
                 } ).toList(),
                   value: "Egypt"
                   ,onChanged: (value) {  },),
               ),
            ],
          ),
        ),
      ),
    );
  }
}
