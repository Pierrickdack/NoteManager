import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:appetud/screens/note_screen.dart';

//PAGES
final List pages = [
  NoteScreen(),
];

//COLORS
const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

//Firebase
var firebaseAuth = FirebaseAuth.instance;
var firestore = FirebaseFirestore.instance;
var firebaseStorage = FirebaseStorage.instance;
