import 'package:flutter/material.dart';
import 'package:devops_demo/database/dao/services.dart';

class DetailPage extends StatelessWidget {
  final Services services;

  DetailPage({Key? key, required this.services}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Container(
        color: Colors.green,
        alignment:Alignment.bottomCenter,
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: () {  },
          child: Text("Submit"),
        ),

      ),
    );
  }

}