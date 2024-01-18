import 'package:flutter/material.dart';

class MembersPage extends StatelessWidget {
  const MembersPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemBuilder: (context, index) {
        return Card(
          child: Center(
            child: Text('Member ${index + 1}'),
          ),
        );
      },
      itemCount: 10,
    );
  }
}
