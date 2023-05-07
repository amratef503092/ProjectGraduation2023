import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resource/routes_manager.dart';
import 'package:graduation_project/core/resource/style_manager.dart';
import 'package:graduation_project/view/components/forget_password_components/custom_smoothIndecator.dart';
import 'package:graduation_project/view_model/bloc/auth_cubit/auth_cubit.dart';
import 'package:graduation_project/view_model/repo/interseted_repo/intersted_repo.dart';

import '../../../core/constatnts.dart';
import '../../../core/resource/color_mananger.dart';
import '../../../core/service_locator/service_locator.dart';
import '../../../view_model/bloc/interstend_cubit/intersted_cubit.dart';
import '../../../view_model/repo/login_repo/login_repo.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          InterstedCubit(sl.get<InterstedRepoImpl>())..getInterestsData(),
      child: BlocConsumer<InterstedCubit, InterstedState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return (state is InterstedSuccessfulState) ? SafeArea(
            child: Scaffold(
              appBar: AppBar(),
              body:
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                Text("Welcome ${ userName()}",
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
                              Text("Select your interests (${state.interstedModel.data!.length}) or ",
                                  style: getBoldStyle(
                                    color: ColorManage.secondaryBlack,
                                    height: 1,
                                    fontSize: 16.h,
                                  )),
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
                          Expanded(
                            child: GridView.builder(
                                itemCount: state.interstedModel.data!.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 2.5,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10),
                                itemBuilder: (context, index) {
                                  return Container(
                                      height: 100.h,
                                      decoration: BoxDecoration(
                                        color: ColorManage.background,
                                        border: Border.all(
                                            color: state.interstedModel
                                                    .data![index].select!
                                                ? ColorManage.primaryBlue
                                                : ColorManage.nonActive),
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              state.interstedModel.data![index]
                                                      .select =
                                                  !state.interstedModel
                                                      .data![index].select!;
                                            });
                                          },
                                          child: Row(
                                            children: [
                                              Text(
                                                  state.interstedModel
                                                      .data![index].name!,
                                                  style: getBoldStyle(
                                                    color:
                                                        ColorManage.primaryBlue,
                                                    height: 1,
                                                    fontSize: 16.h,
                                                  )),
                                              const Spacer(),
                                              (state.interstedModel.data![index]
                                                      .select!)
                                                  ? Icon(
                                                      Icons.check_circle,
                                                      color: ColorManage
                                                          .primaryBlue,
                                                      size: 24.h,
                                                    )
                                                  : Icon(
                                                      Icons
                                                          .check_circle_outline,
                                                      color: ColorManage
                                                          .primaryBlue,
                                                      size: 24.h,
                                                    )
                                            ],
                                          ),
                                        ),
                                      ));
                                }),
                          ),
                          Center(
                              child: CustomSmootIndicatior(index: 0, count: 2))
                        ],
                      ),
                    ),
              bottomSheet: GestureDetector(
                onTap: ()
                {
                  List<num> select = [];
                  for (int i = 0; i < state.interstedModel.data!.length; i++) {
                    if (state.interstedModel.data![i].select!) {
                      select.add(state.interstedModel.data![i].id!);
                    }
                  }
                  InterstedCubit.get(context).sendUserInters(id: select);
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
          ) :  const Center(
          child: CircularProgressIndicator.adaptive(),
          );
        },
      ),
    );
  }
}
