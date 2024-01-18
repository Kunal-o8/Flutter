import 'package:flutter/material.dart';
import '../utils/event.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(
        10,
        (index) => ListTile(
          leading: Image.network(
              'https://images.pexels.com/photos/237762/pexels-photo-237762.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load'),
          title: Text('Event ${index + 1}'),
          onTap: () {
            Navigator.pushNamed(
              context,
              '/event',
              arguments: Event(
                id: 'id${index + 1}',
                title: 'Event ${index + 1}',
                description: 'Description of Event ${index + 1}',
                image:
                    'https://images.pexels.com/photos/237762/pexels-photo-237762.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
                location: 'Location ${index + 1}',
                dates: [DateTime.now()],
              ),
            );
          },
        ),
      ),
    );
  }
}
