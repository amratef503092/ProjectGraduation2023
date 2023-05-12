part of 'booked_cubit.dart';

@immutable
abstract class BookedState {}

class BookedInitial extends BookedState {}

class BookedChangeIndex extends BookedState {}

class BookedActivityLoading extends BookedState {}

class BookedActivitySuccessfuly extends BookedState {}

class BookedActivityError extends BookedState {
  final String error;
  BookedActivityError(this.error);
}
