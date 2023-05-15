import 'package:appetud/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:appetud/screens/note_screen.dart';

import 'package:appetud/utils/constants.dart';
import 'package:appetud/widgets/text_input_field.dart';

import 'package:appetud/controllers/auth_controller.dart';


class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

    static AuthController authControllerInstance = Get.find();

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Consult Notes',
                style: TextStyle(
                    color: buttonColor,
                    fontWeight: FontWeight.w900,
                    fontSize: 35),
              ),
            const  Text(
                'Log In',
                style: TextStyle(
                  
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 35),
              ),
              const SizedBox(height: 25),
              TextInputFeild(
                  controller: _emailController,
                  labelText: 'Matricule',
                  icon: Icons.numbers_rounded),
              const SizedBox(height: 15),
              TextInputFeild(
                controller: _passwordController,
                labelText: 'Password',
                icon: Icons.password,
                isObscure: true,
              ),
              const SizedBox(height: 15),
              Container(
                width: mediaQuery.width * 0.98,
                height: mediaQuery.height * 0.08,
                decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                  onTap: () => authControllerInstance.login(_emailController.text, _passwordController.text),
                  child: const Center(
                      child: Text(
                    'Login',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  )),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account?',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(width: 5),
                  InkWell(
                    onTap: () {
                      Get.to(SignUpScreen());
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(color: buttonColor, fontSize: 18),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
