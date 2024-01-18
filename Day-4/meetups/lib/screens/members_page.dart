import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetups/utils/event.dart';
import 'package:meetups/provider/events_provider.dart'; // Import your eventsProvider

final selectedEventProvider = StateProvider<Event?>((ref) => null);

class MembersPage extends ConsumerWidget {
  const MembersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final events = ref.watch(eventsProvider);
    final selectedEvent = ref.watch(selectedEventProvider);

    return Column(
      children: [
        DropdownButton<Event?>(
          hint: const Text('Select an event'),
          value: selectedEvent,
          items: events.map((Event event) {
            return DropdownMenuItem<Event?>(
              value: event,
              child: Text(event.title),
            );
          }).toList(),
          onChanged: (Event? newValue) {
            ref.read(selectedEventProvider.notifier).state = newValue;
          },
        ),
        if (selectedEvent != null)
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemBuilder: (context, index) {
                return Card(
                  child: Center(
                    child: Text(selectedEvent.members[index]),
                  ),
                );
              },
              itemCount: selectedEvent.members.length,
            ),
          ),
      ],
    );
  }
}
