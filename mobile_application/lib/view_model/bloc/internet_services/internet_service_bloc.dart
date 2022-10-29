import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'internet_service_event.dart';

part 'internet_service_state.dart';

class InternetServiceBloc extends Bloc<InternetServiceEvent, InternetServiceState> {
  StreamSubscription? subscription;
  InternetServiceBloc() : super(InternetServiceInitial()) {
    on<OnConnected>(
        (event, emit) => emit(Connected(message: 'Network is Connected')));
    on<NotConnected>((event, emit) =>
        emit(NoConnected(message: 'Network is Not Connected')));
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        add(OnConnected());
      } else {
        add(NotConnected());
      }
    });
  }

  @override
  Future<void> close() {
    subscription!.cancel();
    // TODO: implement close
    return super.close();
  }
}
