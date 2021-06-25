import 'package:flutter/foundation.dart';

class MpesaBaseApiProvider with ChangeNotifier {
  ///This is the [MAIN STATE PROVIDER] for the [API]
  bool _busy = false;
  String _apiError;

  bool get busy => _busy;
  String get getApiErrors => _apiError;

  ///[Method]sets api error
  setError(error) {
    _apiError = error;
    _busy = false;
    notifyListeners();
  }

  ///[Method]sets api state to busy

  setBusy(bool val) {
    _busy = val;
    notifyListeners();
  }
}
