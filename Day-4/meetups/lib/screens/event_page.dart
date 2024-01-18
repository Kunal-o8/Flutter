import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meetups/utils/event.dart';
import 'package:logger/logger.dart';

class EventPage extends StatefulWidget {
  final Event event;

  const EventPage({Key? key, required this.event}) : super(key: key);

  @override
  EventPageState createState() => EventPageState();
}

class EventPageState extends State<EventPage> {
  var logger = Logger();
  Position? currentPosition;
  late GoogleMapController mapController;

  @override
  void initState() {
    super.initState();
    getCurrentPosition();
  }

  Future<void> getCurrentPosition() async {
    PermissionStatus status = await Permission.location.status;
    if (!status.isGranted) {
      PermissionStatus newStatus = await Permission.location.request();
      if (!newStatus.isGranted) {
        return;
      }
    }

    currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {});
  }

  void onMapCreated(GoogleMapController controller) {
    logger.i('Creating map');
    mapController = controller;
    logger.i('Map created: $mapController');
  }

  @override
  Widget build(BuildContext context) {
    logger.i('Building widget');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.event.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Image.network(widget.event.image),
                const SizedBox(height: 16),
                Text(widget.event.description),
                const SizedBox(height: 16),
                Text('Location: ${widget.event.location.name}'),
                const SizedBox(height: 16),
                Text('Dates: ${widget.event.dates.join(', ')}'),
                const SizedBox(height: 16),
                SizedBox(
                  height: 300,
                  child: (currentPosition == null)
                      ? const Center(child: CircularProgressIndicator())
                      : GoogleMap(
                          onMapCreated: onMapCreated,
                          initialCameraPosition: CameraPosition(
                            target: LatLng(widget.event.location.latitude,
                                widget.event.location.longitude),
                            zoom: 14.0,
                          ),
                          markers: {
                            Marker(
                              markerId: const MarkerId('eventLocation'),
                              position: LatLng(widget.event.location.latitude,
                                  widget.event.location.longitude),
                              infoWindow:
                                  InfoWindow(title: widget.event.location.name),
                            ),
                            Marker(
                              markerId: const MarkerId('userLocation'),
                              position: LatLng(currentPosition!.latitude,
                                  currentPosition!.longitude),
                              infoWindow:
                                  const InfoWindow(title: 'Your Location'),
                            ),
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
        // body:
      ),
    );
  }
}
