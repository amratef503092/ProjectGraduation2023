import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/resource/color_mananger.dart';
import 'package:graduation_project/view_model/repo/profile_repo/profile_repo.dart';

import '../../../core/service_locator/service_locator.dart';
import '../../../view_model/bloc/profile_cubit/profile_cubit.dart';
import '../../components/profile_componants/profile_componenets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(sl.get<ProfileRepoImpl>())..getProfile(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        buildWhen: (previous, current) {
          if (current is ProfileSuccessfullyState) {
            return true;
          } else if (current is ProfileLoadingState) {
            return true;
          } else if (current is ProfileErrorState) {
            return true;
          } else {
            return false;
          }
        },
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state)
        {
          ProfileCubit cubit = ProfileCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title:  Text('Profile'.tr(),
                style: TextStyle(
                    color: ColorManage.primaryBlue
                ),
              ),
            ),
            body: (state is ProfileLoadingState) ?
            const Center(child: CircularProgressIndicator.adaptive(),)
                :
            (state is ProfileSuccessfullyState) ?
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                      [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(state.userModel
                              .profileImage!),
                        )
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(state.userModel.name!,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    Column(
                        children: [
                          const SizedBox(height: 20,),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: ColorManage.primaryBlue.withOpacity(0.2),
                            ),
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(state.userModel.email!,
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),),
                          const SizedBox(height: 20,),
                          ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) =>
                                  profileComponents(
                                      index: index,
                                      context: context,
                                      iconName: cubit
                                          .profileIconName[index],
                                      name: cubit
                                          .profileNames[index],
                                      screen: cubit
                                          .screenNames[index],
                                      cubit: cubit,
                                      function: () {
                                        // cubit.navigateToScreen(index);
                                      }),
                              separatorBuilder: (context,
                                  index) => const Divider(),
                              itemCount: cubit.profileNames
                                  .length),

                        ]
                    ),
                    const SizedBox(height: 20,),

                  ],
                ),
              ),
            ) : (state is ProfileErrorState) ? Text(state.error) : Text(
                "Some Thing Wrong"),
          );
        },
      ),
    );
  }
}
