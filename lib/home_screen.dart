import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('App Screen'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text('Login via Matricule et Password de l\'Etudiant.', style: TextStyle(fontSize: 25),),
        ));
  }
}
