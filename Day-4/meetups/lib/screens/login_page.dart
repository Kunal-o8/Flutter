import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetups/provider/auth_provider.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({Key? key}) : super(key: key);
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () async {
                await ref
                    .read(authProvider.notifier)
                    .login(_usernameController.text, _passwordController.text);
                Navigator.pop(context); // Navigate back to the previous page
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
