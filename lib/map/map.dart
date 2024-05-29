import 'dart:ui';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'location.dart';
import 'location_service.dart';
import '/providers/position_provider.dart';
import 'package:final_project_app/views/legend.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  // final LatLng _center = const LatLng(47.6062, -122.3321); // using Paul Allen as center
  List<Marker> _markers = [];
  double _currentZoom = 11.0;
  LatLng _currentCenter = const LatLng(47.6062, -122.3321);

  @override
  void initState() {
    super.initState();
    _loadMapPosition();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _loadMarkers();
    _loadMapPosition();
  }

  Future<void> _loadMarkers() async {
    List<Location> locations = await loadLocations();
    Set<Marker> markers = {};
    for (Location location in locations) {
      final BitmapDescriptor markerIcon = await _getIconForType(location.type);
      markers.add(
        Marker(
          markerId: MarkerId(location.name),
          position: LatLng(location.latitude, location.longitude),
          infoWindow: InfoWindow(
            title: location.name,
            snippet: location.address,
          ),
          icon: markerIcon,
        ),
      );
    }

    setState(() {
      _markers = markers.toList();
    });
  }

  Future<BitmapDescriptor> _getIconForType(String type) async {
    IconData iconData;
    Color iconColor;
    switch (type) {
      case 'Restroom':
        iconData = Icons.family_restroom;
        iconColor = Colors.blue;
        break;
      case 'General Hygiene':
        iconData = Icons.bathtub;
        iconColor = Colors.purple;
        break;
      case 'Library':
        iconData = Icons.local_library;
        iconColor = Colors.orange;
        break;
      case 'Food Bank':
        iconData = Icons.food_bank;
        iconColor = Colors.green;
        break;
      default:
        iconData = Icons.question_mark;
        iconColor = Colors.black;
    }
    return await _createCustomMarkerBitmap(iconData, iconColor);
  }

  Future<BitmapDescriptor> _createCustomMarkerBitmap(
      IconData iconData, Color color) async {
    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    const double size = 80.0;
    const double iconSize = 60.0;

    final Paint paint = Paint()..color = color; // Use the color parameter here
    canvas.drawCircle(
      const Offset(size / 2, size / 2),
      size / 2,
      paint,
    );

    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );
    textPainter.text = TextSpan(
      text: String.fromCharCode(iconData.codePoint),
      style: TextStyle(
        fontSize: iconSize,
        fontFamily: iconData.fontFamily,
        color: Colors.white,
      ),
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(
        (size - textPainter.width) / 2,
        (size - textPainter.height) / 2,
      ),
    );

    final img = await pictureRecorder
        .endRecording()
        .toImage(size.toInt(), size.toInt());
    final data = await img.toByteData(format: ImageByteFormat.png);
    return BitmapDescriptor.fromBytes(data!.buffer.asUint8List());
  }

  void _zoomIn() {
    setState(() {
      _currentZoom++;
      mapController.animateCamera(CameraUpdate.zoomIn());
      _saveMapPosition();
    });
  }

  void _zoomOut() {
    setState(() {
      _currentZoom--;
      mapController.animateCamera(CameraUpdate.zoomOut());
      _saveMapPosition();
    });
  }

  Future<void> _saveMapPosition() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('latitude', _currentCenter.latitude);
    await prefs.setDouble('longitude', _currentCenter.longitude);
    await prefs.setDouble('zoom', _currentZoom);
  }

  Future<void> _loadMapPosition() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double? latitude = prefs.getDouble('latitude');
    double? longitude = prefs.getDouble('longitude');
    double? zoom = prefs.getDouble('zoom');

    if (latitude != null && longitude != null && zoom != null) {
      setState(() {
        _currentCenter = LatLng(latitude, longitude);
        _currentZoom = zoom;
      });
      mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: _currentCenter, zoom: _currentZoom),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Consumer<PositionProvider>(
            builder: (context, positionProvider, child) {
              if (positionProvider.positionKnown) {
                final currentLocationMarker = Marker(
                  markerId: const MarkerId('current_location'),
                  position: LatLng(
                      positionProvider.latitude, positionProvider.longitude),
                  infoWindow: const InfoWindow(
                    title: 'Current Location',
                  ),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueRed),
                );
                final allMarkers = Set<Marker>.of(_markers)
                  ..add(currentLocationMarker);

                return GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _currentCenter,
                    zoom: _currentZoom,
                  ),
                  onCameraMove: (CameraPosition position) {
                    _currentCenter = position.target;
                    _currentZoom = position.zoom;
                  },
                  onCameraIdle: () {
                    _saveMapPosition();
                  },
                  markers: allMarkers,
                  myLocationButtonEnabled: true,
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          Positioned(
            bottom: 80,
            right: 16,
            child: Column(
              children: [
                _buildZoomButton(Icons.add, _zoomIn),
                const SizedBox(height: 8),
                _buildZoomButton(Icons.remove, _zoomOut),
              ],
            ),
          ),
          Positioned(
            left: 16,
            bottom: 16,
            child: const LegendWidget(),
          ),
        ],
      ),
    );
  }

  Widget _buildZoomButton(IconData icon, VoidCallback onPressed) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      elevation: 4.0,
      child: InkWell(
        onTap: onPressed,
        customBorder: const CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(icon, size: 32, color: Colors.black),
        ),
      ),
    );
  }
}