import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meetups/screens/add_event_page.dart';

void main() {
  testWidgets('AddEventPage has a title field and it can be filled',
      (WidgetTester tester) async {
    await tester
        .pumpWidget(ProviderScope(child: MaterialApp(home: AddEventPage())));
    final titleField = find.widgetWithText(TextFormField, 'Title');
    expect(titleField, findsOneWidget);
    await tester.enterText(titleField, 'Test Event');
    expect(find.text('Test Event'), findsOneWidget);
  });

  testWidgets('AddEventPage has a submit button and it can be pressed',
      (WidgetTester tester) async {
    await tester
        .pumpWidget(ProviderScope(child: MaterialApp(home: AddEventPage())));
    final submitButton = find.byWidgetPredicate((widget) =>
        widget is ElevatedButton && (widget.child as Text).data == 'Submit');
    expect(submitButton, findsOneWidget);
    await tester.tap(submitButton);
    await tester.pump();
  });
  testWidgets('AddEventPage has a description field and it can be filled',
      (WidgetTester tester) async {
    await tester
        .pumpWidget(ProviderScope(child: MaterialApp(home: AddEventPage())));
    final descriptionField = find.widgetWithText(TextFormField, 'Description');
    expect(descriptionField, findsOneWidget);
    await tester.enterText(descriptionField, 'Test Description');
    expect(find.text('Test Description'), findsOneWidget);
  });

  testWidgets('AddEventPage has an image URL field and it can be filled',
      (WidgetTester tester) async {
    await tester
        .pumpWidget(ProviderScope(child: MaterialApp(home: AddEventPage())));

    final imageUrlField = find.widgetWithText(TextFormField, 'Image URL');
    expect(imageUrlField, findsOneWidget);
    await tester.enterText(imageUrlField, 'https://example.com/image.jpg');
    expect(find.text('https://example.com/image.jpg'), findsOneWidget);
  });

  testWidgets('AddEventPage has a dates field and it can be filled',
      (WidgetTester tester) async {
    await tester
        .pumpWidget(ProviderScope(child: MaterialApp(home: AddEventPage())));

    final datesField =
        find.widgetWithText(TextFormField, 'Dates (comma-separated)');
    expect(datesField, findsOneWidget);
    await tester.enterText(datesField, '2022-01-01,2022-01-02');
    expect(find.text('2022-01-01,2022-01-02'), findsOneWidget);
  });
}
