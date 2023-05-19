import 'package:animate_do/animate_do.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:graduation_project/core/resource/color_mananger.dart';
import 'package:graduation_project/core/resource/style_manager.dart';
import 'package:graduation_project/core/service_locator/service_locator.dart';
import 'package:graduation_project/view/components/core_components/custom_body.dart';
import 'package:graduation_project/view_model/bloc/hotel_cubit/cubit/hotel_cubit.dart';
import 'package:graduation_project/view_model/repo/hotel_repo/hotel_repo.dart';

import '../../components/core_components/custom_animation_list_view/custom_animation_list_view.dart';
import '../../components/core_components/custom_card_bookling/custom_card_booking.dart';
import '../hotel_details_screen/hotel_details_screen.dart';
import 'componanets/custom_hotel_card/custom_hotel_card.dart';

class HotelBookingScreen extends StatefulWidget {
  const HotelBookingScreen({Key? key}) : super(key: key);

  @override
  State<HotelBookingScreen> createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 300));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HotelCubit(sl.get<HotelRepoImpl>())..getHotel(),
      child: BlocConsumer<HotelCubit, HotelState>(
        listener: (context, state) {},
        builder: (context, state) {
          HotelCubit hotel = HotelCubit.get(context);
          return Scaffold(
              body: (state is GetHotelLoadingState)
                  ? const Center(
                      child: CircularProgressIndicator.adaptive(),
                    )
                  : (state is GetHotelSuccessfullyState)
                      ? AnimationLimiter(
                          child: CustomBody(
                          textAppBar: "Hotel",
                          widget: Padding(
                            padding: const EdgeInsets.all(
                              25.0,
                            ),
                            child: ListView.separated(
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 20.h,
                                );
                              },
                              itemBuilder: (context, index) {
                                return OpenContainer(
                                  transitionDuration:
                                      const Duration(milliseconds: 500),
                                  openBuilder: (context, action) =>
                                      BlocProvider.value(
                                    value: hotel,
                                    child: HotelDetailsScreen(
                                      hotelModel: state.hotelModel.data![index],
                                    ),
                                  ),
                                  closedBuilder: (context, action) =>
                                      AnimationListView(
                                    index: index,
                                    widget: CustomTopHotelCard(
                                      lang: state
                                          .hotelModel.data![index].location![0]
                                          .toDouble(),
                                      lat: state
                                          .hotelModel.data![index].location![1]
                                          .toDouble(),
                                      save: () {},
                                      cardHeight: 340,
                                      cardWidth: 270,
                                      imageWidth: 366,
                                      imageHeight: 145,
                                      functionCard: () {
                                        action();
                                      },
                                      image: state
                                          .hotelModel.data![index].images![0],
                                      title: state
                                          .hotelModel.data![index].hotelName!,
                                      function: () {
                                        action();
                                      },
                                      discount: '0',
                                      price: '0',
                                      rate: state.hotelModel.data![index].rate!
                                          .toDouble(),
                                      reviwe: state.hotelModel.data![index]
                                          .reviews!.length
                                          .toString(),
                                    ),
                                  ),
                                );
                              },
                              itemCount: state.hotelModel.data!.length,
                            ),
                          ),
                        ))
                      : const Text("Error"));
        },
      ),
    );
  }
}

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet(
      {Key? key,
      this.maxHeight = 600,
      this.minHeight = 200,
      required this.widget,
      required this.icon,
      required this.text,
      required this.function})
      : super(key: key);
  final Widget widget;
  final double maxHeight;
  final double minHeight;
  final IconData icon;
  final String text;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        width: 342.w,
        height: 36.h,
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
        ),
        decoration: BoxDecoration(
          color: ColorManage.background,
          border: Border(
              bottom: BorderSide(color: ColorManage.nonActive, width: 2.w)),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: ColorManage.primaryBlue,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              text,
              style:
                  getRegularStyle(color: ColorManage.secondaryBlack, height: 1),
            ),
          ],
        ),
      ),
    );
  }
}
// Column(
//         children: [
//           // Stack(
//           //   clipBehavior: Clip.none,
//           //   children: [
//           //     // header
//           //     Container(
//           //       height: 200.h,
//           //       width: double.infinity,
//           //       padding: EdgeInsets.symmetric(horizontal: 10.w),
//           //       color: ColorManage.primaryBlue,
//           //       child: Row(
//           //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           //           children: [
//           //             IconButton(
//           //               onPressed: () {},
//           //               icon: const Icon(
//           //                 Icons.arrow_back_outlined,
//           //                 color: ColorManage.primaryYellow,
//           //               ),
//           //             ),
//           //             Text(
//           //               "Hotel Booking",
//           //               style: TextStyle(
//           //                   color: ColorManage.background,
//           //                   fontSize: 30.sp,
//           //                   fontWeight: FontWeight.bold),
//           //             ),
//           //             Row(
//           //               children: [
//           //                 InkWell(
//           //                   onTap: () {},
//           //                   child: const Icon(
//           //                     Icons.history,
//           //                     color: ColorManage.background,
//           //                   ),
//           //                 ),
//           //                 SizedBox(
//           //                   width: 10.w,
//           //                 ),
//           //                 InkWell(
//           //                   onTap: () {},
//           //                   child: const Icon(
//           //                     Icons.bookmark_border,
//           //                     color: ColorManage.background,
//           //                   ),
//           //                 ),
//           //               ],
//           //             )
//           //           ]),
//           //     ),
//           //     Positioned(
//           //       left: MediaQuery.of(context).size.width / 2 - 183.w,
//           //       top: 150.h,
//           //       child: CustomCardBooking(),
//           //     ),
//           //     // CardSearch
//           //   ],
//           // ),

