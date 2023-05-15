import 'package:flutter/material.dart';


class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true, 
        title: Text('Notes and MGP'),
      ),
      body: const Center(
          child: Text(
        'WELCOME !',
        style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold),
      )),
    );
  }
}
