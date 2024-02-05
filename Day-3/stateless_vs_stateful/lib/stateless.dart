import 'package:flutter/material.dart';

class MyStatelessWidget extends StatelessWidget {
  final String title;

  const MyStatelessWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateless Widget Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Title:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
// Stateless Widget is used when the part of the user interface you are 
// describing does not depend on anything other than the configuration
