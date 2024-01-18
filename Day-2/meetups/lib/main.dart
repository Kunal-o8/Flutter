import 'package:flutter/material.dart';
import 'package:meetups/screens/members_page.dart';
import 'package:meetups/my_home_page.dart';
import 'package:meetups/screens/settings_page.dart';
import 'utils/event.dart';
import 'screens/event_page.dart';

void main() {
  runApp(const MyMeetupApp());
}

class MyMeetupApp extends StatelessWidget {
  const MyMeetupApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meetup App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/members': (context) => const MembersPage(),
        '/settings': (context) => const SettingsPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/event') {
          final Event event = settings.arguments as Event;
          return MaterialPageRoute(
            builder: (context) {
              return EventPage(event: event);
            },
          );
        }
        return null;
      },
    );
  }
}
