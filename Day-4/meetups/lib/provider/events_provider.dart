import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetups/utils/event.dart';
import 'package:meetups/utils/location.dart';

class EventsNotifier extends StateNotifier<List<Event>> {
  EventsNotifier(List<Event> initialEvents) : super(initialEvents);

  void addEvent(Event event) {
    state = [...state, event];
  }

  void removeEvent(Event event) {
    state = state.where((e) => e.id != event.id).toList();
  }

  List<Event> getEvents() {
    return state;
  }
}

final eventsProvider =
    StateNotifierProvider<EventsNotifier, List<Event>>((ref) => EventsNotifier([
          // Add your initial events here
          Event(
            id: '1',
            title: 'Event 1',
            description: 'Description of Event 1',
            image:
                'https://images.squarespace-cdn.com/content/v1/60da576b8b440e12699c9263/1650354559198-U58EM4C8OL0QIVOW3CSN/Ovation.jpg',
            location: Location(
              name: 'Location 1',
              address: 'Address 1',
              latitude: 37.7749,
              longitude: -122.4194,
            ),
            dates: [DateTime.now()],
            members: ['e1Member 1', 'e1Member 2'],
          ),
          Event(
              id: '2',
              title: 'Event 2',
              description: 'Description of Event 2',
              image:
                  'https://images.squarespace-cdn.com/content/v1/60da576b8b440e12699c9263/1650354559198-U58EM4C8OL0QIVOW3CSN/Ovation.jpg',
              location: Location(
                name: 'Location 2',
                address: 'Address 2',
                latitude: 37.7749,
                longitude: -122.4194,
              ),
              dates: [DateTime.now()],
              members: ['e2Member 1', 'e2Member 2']),
          Event(
            id: '3',
            title: 'Event 3',
            description: 'Description of Event 3',
            image:
                'https://images.squarespace-cdn.com/content/v1/60da576b8b440e12699c9263/1650354559198-U58EM4C8OL0QIVOW3CSN/Ovation.jpg',
            location: Location(
              name: 'Location 3',
              address: 'Address 3',
              latitude: 37.7749,
              longitude: -122.4194,
            ),
            dates: [DateTime.now()],
            members: ['e3Member 1', 'e3Member 2'],
          ),
        ]));
