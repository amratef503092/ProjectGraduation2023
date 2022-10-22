part of 'internet_service_bloc.dart';

@immutable
abstract class InternetServiceEvent {}
class OnConnected extends InternetServiceEvent{}
class NotConnected extends InternetServiceEvent{}

