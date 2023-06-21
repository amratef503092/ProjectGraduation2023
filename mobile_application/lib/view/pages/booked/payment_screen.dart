import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resource/assets_manager.dart';
import '../../../core/resource/color_mananger.dart';
import '../../../core/resource/style_manager.dart';
import '../../../view_model/bloc/booked-cubit/cubit/booked_cubit.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookedCubit, BookedState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: Column(children: [
            ListTile(
              leading: Image.asset(AssetsManager.cashIcon),
              title: Text(
                'Cash'.tr(),
                style: getSemiBoldStyle(
                    color: ColorManage.primaryBlue, height: 1, fontSize: 18.sp),
              ),
              trailing: Radio(
                value: false,
                groupValue: BookedCubit.get(context).paymentSelected,
                onChanged: (value) {
                  BookedCubit.get(context).changePayment(value!);
                },
              ),
            ),
            ListTile(
              leading: Image.asset(AssetsManager.visaIcon),
              title: Text(
                'Visa'.tr(),
                style: getSemiBoldStyle(
                    color: ColorManage.primaryBlue, height: 1, fontSize: 18.sp),
              ),
              trailing: Radio(
                value: true,
                groupValue: BookedCubit.get(context).paymentSelected,
                onChanged: (value) {
                  BookedCubit.get(context).changePayment(value!);
                },
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            (BookedCubit.get(context).paymentSelected)
                ? const Column(
                    children: [],
                  )
                : const SizedBox.shrink()
          ]),
        );
      },
    );
  }
}
