import 'package:connectivity/connectivity.dart';

abstract class INetworkInfo {
  Future<ConnectivityResult> get isConnected;
}

class NetworkInfo implements INetworkInfo {
  NetworkInfo();

  late Connectivity connectivity = Connectivity();

  setConnectivity(Connectivity param) => param = connectivity;

  @override
  Future<ConnectivityResult> get isConnected =>
      connectivity.checkConnectivity();
}
