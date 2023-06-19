
part of 'activity_whilist_cubit.dart';
@immutable
abstract class ActivityWishState {}

class ActivityWishlistInitial extends ActivityWishState {}
class ActivityWishListLoading extends ActivityWishState {}
class ActivityWishListLoaded extends ActivityWishState {
  final GetActivityModel  getActivityModel;
  ActivityWishListLoaded({required this.getActivityModel});
}
class ActivityWishListError extends ActivityWishState {
  final Failure error;
  ActivityWishListError({required this.error});
}
class AddActivityWishListLoading extends ActivityWishState {}
class AddActivityWishListSuccesfly extends ActivityWishState {
  final String message;
  AddActivityWishListSuccesfly({required this.message});
}
class AddActivityWishListError extends ActivityWishState {
  final Failure error;
  AddActivityWishListError({required this.error});
}
class RemoveActivityWishListLoading extends ActivityWishState {}
class RemoveActivityWishListSuccesfly extends ActivityWishState {
  final String message;
  RemoveActivityWishListSuccesfly({required this.message});
}
class RemoveActivityWishListError extends ActivityWishState {
  final Failure error;
  RemoveActivityWishListError({required this.error});
}
