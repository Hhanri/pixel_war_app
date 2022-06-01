import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  final _connectivity = Connectivity();
  final connectivityStream = StreamController<ConnectivityResult>();

  ConnectivityService() {
    print('initialize connectivity service');
    getResult.then((value) => connectivityStream.add(value));
    _connectivity.onConnectivityChanged.listen((ConnectivityResult event) async {
      connectivityStream.add(event);
    });
  }

  Future<ConnectivityResult> get getResult async => await _connectivity.checkConnectivity();
}