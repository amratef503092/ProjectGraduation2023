import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/view/pages/hotels_booking_screens/componanets/custom_hotel_card/custom_hotel_card.dart';
import 'package:graduation_project/view_model/bloc/hotel_cubit/cubit/hotel_cubit.dart';

import '../../../core/resource/color_mananger.dart';
import '../../../core/service_locator/service_locator.dart';
import '../../../view_model/bloc/search_cubit/search_cubit.dart';
import '../../../view_model/repo/hotel_repo/hotel_repo.dart';
import '../../../view_model/repo/search_repo/serarch_repo.dart';
import '../../components/core_components/custom_animation_list_view/custom_animation_list_view.dart';
import '../../components/core_components/custom_text_form_faild.dart';
import '../hotel_details_screen/hotel_details_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.queryText});

  final String queryText;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  TextEditingController searchController = TextEditingController();

  void initState() {
    // TODO: implement initState
    super.initState();
    searchController.text = widget.queryText;
    print( widget.queryText);
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(sl.get<SearchRepoImpl>())
        ..searchHotel(searchKey: widget.queryText),
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Search' ,
            style: TextStyle(color: ColorManage.primaryBlue),),
            ),

          body: BlocConsumer<SearchCubit, SearchState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 64.h,
                            width: 359.w,
                            decoration: BoxDecoration(
                                color: ColorManage.background,
                                border:
                                    Border.all(color: ColorManage.primaryBlue),
                                borderRadius: BorderRadius.circular(20.r)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: 20.w,
                                ),
                                const Icon(
                                  Icons.add_location_alt,
                                  color: ColorManage.primaryBlue,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 1.0),
                                    child: CustomTextField(
                                      border: true,
                                      controller: searchController,
                                      hint: "Explore Destination",
                                      fieldValidator: (value) {
                                        if (value!.isEmpty) {
                                          return "Please Enter Your Destination";
                                        }
                                      },
                                      onEditingComplete: () {
                                        SearchCubit.get(context).searchHotel(
                                            searchKey: searchController.text);
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        InkWell(
                          onTap: () {
                            SearchCubit.get(context).searchHotel(
                                searchKey: searchController.text);
                          },
                          child: CircleAvatar(
                            radius: 30.r,
                            backgroundColor: ColorManage.primaryBlue,
                            child: CircleAvatar(
                              radius: 27.r,
                              backgroundColor: ColorManage.background,
                              child: const Icon(
                                Icons.search,
                                color: ColorManage.primaryBlue,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    if (state is SearchLoading) const LinearProgressIndicator(),
                    if (state is SearchError) Text(state.error.message),
                    if (state is SearchLoaded)
                      Expanded(
                          child: ListView.separated(
                            separatorBuilder: (context, index) => SizedBox(
                              height: 20.h,
                            ),
                              itemCount: state.hotelModel.data!.length,
                              itemBuilder: (context, index) => OpenContainer(
                                    transitionDuration:
                                        const Duration(milliseconds: 200),
                                    openBuilder: (context, action) =>
                                        BlocProvider(
                                      create: (context) =>
                                          HotelCubit(sl.get<HotelRepoImpl>()),
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
                                  ))),
                  ],
                ),
              );
            },
          )),
    );
  }
}
