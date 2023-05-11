part of 'activity_cubit.dart';

abstract class ActivityState {}

class ActivityInitial extends ActivityState {}
class GetActivityLoading extends ActivityState {}
class GetActivitySuccess extends ActivityState
{
  final GetActivityModel activityModel;
  GetActivitySuccess(this.activityModel);
}
class GetActivityError extends ActivityState {
  final String error;
  GetActivityError(this.error);
}
