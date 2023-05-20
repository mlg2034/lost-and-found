import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(51.1801, 71.446);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  static final Marker _kGooglePlexMarker = Marker(
    markerId: MarkerId('_kGooglePlex'),
    infoWindow: InfoWindow(title: 'Google Plex'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(51.1801, 71.446),
  );
  static final Marker _cGooglePlexMarker = Marker(
    markerId: MarkerId('_cGooglePlex'),
    infoWindow: InfoWindow(title: 'Lake Plex'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    position: LatLng(51.2001, 71.446),
  );
  // static final Polyline _kPolyline = Polyline(
  //     polylineId: PolylineId('_kPolyline'),
  //     points: [
  //       LatLng(51.1801, 71.446),
  //       LatLng(51.2001, 71.446),
  //     ],
  //     width: 5);
  GoogleMapController? _mapController;
    Marker? _marker;

   void _handleMapTap(LatLng latLng) {
    setState(() {
      _marker = Marker(
        markerId: MarkerId(latLng.toString()),
        position: latLng,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        alpha: 0.8,
      );
    });
  }

  // static final Polygon _kPolygon = Polygon(
  //   polygonId: PolygonId('_kPolygon'),
  //   points: [
  //     LatLng(51.1801, 71.446),
  //     LatLng(51.2001, 71.446),
  //     LatLng(51.3801, 71.166),
  //     LatLng(51.2301, 71.146),
  //   ],
  //   strokeWidth: 5,
  //   fillColor: Colors.transparent
  // );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green[700],
        title: const Text('Google Maps'),
        elevation: 2,
      ),
      body: GoogleMap(
        // polylines: {_kPolyline},
        markers:   _marker != null ? Set<Marker>.from([_marker!]) : Set<Marker>(),
        onTap: _handleMapTap,
        mapType: MapType.normal,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: _center, zoom: 11.0),
        // polygons: {
        //   _kPolygon
        // },
      ),
    );
  }
}
