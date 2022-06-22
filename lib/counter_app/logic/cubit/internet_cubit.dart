import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:learning_flutter_bloc/counter_app/constants/enums.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  Connectivity connectivity = Connectivity();
  late StreamSubscription connectivityStreamSubscription;

  InternetCubit() : super(InternetLoading()) {
    monitorInternetConnection();
  }

  StreamSubscription<ConnectivityResult> monitorInternetConnection() {
    return connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.none) {
        emit(InternetDisconnected());
      } else {
        if (result == ConnectivityResult.mobile) {
          emit(InternetConnected(connectionType: ConnectionType.mobile));
        } else if (result == ConnectivityResult.wifi) {
          emit(InternetConnected(connectionType: ConnectionType.wifi));
        }
        // emit(InternetConnected(connectionType: ConnectionType.none));
      }
    });
  }

  void internetConnected(ConnectionType connectionType) =>
      emit(InternetConnected(connectionType: connectionType));
  void internetDisconnected() => emit(InternetDisconnected());

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}
