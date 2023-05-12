import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/core/resource/color_mananger.dart';
import 'package:graduation_project/core/resource/style_manager.dart';
import 'package:graduation_project/view/components/core_components/custom_button.dart';

import '../../../core/resource/validator.dart';
import '../../../view_model/bloc/booked-cubit/cubit/booked_cubit.dart';
import '../../components/core_components/custom_text_form_faild.dart';

class ContanctDetailsScreen extends StatelessWidget {
  const ContanctDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BookedCubit cubit = BookedCubit.get(context);
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Contact Details',
            style: getSemiBoldStyle(
                color: ColorManage.primaryBlue, height: 1, fontSize: 20),
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomTextField(
              iconData: const Icon(FontAwesomeIcons.user),
              controller: cubit.nameController,
              hint: 'Name',
              fieldValidator: (value) {
                if (value.isEmpty) {
                  return "Please Enter name";
                }
              }),
          SizedBox(
            height: 20.h,
          ),
          CustomTextField(
              iconData: const Icon(Icons.email),
              controller: cubit.emailController,
              hint: 'Email',
              fieldValidator: emailValidator),
          SizedBox(
            height: 20.h,
          ),
          CustomTextField(
              iconData: const Icon(Icons.phone),
              controller: cubit.phoneController,
              hint: 'Phone',
              fieldValidator: (value) {
                if (value.isEmpty) {
                  return "Please Enter Phone";
                }
              }),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
