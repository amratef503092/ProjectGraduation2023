import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resource/routes_manager.dart';

import '../../../core/resource/color_mananger.dart';
import '../../components/core_components/custom_body.dart';
import '../../components/core_components/custom_room_card/custom_room_card.dart';
class SelectRoomScreen extends StatelessWidget {
  const SelectRoomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorManage.primaryBlue,
      body: CustomBody(
        textAppBar: "Select Room",
        widget: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 24.0.w,vertical: 20),
          child: ListView.separated(
            itemCount: 10,
            separatorBuilder: (context, index) {
              return SizedBox(height: 20.h,);
            },

            itemBuilder:
              (context, index)
          {
            return CustomRoomCard(
              image: [
                "https://th.bing.com/th/id/OIP.5Cv2TC5IFIzLd-8lqCjmugHaE7?pid=ImgDet&rs=1",
                "https://th.bing.com/th/id/OIP.5Cv2TC5IFIzLd-8lqCjmugHaE7?pid=ImgDet&rs=1",
                "https://th.bing.com/th/id/OIP.5Cv2TC5IFIzLd-8lqCjmugHaE7?pid=ImgDet&rs=1",
              ],
              title: "Room One",
              save: (){},
              functionCard: (){
                Navigator.pushNamed(context,Routes.RoomDetailsScreen );
              },
              rate: 2,
              price: "2",
              discount: "2",
              function: (){},
              reviwe: "review",
              imageHeight: 145.h,
              imageWidth: 366.w,
              cardWidth: 366.w,
              cardHeight: 447.h,

            );
          },),
        )
      ),
    );
  }
}
