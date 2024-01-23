import 'package:flutter/material.dart';
import 'package:meetups/screens/add_event_page.dart';
import 'package:meetups/screens/login_page.dart';
import 'package:meetups/screens/members_page.dart';
import 'package:meetups/my_home_page.dart';
import 'package:meetups/screens/settings_page.dart';
import 'package:meetups/utils/canvas/splash_screen.dart';
import 'utils/event.dart';
import 'screens/event_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyMeetupApp()));
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
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/': (context) => const MyHomePage(),
        '/members': (context) => const MembersPage(),
        '/settings': (context) => const SettingsPage(),
        '/add': (context) => AddEventPage(),
        '/login': (context) => LoginPage(),
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
