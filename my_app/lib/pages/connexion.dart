import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter/material.dart';
import 'package:my_app/main.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/pages/accueil.dart';
import 'package:my_app/pages/register.dart';
import 'package:my_app/services/AuthService.dart';

class ConnexionPage extends StatefulWidget {
  const ConnexionPage({Key? key}) : super(key: key);

  @override
  State<ConnexionPage> createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<ConnexionPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  _goToRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterPage()),
    );
  }

  _validateLogin() async {
    if (_formKey.currentState!.validate()) {
      var uri = Uri.parse("http://192.168.1.61:5000/getUserId/" +
          _emailController.text +
          '/' +
          _passwordController.text);

      final response = await http.get(uri);

      if (response.statusCode != 200) {
        const snackBar = SnackBar(
          content: Text('Erreur login ou mot de passe incorrect'),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        dynamic parsed = json.decode(response.body);
        dynamic data = parsed["data"];

        if (data.length == 0) {
          const snackBar = SnackBar(
            content: Text('Erreur login ou mot de passe incorrect'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          return;
        }
        var id = data[0]["id"];
        AuthService.currentUserId = id;
        AuthService.savePreferences(
            _emailController.text, _passwordController.text);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AccueilPage()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
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
                        'Connexion au compte',
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 150,
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
                            controller: _emailController,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 10.0),
                                icon: const Icon(Icons.person),
                                labelText: 'Email',
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: Colors.grey[400])),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return ('Le champ ne doit pas etre vide');
                              } else if (!RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                                return ('Format Incorrect');
                              }
                            }),
                      ),
                      const SizedBox(
                        height: 10,
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
                      ElevatedButton(
                        child: Text('Se connecter'),
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
                          child: const Text("Mot de passe oublié ?")),
                      TextButton(
                          onPressed: _goToRegister,
                          child: const Text("S'inscrire")),
                    ]),
              ))),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
