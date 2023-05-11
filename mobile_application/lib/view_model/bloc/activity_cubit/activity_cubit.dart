import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/model/acitvity_model/activity_model.dart';
import '../../repo/activity_repo/activity_repo.dart';
part 'activity_state.dart';

class ActivityCubit extends Cubit<ActivityState> {
  ActivityCubit(this.activityRep) : super(ActivityInitial());
  final ActivityRep activityRep ;
  static ActivityCubit get(context) =>
      BlocProvider.of(context);
  GetActivityModel ? activityModel;
  ActivityModel ? activityModel2;
  Future<void> getActivity()
  async {
    emit(GetActivityLoading());
    var result = await activityRep.getActivityData();
    result.fold((error) {
      emit(GetActivityError(error.toString()));
    }, (activityData) {
      activityModel = activityData;
      emit(GetActivitySuccess(activityData));
    });
  }
  int numberOfPeople = 1;
  void numberOfPeopleAdd()
  {
    numberOfPeople++;
    emit(NumberOfPeopleAdd());
  }
  void numberOfPeopleSub()
  {
   if(numberOfPeople > 1) {
     numberOfPeople--;
   }
    emit(NumberOfPeopleSub());
  }

}
