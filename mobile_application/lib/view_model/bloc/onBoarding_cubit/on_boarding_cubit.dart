import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/resource/assets_manager.dart';
import 'package:graduation_project/core/resource/string_manager.dart';

import 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());

  static OnBoardingCubit get(context) =>
      BlocProvider.of<OnBoardingCubit>(context);
  int index = 0;
  List<OnBoardingModel> onBoardingList = [
    OnBoardingModel(
        title:StringManager.titleOnBoardingOne,
        subTitle:StringManager.subTitleOnBoardingOne,
        imagePath:AssetsManager.onBoardingImageOne),
    OnBoardingModel(title:StringManager.titleOnBoardingTwo,
        subTitle:StringManager.subTitleOnBoardingTwo, imagePath:AssetsManager.onBoardingImageTwo),
    OnBoardingModel(title:StringManager.titleOnBoardingThree,
        subTitle:StringManager.subTitleOnBoardingThree, imagePath:AssetsManager.onBoardingImageThree),
    OnBoardingModel(title:StringManager.titleOnBoardingFour,
        subTitle:StringManager.subTitleOnBoardingFour, imagePath:AssetsManager.onBoardingImageFour),

  ];
  void saveValue(int value){
    index = value;
    emit(SaveCurrentIndexState());
  }
}

class OnBoardingModel {
  String title;
  String subTitle;
  String imagePath;

  OnBoardingModel(
      {required this.title, required this.subTitle, required this.imagePath});
}
