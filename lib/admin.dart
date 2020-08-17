import 'package:flutter/material.dart';


class AdminScreen extends StatelessWidget {
  // const AdminScreen({Key key}) : super(key: key);
  final String name;
  AdminScreen({@required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin\'s Panel'),
      ),
      body: Center( child: Text("Welcome $name"),),
      
    );
  }
}