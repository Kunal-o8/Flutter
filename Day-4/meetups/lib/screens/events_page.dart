import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetups/utils/event.dart';
import 'package:meetups/provider/events_provider.dart'; // Import your eventsProvider

class EventsPage extends ConsumerWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final events = ref.watch(eventsProvider);

    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events[index];
        return ListTile(
          leading: Image.network(event.image),
          title: Text(event.title),
          onTap: () {
            Navigator.pushNamed(
              context,
              '/event',
              arguments: event,
            );
          },
        );
      },
    );
  }
}







// import 'package:flutter/material.dart';
// import '../utils/event.dart';

// class EventsPage extends StatelessWidget {
//   const EventsPage({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: List.generate(
//         10,
//         (index) => ListTile(
//           leading: Image.network(
//               'https://images.pexels.com/photos/237762/pexels-photo-237762.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load'),
//           title: Text('Event ${index + 1}'),
//           onTap: () {
//             Navigator.pushNamed(
//               context,
//               '/event',
//               arguments: Event(
//                 id: 'id${index + 1}',
//                 title: 'Event ${index + 1}',
//                 description: 'Description of Event ${index + 1}',
//                 image:
//                     'https://images.pexels.com/photos/237762/pexels-photo-237762.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
//                 location: 'Location ${index + 1}',
//                 dates: [DateTime.now()],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
