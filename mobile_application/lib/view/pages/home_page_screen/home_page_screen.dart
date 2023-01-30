import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resource/color_mananger.dart';
import 'package:graduation_project/core/resource/style_manager.dart';

import '../../../core/resource/routes_manager.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
      children: [
          SizedBox(
            height: 50.h,
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 55.r,
                backgroundColor: ColorManage.primaryBlue,
                child: CircleAvatar(
                  radius: 50.r,
                  backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTH6PjyUR8U-UgBWkOzFe38qcO29regN43tlGGk4sRd&s"),
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Column(
crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Hi Zack",
                      style: TextStyle(
                          color: ColorManage.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children:  [
                     const Icon(Icons.location_on_outlined ,color: ColorManage.primaryBlue),
                     Text("Your Location Now" ,
                     style: getRegularStyle(
                         color: ColorManage.primaryBlue,
                         fontSize: 20.sp,
                     height: 1),)
                   ],
                 )
                ],
              ),
              Spacer(),
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.settingScreen);
                  },
                  icon: const Icon(
                    Icons.settings,
                    color: ColorManage.primaryBlue,
                  ))

            ],
          )
      ],
    ),
        ));
  }
}
