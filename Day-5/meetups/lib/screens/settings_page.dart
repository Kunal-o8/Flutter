import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetups/provider/auth_provider.dart';
import 'package:meetups/screens/login_page.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoggedIn = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: isLoggedIn
            ? ElevatedButton(
                onPressed: () async {
                  await ref.read(authProvider.notifier).logout();
                  Navigator.pop(context); // Navigate back to the previous page
                },
                child: const Text('Logout'),
              )
            : ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: const Text('Login'),
              ),
      ),
    );
  }
}
