import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resource/routes_manager.dart';
import 'package:graduation_project/core/resource/style_manager.dart';
import 'package:graduation_project/view/components/forget_password_components/custom_smoothIndecator.dart';

import '../../../core/resource/color_mananger.dart';
import '../../../view_model/bloc/interstend_cubit/intersted_cubit.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InterstedCubit()..getInterestsData(),
      child: BlocConsumer<InterstedCubit, InterstedState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                // welcome text
                SizedBox(
                  width: 0.6.sw,
                  height: 0.2.sh,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 0.05.sh,
                      ),
                      Text("Welcome Zack",
                          style: getBoldStyle(
                            color: ColorManage.primaryBlue,
                            height: 1,
                            fontSize: 32.h,
                          )),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                          "Could you tell us what is your Interests when Travel?",
                          style: getBoldStyle(
                            color: ColorManage.secondaryBlack,
                            height: 1,
                            fontSize: 16.h,
                          )),
                    ],
                  ),
                ),
                //select
                Row(
                  children: [
                    Text("Select your interests (3) or ",
                        style: getBoldStyle(
                          color: ColorManage.secondaryBlack,
                          height: 1,
                          fontSize: 16.h,
                        )
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text("Skip",
                          style: getBoldStyle(
                            color: ColorManage.primaryBlue,
                            height: 1,
                            fontSize: 16.h,


                          )),
                    ),


                  ],
                ),
                SizedBox(
                  height: 0.05.sh,
                ),
                ( InterstedCubit.get(context).interstedModel!=null)?
                Expanded(
                  child: GridView.builder(
                      itemCount: InterstedCubit.get(context).interstedModel!.data!.
                      length
                      , gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2.5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10
                  ),
                      itemBuilder: (context, index) {
                        return Container(
                            height: 100.h,
                            decoration: BoxDecoration(
                              color: ColorManage.background,
                              border: Border.all(color:InterstedCubit.get(context).interstedModel!.data![index].select!?
                              ColorManage.primaryBlue:ColorManage.nonActive),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: InkWell(
                                onTap: ()
                                {
                                  setState(() {
                                    InterstedCubit.get(context).interstedModel!.data![index].select =!InterstedCubit.get(context).interstedModel!.data![index].select!;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Text( InterstedCubit.get(context).interstedModel!.data![index].name!,
                                        style: getBoldStyle(
                                          color: ColorManage.primaryBlue,
                                          height: 1,
                                          fontSize: 16.h,
                                        )),
                                    Spacer(),
                                    (InterstedCubit.get(context).interstedModel!.data![index].select!)?
                                    Icon(Icons.check_circle,
                                      color: ColorManage.primaryBlue, size: 24.h,)
                                    :Icon(Icons.check_circle_outline,
                                      color: ColorManage.primaryBlue, size: 24.h,)
                                  ],
                                ),
                              ),
                            )
                        );
                      }),
                ):const Center(child: CircularProgressIndicator.adaptive(),),
                Center(child: CustomSmootIndicatior(index: 0, count: 2))
              ],
            ),
          ),
          bottomSheet: GestureDetector(
            onTap: () {
              // Navigator.pushNamed(context, Routes.location);
              //
              Navigator.pushNamedAndRemoveUntil(context, Routes.signIn,(route) => false,);

            },
            child: Container(
              height: 0.1.sh,
              width: 1.sw,
              decoration: BoxDecoration(
                color: ColorManage.primaryYellow,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
              ),
              child: Center(
                child: Text("Next",
                    style: getBoldStyle(
                      color: ColorManage.background,
                      height: 1,
                      fontSize: 16.h,
                    )),
              ),
            ),
          ),
        ),
      );
  },
),
    );
  }
}
