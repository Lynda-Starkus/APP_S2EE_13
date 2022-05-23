import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:s2ee_new/config/config.dart';
import 'package:s2ee_new/config/maps.dart';
import 'package:s2ee_new/views/components/components.dart';

import '../../../config/colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GoogleMapController _mapController;

  CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(36.7050093, 3.1737854),
    zoom: 18.0,
  );

  Future<void> _onMapCreated(GoogleMapController controller) async {
    _mapController = controller;
    await _mapController.setMapStyle(AppMaps.style);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.black,
        bottomNavigationBar: BottomNavBar(currentIndex: 0),
        body:

            ///Map Widget
            GoogleMap(
          initialCameraPosition: _cameraPosition,
          onMapCreated: _onMapCreated,
          // markers: {
          //   Marker(markerId: MarkerId("esi"), position: _cameraPosition.target)
          // },
          zoomControlsEnabled: false,
        ),

        ///Search Widget

        /// Types
      ),
    );
  }
}