//           // SizedBox(
//           //   height: 320.h,
//           // ),

//           PageTransitionSwitcher(
//             transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
//               return FadeThroughTransition(
//                 animation: primaryAnimation,
//                 secondaryAnimation: secondaryAnimation,
//                 child: child,
//               );
//             },
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 24.h),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Text(
//                   //   "Top Accomodations In Hochiminh City",
//                   //   style: getMediumStyle(
//                   //       color: ColorManage.primaryBlue,
//                   //       fontSize: 28,
//                   //       height: toFigmaHeight(
//                   //           figmaHeight: 36.sp, fontSize: 28.sp)),
//                   // ),
//                   // Text(
//                   //   "Complete your holiday by staying here",
//                   //   style: getRegularStyle(
//                   //       color: ColorManage.black,
//                   //       height: toFigmaHeight(
//                   //           figmaHeight: 25.sp, fontSize: 16.sp)),
//                   // ),
//                   // SizedBox(
//                   //   height: 25.h,
//                   // ),
//                   // SizedBox(
//                   //   height: 400.h,
//                   //   width: double.infinity,
//                   //   child: ListView.builder(
//                   //     itemBuilder: (context, index) {
//                   //       return AnimationListView(
//                   //         index: index,
//                   //         widget: OpenContainer(
//                   //           transitionDuration: Duration(milliseconds: 500),
//                   //           transitionType:
//                   //               ContainerTransitionType.fadeThrough,
//                   //           closedBuilder: (context, action) {
//                   //             return Padding(
//                   //               padding: const EdgeInsets.all(8.0),
//                   //               child: CustomTopHotelCard(
//                   //                 save: () {},
//                   //                 functionCard: () {},
//                   //                 image:
//                   //                     "https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGhvdG98ZW58MHx8MHx8&w=1000&q=80",
//                   //                 title: "A&Em selection hotel",
//                   //                 function: () {
//                   //                   action();
//                   //                 },
//                   //                 discount: "80",
//                   //                 price: "90",
//                   //                 rate: 20,
//                   //                 reviwe: "90",
//                   //               ),
//                   //             );
//                   //           },
//                   //           openBuilder: (context, action) {
//                   //             return HotelDetailsScreen(
//                   //               index: index,
//                   //             );
//                   //           },
//                   //         ),
//                   //       );
//                   //     },
//                   //     itemCount: 10,
//                   //     scrollDirection: Axis.horizontal,
//                   //   ),
//                   // ),
//                   // SizedBox(
//                   //   height: 32.h,
//                   // ),
//                   // Text(
//                   //   "All Accomodations in Hochiminh City",
//                   //   style: getMediumStyle(
//                   //       color: ColorManage.primaryBlue,
//                   //       fontSize: 28,
//                   //       height: toFigmaHeight(
//                   //           figmaHeight: 36.sp, fontSize: 28.sp)),
//                   // ),

//                   // Text(
//                   //   "Practical facilities, enjoyable stay",
//                   //   style: getRegularStyle(
//                   //       color: ColorManage.black,
//                   //       height: toFigmaHeight(
//                   //           figmaHeight: 25.sp, fontSize: 16.sp)),
//                   // ),

               
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),