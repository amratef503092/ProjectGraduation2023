part of 'internet_service_bloc.dart';

@immutable
abstract class InternetServiceState {}

class InternetServiceInitial extends InternetServiceState {}
class Connected extends InternetServiceState{
  String message;
  Connected({required this.message});
}
class NoConnected extends InternetServiceState{
  String message;
  NoConnected({required this.message});
}