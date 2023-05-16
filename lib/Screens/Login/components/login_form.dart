import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:appetud/Screens/Notes/notes_screen.dart';

class LoginForm extends StatefulWidget {
    const LoginForm({
    Key? key,
  }) : super(key: key);


  @override
  _LoginForm createState() =>  _LoginForm();
}

class _LoginForm extends State<LoginForm> {


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RegExp emailRegex = RegExp(r"[0-9]+[a-zA-Z]+[0-9]+");
  String matricule = " ";
  TextEditingController pwdcontroller = new TextEditingController();
  bool exist = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    setState(() {
      pwdcontroller.text = '';
    });
    EasyLoading.addStatusCallback((status) {
      print('EasyLoading Status $status');
      if (status == EasyLoadingStatus.dismiss) {
        _timer?.cancel();
      }
    });
  }

  Future getDoc(String name) async {
    final a =
        await FirebaseFirestore.instance.collection('Etudiant').doc(name).get();
    if (a.exists) {
      exist = true;
        EasyLoading.showSuccess('Hi!!\nTu est bien enregistrer');
         Navigator.pushReplacement( context,
            MaterialPageRoute(builder: (context) => NotesScreen(title: pwdcontroller.text.trim())),
);
    } else {
      EasyLoading.showError('Oups vous n\' etes pas enregistrer !!');
      exist = false;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
               controller: pwdcontroller,
               onChanged: (value) =>
                            setState(() => matricule = value.toUpperCase()),
              validator: (value) =>
                            value!.isEmpty || !emailRegex.hasMatch(value)
                                ? 'Enter une valeur valide !'
                                : null,
            decoration: const InputDecoration(
              hintText:  "Matricule  ",
              prefixIcon:  Padding(
                padding:  EdgeInsets.all(defaultPadding),
                child:  Icon(Icons.person),
              ),
            ),
          ),
         /* Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),*/
          const SizedBox(height: defaultPadding),
          ElevatedButton(
              onPressed:  !emailRegex.hasMatch(matricule)
                            ? null
                            : () async {

                              await EasyLoading.show(status: 'loading...');
                                getDoc(matricule);
                                Future.delayed(Duration(seconds: 10), () {
                                  EasyLoading.dismiss();
                                  print(exist);
                                  if (_formKey.currentState!.validate() &&
                                      exist == true) {
                                    print(matricule);
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => NotesScreen(
                                          title: pwdcontroller.text.trim()
                                        )
                                      ),
                                    );
                                  } else if (exist == false) {
                                    EasyLoading.showError('Matricule incorrect');
                                  }
                                });

                            },
              child: Text(
                "Connexion".toUpperCase(),
              ),
            ),
          /*const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
                  },
                ),
              );
            },
          ),*/
        ],
      ),
    );
  }
}