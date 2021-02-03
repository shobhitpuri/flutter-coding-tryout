import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import 'events/location_event.dart';
import 'states/location_states.dart';

/// Responsible for handling getting lat and lon of current location.
/// Also handles permissions around it.
class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(null);

  @override
  Stream<LocationState> mapEventToState(LocationEvent event) async* {
    // Handle LocationFetchEvent
    if (event is LocationFetchEvent) {
      yield* _mapLocationFetchEventToState();
    }

    // Handle LocationReceivedSuccessEvent
    if (event is LocationReceivedSuccessEvent) {
      yield LocationLoadedState(position: event.position);
    }

    // Handle LocationErrorEvent
    if (event is LocationErrorEvent) {
      yield LocationErrorState(error: event?.error);
    }
  }

  /// Process LocationFetchEvent
  Stream<LocationState> _mapLocationFetchEventToState() async* {
    // Yield that location fetch process initiated.
    yield LocationLoadingState();

    // Check if service is disable or enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      add(LocationErrorEvent(
          error: 'Location services are disabled. '
              'Please enable from Settings and try again.'));
    }

    // If service enabled, check permissions.
    else {
      LocationPermission permission = await Geolocator.checkPermission();

      // If permission was denied for always, we can't ask again.
      if (permission == LocationPermission.deniedForever) {
        add(LocationErrorEvent(
            error: 'Location permissions are permanently denied. '
                'Please go to Settings app and allow to try again.'));
      }

      // Now that we are allowed to ask, check if we need to get permission
      // before getting location.
      // P.S: denied is default state both Android and iOS.
      else if (permission == LocationPermission.denied) {
        // Request permission if it was in denied state
        permission = await Geolocator.requestPermission();

        // If permission not granted, yield error.
        if (permission != LocationPermission.whileInUse &&
            permission != LocationPermission.always) {
          add(LocationErrorEvent(
              error: 'Location permissions denied. '
                  'Please allow to fetch weather.'));
        }

        // Else we now have permission to fetch location.
        else {
          _getCurrentPosition();
        }
      }

      // We can directly fetch location, since we have permission already.
      else {
        _getCurrentPosition();
      }
    }
  }

  /// Handles fetching of current location and yielding right event
  _getCurrentPosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    add(LocationReceivedSuccessEvent(position: position));
  }

  @override
  Future<void> close() {
    return super.close();
  }

  LocationState get initialState => LocationInitState();
}
