import 'package:flutter/material.dart';
import 'package:meetups/L10n/L10n.dart';
import 'package:meetups/provider/auth_provider.dart';
import 'package:meetups/screens/add_event_page.dart';
import 'package:meetups/screens/login_page.dart';
import 'package:meetups/screens/members_page.dart';
import 'package:meetups/my_home_page.dart';
import 'package:meetups/screens/settings_page.dart';
import 'package:meetups/utils/canvas/splash_screen.dart';
import 'utils/event.dart';
import 'screens/event_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const ProviderScope(child: MyMeetupApp()));
}

class MyMeetupApp extends ConsumerWidget {
  const MyMeetupApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoggedIn = ref.watch(authProvider);
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
        // '/add': (context) => AddEventPage(),
        '/login': (context) => LoginPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/add') {
          if (isLoggedIn == true) {
            return MaterialPageRoute(
              builder: (context) => AddEventPage(),
            );
          } else {
            return MaterialPageRoute(
              builder: (context) => LoginPage(),
            );
          }
        }
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
      supportedLocales: L10n.all,
      locale: const Locale('fr'),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}
