import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

abstract class LocationState {}

class LocationInitState extends LocationState {}

class LocationLoadingState extends LocationState {}

class LocationLoadedState extends LocationState {
  final Position position;

  LocationLoadedState({@required this.position});
}

class LocationErrorState extends LocationState {
  final dynamic error;

  LocationErrorState({@required this.error});
}
