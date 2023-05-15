import 'package:cloud_firestore/cloud_firestore.dart';


class User {
  String uid;
  String matricule;
  String email;
  String profileImage;

  User({
    required this.uid,
    required this.matricule,
    required this.email,
      required this.profileImage
  });

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "matricule": matricule,
    "email": email,
    "profileImage": profileImage
  };

  static User fromJson(DocumentSnapshot snapshot) {
    var snapshotData = snapshot.data() as Map<String, dynamic>;
    return User(
      uid: snapshotData['uid'],
      matricule: snapshotData['matricule'],
      email: snapshotData['email'],
      profileImage: snapshotData['profileImage']
    );
  }
}
