import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meetups/screens/events_page.dart';
import 'package:meetups/provider/events_provider.dart';
import 'package:mockito/mockito.dart';

class MockEventsNotifier extends Mock implements EventsNotifier {}

void main() {
  testWidgets('EventsPage has an AppBar with title Events',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        const ProviderScope(child: MaterialApp(home: EventsPage())));
    expect(find.widgetWithText(AppBar, 'Events'), findsOneWidget);
  });

  testWidgets('EventsPage has a ListView', (WidgetTester tester) async {
    await tester.pumpWidget(
        const ProviderScope(child: MaterialApp(home: EventsPage())));
    expect(find.byType(ListView), findsOneWidget);
  });

  testWidgets('Tapping on a ListTile navigates to the /event route',
      (WidgetTester tester) async {
    final mockEventsNotifier = MockEventsNotifier();
    when(mockEventsNotifier.getEvents()).thenAnswer((_) => Future.value());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          eventsProvider.overrideWith(
            ((ref) => mockEventsNotifier),
          ),
        ],
        child: MaterialApp(
          home: const EventsPage(),
          routes: {
            '/event': (context) => Container(),
          },
        ),
      ),
    );

    await tester.pumpAndSettle();

    await tester.tap(find.byType(ListTile));
    await tester.pumpAndSettle();

    expect(find.byType(Container), findsOneWidget);
  });
}
