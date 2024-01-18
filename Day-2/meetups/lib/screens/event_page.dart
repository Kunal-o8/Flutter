import 'package:flutter/material.dart';
import '../utils/event.dart';

class EventPage extends StatelessWidget {
  final Event event;

  const EventPage({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Image.network(event.image),
              const SizedBox(height: 16),
              Text(event.description),
              const SizedBox(height: 16),
              Text('Location: ${event.location}'),
              const SizedBox(height: 16),
              Text('Dates: ${event.dates.join(', ')}'),
            ],
          ),
        ),
      ),
    );
  }
}
