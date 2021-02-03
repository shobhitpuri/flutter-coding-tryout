import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

abstract class LocationEvent {}

class LocationFetchEvent extends LocationEvent {}

/// Event sent when location is received from device successfully.
class LocationReceivedSuccessEvent extends LocationEvent {
  final Position position;

  LocationReceivedSuccessEvent({@required this.position});
}

/// Event sent when error happens when while fetching location.
class LocationErrorEvent extends LocationEvent {
  final dynamic error;

  LocationErrorEvent({this.error});
}
