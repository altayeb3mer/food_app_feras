import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_app/core/theme/dimens.dart';
import 'package:food_app/core/widget/widget_app_button.dart';
import 'package:food_app/core/widget/widget_transparent_appbar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';


//AIzaSyCRWYWbMOa_-b-konCzm6qFD8HixIQrLEI
class ScreenAddLocation extends StatefulWidget {
  const ScreenAddLocation({super.key});

  @override
  State<ScreenAddLocation> createState() => _ScreenAddLocationState();
}

class _ScreenAddLocationState extends State<ScreenAddLocation> {

  Location _location = Location();

  GoogleMapController? _controller;

  Set<Marker> _markers = {};
  // Function to get the center of the map and add a marker
  void _getCenterAndShowMarker() async {
    LatLng centerPosition = await _controller!.getLatLng(
      ScreenCoordinate(x: (MediaQuery.of(context).size.width/2).toInt(), y: (MediaQuery.of(context).size.height/2).toInt(),
    ));
    setState(() {
      _markers.clear(); // Clear any previous markers
      _markers.add(
        Marker(
          markerId: MarkerId('centerMarker'),
          position: centerPosition, // Place the marker at the map center
          infoWindow: InfoWindow(title: "Center of Map"),
        ),
      );
    });
  }
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetTransparentAppbar(
        title: 'Add Location',
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller=controller;
            },
            myLocationButtonEnabled: false,
            markers: _markers,
            onCameraMove: (cameraPos){
              _getCenterAndShowMarker();
            },
          ),
          Positioned(
            bottom: 30,
            right: Dimens.paddingVertical,
            left: Dimens.paddingVertical,
            child: WidgetAppButton(horizontalPadding: 0,title: 'Add Location', onPress: () {}),
          ),
          Positioned(
            top: 40, // You can adjust the top position
            right: Dimens.paddingVertical, // Adjust the right position as needed
            child: FloatingActionButton(
              onPressed: _goToMyLocation, // Custom location function
              child: Icon(Icons.my_location), // Customize the button style if needed
            ),
          ),
        ],
      ),
    );
  }
  // Move the map to the user's current location
  void _goToMyLocation() async {
    var currentLocation = await _location.getLocation();
    _controller?.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(currentLocation.latitude!, currentLocation.longitude!),
        zoom: 14.0,
      ),
    ));
  }
}
