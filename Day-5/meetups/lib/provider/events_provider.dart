import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:meetups/utils/event.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EventsNotifier extends StateNotifier<List<Event>> {
  EventsNotifier(List<Event> initialEvents) : super(initialEvents);

  Future<void> addEvent(Event event) async {
    Event postedEvent = await postEvent(event);
    state = [...state, postedEvent];
  }

  void removeEvent(Event event) {
    state = state.where((e) => e.id != event.id).toList();
  }

  // List<Event> getEvents() {
  //   return state;
  // }
  Future<void> getEvents() async {
    print("Fetching Events print");
    Logger().i("Fetching Events");
    List<Event> fetchedEvents = await fetchEvents();
    state = fetchedEvents;
  }
}

final eventsProvider = StateNotifierProvider<EventsNotifier, List<Event>>(
    (ref) => EventsNotifier([]));

Future<List<Event>> fetchEvents() async {
  final url = Uri.http('localhost:8000', '/events');
  final response = await http.get(url);
  Logger().i(
      "Fetched Events response-+-++-+--+-${response.statusCode}-+-+${response.body}");
  if (response.statusCode == 200) {
    List<Event> events = (json.decode(response.body) as List)
        .map((data) => Event.fromJson(data))
        .toList();
    Logger().i("Fetched Events-+-++-+--+-$events");
    return events;
  } else {
    throw Exception('Failed to load events');
  }
}

postEvent(Event event) async {
  final url = Uri.http('localhost:8000', '/events');
  final response = await http.post(url,
      headers: {"Content-Type": "application/json"}, body: jsonEncode(event));
  Logger().i(
      "Posted Events response-+-++-+--+-${response.statusCode}-+-+${response.body}");
  if (response.statusCode == 201) {
    Event event = Event.fromJson(json.decode(response.body));
    Logger().i("Posted Events-+-++-+--+-$event");
    return event;
  } else {
    throw Exception('Failed to post events');
  }
}
