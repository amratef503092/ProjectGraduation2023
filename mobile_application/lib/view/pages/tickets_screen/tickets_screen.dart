import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/resource/color_mananger.dart';
import 'package:graduation_project/view/components/text/text_custom.dart';

import 'activity_tickets_screen/activity_tickets_screen.dart';
import 'hotel_tickets_screen/hotel_tickets_screen.dart';

class TicketsScreen extends StatefulWidget {
  const TicketsScreen({super.key});

  @override
  State<TicketsScreen> createState() => _TicketsScreenState();
}

class _TicketsScreenState extends State<TicketsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextCustom(
          text: "Tickets Screen",
          color: ColorManage.primary,
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        bottom: TabBar(
          labelColor: ColorManage.primary,
          controller: _tabController,
          tabs: const [
            Tab(
              text: "Activity Tickets",
            ),
            Tab(
              text: "Rooms Tickets",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [ActivityTicketsScreen(), HotelTicketScreen()],
      ),
    );
  }
}
