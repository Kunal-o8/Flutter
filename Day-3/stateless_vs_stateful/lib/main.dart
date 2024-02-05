import 'package:flutter/material.dart';
import 'package:stateless_vs_stateful/stateful.dart';
import 'package:stateless_vs_stateful/stateless.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyStatelessWidget(title: 'Hello, Stateless!'),
      // home: MyStatefulWidget()
    ),
  );
}
