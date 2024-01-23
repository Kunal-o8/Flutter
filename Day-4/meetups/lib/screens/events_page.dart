import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetups/provider/events_provider.dart';

class EventsPage extends ConsumerStatefulWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  EventsPageState createState() => EventsPageState();
}

class EventsPageState extends ConsumerState<EventsPage> {
  @override
  void initState() {
    super.initState();
    ref.read(eventsProvider.notifier).getEvents();
  }

  @override
  Widget build(BuildContext context) {
    final events = ref.watch(eventsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
      ),
      body: ListView.builder(
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
      ),
    );
  }
}
