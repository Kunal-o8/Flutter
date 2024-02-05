import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod/riverpod.dart';
import 'package:meetups/provider/auth_provider.dart';
import 'package:meetups/screens/login_page.dart';

class MockAuthNotifier extends Mock implements AuthNotifier {
  @override
  Future<void> login(String username, String password) => super.noSuchMethod(
        Invocation.method(#login, [username, password]),
        returnValue: Future.value(),
        returnValueForMissingStub: Future.value(),
      );
}

void main() {
  group('LoginPage', () {
    testWidgets(
        'calls login method with username and password when login button is pressed',
        (WidgetTester tester) async {
      final mockAuthNotifier = MockAuthNotifier();

      final container = ProviderContainer(overrides: [
        authProvider.overrideWith(((ref) => mockAuthNotifier)),
      ]);

      await tester.pumpWidget(
        ProviderScope(
          parent: container,
          child: MaterialApp(
            home: LoginPage(),
          ),
        ),
      );

      final usernameField = find.byWidgetPredicate((widget) =>
          widget is TextField && widget.decoration?.labelText == 'Username');
      final passwordField = find.byWidgetPredicate((widget) =>
          widget is TextField && widget.decoration?.labelText == 'Password');
      final loginButton = find.descendant(
        of: find.byType(ElevatedButton),
        matching: find.text('Login'),
      );

      await tester.enterText(usernameField, 'username');
      await tester.enterText(passwordField, 'password');
      await tester.tap(loginButton);

      verify(mockAuthNotifier.login('username', 'password')).called(1);
    });
  });
}
