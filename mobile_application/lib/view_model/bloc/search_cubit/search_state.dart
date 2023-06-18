part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}
class SearchLoading extends SearchState {}
class SearchLoaded extends SearchState
{
  final HotelModel hotelModel;

  SearchLoaded({required this.hotelModel});
}
class SearchError extends SearchState
{
  final Failure error;

  SearchError({required this.error});
}
