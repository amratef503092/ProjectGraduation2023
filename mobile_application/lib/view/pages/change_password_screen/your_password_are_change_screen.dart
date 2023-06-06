import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ChangePasswordSuccessfuly extends StatelessWidget {
  const ChangePasswordSuccessfuly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Change Password',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
      children: [
          SvgPicture.asset(
            'assets/icons/create_new_password.svg',),
          SizedBox(height: 25.h,),
          Text('Your password has been changed successfully' ,
          style: TextStyle(
            fontSize: 20,
            color: Color(0xff9C9C9C),
            fontWeight: FontWeight.bold,
          ),
          ),
      ],
    ),
        ));
  }
}
