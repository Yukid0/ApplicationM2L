import 'package:flutter/services.dart';
import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter/material.dart';
import 'package:my_app/main.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  _validateLogin() {
    if (_formKey.currentState!.validate()) {
      if (_emailController.text == "bpy.rodriguez@gmail.com" &&
          _passwordController.text == "Zougloux") {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const MyHomePage(
                    title: 'RegisterPage',
                  )),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Form(
              key: _formKey,
              child: SizedBox(
                width: 350,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Création du compte',
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10),
                                )
                              ]),
                          child: TextFormField(
                            obscureText: true,
                            controller: _passwordController,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 10.0),
                                icon: const Icon(Icons.https),
                                labelText: 'Password',
                                hintStyle: TextStyle(color: Colors.grey[400])),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return ('Le champ ne doit pas etre vide');
                              } else if (value.length < 8) {
                                return ('Le mot de passe doit faire au moins 8 caractères');
                              }
                            },
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10),
                                )
                              ]),
                          child: TextFormField(
                            obscureText: true,
                            controller: _passwordController,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 10.0),
                                icon: const Icon(Icons.https),
                                labelText: 'Password',
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: Colors.grey[400])),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return ('Le champ ne doit pas etre vide');
                              } else if (value.length < 8) {
                                return ('Le mot de passe doit faire au moins 8 caractères');
                              }
                            },
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10),
                                )
                              ]),
                          child: TextFormField(
                            obscureText: true,
                            controller: _passwordController,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 10.0),
                                icon: const Icon(Icons.https),
                                labelText: 'Password',
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: Colors.grey[400])),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return ('Le champ ne doit pas etre vide');
                              } else if (value.length < 8) {
                                return ('Le mot de passe doit faire au moins 8 caractères');
                              }
                            },
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10),
                                )
                              ]),
                          child: TextFormField(
                            obscureText: true,
                            controller: _passwordController,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 10.0),
                                icon: const Icon(Icons.https),
                                labelText: 'Password',
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: Colors.grey[400])),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return ('Le champ ne doit pas etre vide');
                              } else if (value.length < 8) {
                                return ('Le mot de passe doit faire au moins 8 caractères');
                              }
                            },
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 40.0,
                                  offset: Offset(50, 50),
                                )
                              ]),
                          child: TextFormField(
                            obscureText: true,
                            controller: _passwordController,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 10.0),
                                icon: const Icon(Icons.https),
                                labelText: 'Password',
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: Colors.grey[400])),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return ('Le champ ne doit pas etre vide');
                              } else if (value.length < 8) {
                                return ('Le mot de passe doit faire au moins 8 caractères');
                              }
                            },
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        child: const Text("S'inscrire"),
                        onPressed: _validateLogin,
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          minimumSize: const Size.fromHeight(50), // NEW
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                          '---------------------     Ou     ----------------------'),
                      TextButton(
                          onPressed: _validateLogin,
                          child: const Text("Retour à la connexion")),
                    ]),
              ))),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
