import 'package:flutter/cupertino.dart';

import '../../data/data_source/reomte/location_service.dart';
import '../../domain/model/lat_long.dart';
import '../../domain/model/user_location.dart';

class LocationNotifier extends ChangeNotifier {
  UserLocation _userLocation = UserLocation(LatLong(8.9, 38.0), "Unknown");
  UserLocation get userLocation => _userLocation;

  final bool _hasInternetConnection;

  LocationNotifier(this._hasInternetConnection) {
    _getUserLocation(_hasInternetConnection);
  }

  _getUserLocation(bool hasInternetConnection) async {
    _userLocation =
        await LocationService().getUserLocation(hasInternetConnection);
    notifyListeners();
  }
}
