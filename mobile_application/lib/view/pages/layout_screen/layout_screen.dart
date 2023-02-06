import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/core/resource/color_mananger.dart';
import 'package:graduation_project/view_model/bloc/layout_cubit/layout_cubit.dart';
import 'package:pandabar/main.view.dart';
import 'package:pandabar/model.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(

            body: LayoutCubit.get(context).screen[LayoutCubit.get(context).currentIndex],

            bottomNavigationBar: PandaBar(
              backgroundColor: ColorManage.background,

              buttonData: [
                PandaBarButtonData(
                    id: 'Home',
                    icon: Icons.home,
                    title: 'Home'

                ),
                PandaBarButtonData(
                    id: 'Community',
                    icon: FontAwesomeIcons.globe,
                    title: 'Community'
                ),
                PandaBarButtonData(
                    id: 'Create Program',
                    icon: Icons.travel_explore,
                    title: 'Create Program'
                ),

                PandaBarButtonData(
                    id: 'Profile',
                    icon: FontAwesomeIcons.user,
                    title: 'Profile'
                ),
              ],
              onChange: (id) {
                if (id == 'Home') {
                  LayoutCubit.get(context).changeIndex(0);
                }
                else if (id == 'Community') {
                  LayoutCubit.get(context).changeIndex(1);
                }
                else if (id == 'Create Program') {
                  LayoutCubit.get(context).changeIndex(2);
                }
                else if (id == 'Profile') {
                  LayoutCubit.get(context).changeIndex(3);
                }
              },
              onFabButtonPressed: ()
              {

              },
            ),
          );
        },
      ),
    );
  }

}
