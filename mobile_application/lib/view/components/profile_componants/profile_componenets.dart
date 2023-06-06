import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/view_model/bloc/profile_cubit/profile_cubit.dart';

import '../../../core/resource/color_mananger.dart';

Widget profileComponents(
    {required BuildContext context,
      required String iconName,
      required String name,
      required Widget screen,
      required int index ,
      required Function function,
      required ProfileCubit cubit,
    }) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 6.0.h),
    child: InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return BlocProvider.value(
            child: screen,
            value: cubit,
          );
        }));
        // function();
      },
      child: Row(
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundColor: ColorManage.catCardColor,
            child: SvgPicture.asset(
              'assets/icons/$iconName.svg',
              color: ColorManage.primaryBlue,
              height: 20.sp,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
             '$name',
            style: Theme.of(context).textTheme.headline6!.copyWith(
              color: ColorManage.primaryBlue,
              fontSize: 16.sp,
          ),),
          Spacer(),
          const Icon(Icons.arrow_forward_ios_outlined),
        ],
      ),
    ),
  );
}