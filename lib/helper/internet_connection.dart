import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> checkInternetConnectivity() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  return connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi;
}

/**
 * Example usage
 *
 * bool isConnected = await checkInternetConnectivity();
    if (isConnected) {
    print('Connected to the internet');
    } else {
    print('Not connected to the internet');
    }
 *
 */

