import 'package:bloc_test/bloc_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:test/test.dart';
import 'package:weather_project/location/bloc/events/location_event.dart';
import 'package:weather_project/location/bloc/location_bloc.dart';
import 'package:weather_project/location/bloc/states/location_states.dart';

void main() {
  group('LocationBloc', () {
    LocationBloc locationBloc;

    setUp(() {
      locationBloc = LocationBloc();
    });

    tearDown(() {
      locationBloc?.close();
    });

    /// Tests negative case scenario.
    blocTest(
      'emits LocationErrorState when error receiving location',
      build: () => locationBloc,
      act: (bloc) => bloc.add(LocationErrorEvent(
          error: 'Location permissions are permanently denied. '
              'Please go to Settings app and allow to try again.')),
      expect: [isA<LocationErrorState>()],
    );

    /// Tests positive case scenario.
    blocTest(
      'emits LocationLoadedState when receiving location successfully',
      build: () => locationBloc,
      act: (bloc) => bloc.add(LocationReceivedSuccessEvent(
          position: Position(latitude: 49.248810, longitude: -122.980507))),
      expect: [isA<LocationLoadedState>()],
    );
  });
}
