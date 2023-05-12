import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/core/resource/assets_manager.dart';
import 'package:graduation_project/core/resource/color_mananger.dart';
import 'package:graduation_project/core/resource/style_manager.dart';
import 'package:graduation_project/model/register_response_model/register_response_model.dart';
import 'package:graduation_project/view_model/bloc/activity_cubit/activity_cubit.dart';
import 'package:graduation_project/view_model/bloc/booked-cubit/cubit/booked_cubit.dart';

class ConFormationScreen extends StatelessWidget {
  const ConFormationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BookedCubit.get(context)
        ..bookActivity(
          date: DateTime.now().toString(),
          id: ActivityCubit.get(context).activityModel2!.id,
          numberOfPepole: ActivityCubit.get(context).numberOfPeople,
        ),
      child: BlocConsumer<BookedCubit, BookedState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: SizedBox(
              height: 1.sh,
              width: 1.sw,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                    SvgPicture.asset(AssetsManager.confiremd)
                  ]),
            ),
          );
        },
      ),
    );
  }
}
