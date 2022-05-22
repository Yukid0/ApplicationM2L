import 'package:flutter/services.dart';
import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter/material.dart';
import 'package:my_app/main.dart';
import 'package:my_app/pages/accueil.dart';
import 'package:my_app/pages/connexion.dart';
import 'package:my_app/services/AuthService.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  void disconnect() {
    AuthService.disconnect();

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ConnexionPage()));
  }

  Widget _buildPopupDelete(BuildContext context) {
    return AlertDialog(
      title: const Text('Suppression du compte'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("Etes vous sûr de vouloir supprimer votre compte ?"),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            disconnect();
            Navigator.of(context).pop();
          },
          child: const Text('Supprimer'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Fermer'),
        ),
      ],
    );
  }

  String _email = "email";
  Widget _buildPopupDialog(BuildContext context, String title) {
    final _Controller = TextEditingController();
    return AlertDialog(
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _Controller,
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
                labelText: "Entrez votre nouveau $title",
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey[400])),
          ),
        ],
      ),
      actions: <Widget>[
        FloatingActionButton(
          onPressed: () {
            if (!_Controller.text.isEmpty) {
              setState(() {
                switch (title) {
                  case "Mail":
                    {
                      _email = _Controller.text;
                    }
                    break;
                  case "Mail":
                    {
                      _email = _Controller.text;
                    }
                    break;
                  case "Mail":
                    {
                      _email = _Controller.text;
                    }
                    break;
                  case "Mail":
                    {
                      _email = _Controller.text;
                    }
                    break;
                  case "Mail":
                    {
                      _email = _Controller.text;
                    }
                    break;
                  default:
                    {}
                }
                _email = _Controller.text;
              });
            }
            Navigator.of(context).pop();
          },
          child: const Text('Appliquer'),
        ),
        FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Fermer'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue[100],
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                  height: 300,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                        Color.fromARGB(255, 41, 150, 240),
                        Color.fromARGB(255, 14, 85, 143)
                      ])),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 55,
                      ),
                      Text('M2L',
                          style: GoogleFonts.satisfy(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28))),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text('Réservez un terrain pour',
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22)),
                      const SizedBox(
                        height: 5,
                      ),
                      AnimatedTextKit(
                        pause: const Duration(milliseconds: 4000),
                        repeatForever: true,
                        animatedTexts: [
                          TyperAnimatedText(
                            'vous défouler',
                            speed: const Duration(milliseconds: 80),
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          ),
                          TyperAnimatedText('vos enfants',
                              speed: const Duration(milliseconds: 80),
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22)),
                          TyperAnimatedText('faire du sport',
                              speed: const Duration(milliseconds: 80),
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22)),
                          TyperAnimatedText('en finir avec ce gras',
                              speed: const Duration(milliseconds: 80),
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22)),
                          TyperAnimatedText('votre famille',
                              speed: const Duration(milliseconds: 80),
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22)),
                          TyperAnimatedText('transpirer',
                              speed: const Duration(milliseconds: 80),
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22)),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: 35,
                        width: 250,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(7)))),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AccueilPage()));
                            },
                            child: Row(
                              children: const [
                                SizedBox(width: 5),
                                Icon(
                                  Icons.search,
                                  size: 20,
                                  color: Colors.blue,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'RESERVER UN TERRAIN',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                )
                              ],
                            )),
                      ),
                    ],
                  )),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                child: Container(
                    height: 70,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromARGB(255, 81, 154, 214),
                            Color.fromARGB(255, 24, 85, 134)
                          ]),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Row(
                      children: <Widget>[
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Text(_email,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 8, 20, 0),
                              height: 40.0,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                ),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) =>
                                          _buildPopupDialog(context, "Mail"));
                                },
                                child: Row(
                                  children: const [
                                    Text('       Modifier ',
                                        style: TextStyle(color: Colors.blue)),
                                    const Icon(Icons.update,
                                        size: 20, color: Colors.blue),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                child: Container(
                    height: 70,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromARGB(255, 81, 154, 214),
                            Color.fromARGB(255, 24, 85, 134)
                          ]),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Row(
                      children: <Widget>[
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Text(_email,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 8, 20, 0),
                              height: 40.0,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                ),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) =>
                                          _buildPopupDialog(context, "Mail"));
                                },
                                child: Row(
                                  children: const [
                                    Text('       Modifier ',
                                        style: TextStyle(color: Colors.blue)),
                                    const Icon(Icons.update,
                                        size: 20, color: Colors.blue),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                child: Container(
                    height: 70,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromARGB(255, 81, 154, 214),
                            Color.fromARGB(255, 24, 85, 134)
                          ]),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Row(
                      children: <Widget>[
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Text(_email,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 8, 20, 0),
                              height: 40.0,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                ),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) =>
                                          _buildPopupDialog(context, "Mail"));
                                },
                                child: Row(
                                  children: const [
                                    Text('       Modifier ',
                                        style: TextStyle(color: Colors.blue)),
                                    const Icon(Icons.update,
                                        size: 20, color: Colors.blue),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                child: Container(
                    height: 70,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromARGB(255, 81, 154, 214),
                            Color.fromARGB(255, 24, 85, 134)
                          ]),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Row(
                      children: <Widget>[
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Text(_email,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 8, 20, 0),
                              height: 40.0,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                ),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) =>
                                          _buildPopupDialog(context, "Mail"));
                                },
                                child: Row(
                                  children: const [
                                    Text('       Modifier ',
                                        style: TextStyle(color: Colors.blue)),
                                    const Icon(Icons.update,
                                        size: 20, color: Colors.blue),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                child: Container(
                    height: 70,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromARGB(255, 81, 154, 214),
                            Color.fromARGB(255, 24, 85, 134)
                          ]),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Row(
                      children: <Widget>[
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Text(_email,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 8, 20, 0),
                              height: 40.0,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                ),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) =>
                                          _buildPopupDialog(context, "Mail"));
                                },
                                child: Row(
                                  children: const [
                                    Text('       Modifier ',
                                        style: TextStyle(color: Colors.blue)),
                                    const Icon(Icons.update,
                                        size: 20, color: Colors.blue),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(children: [
                SizedBox(height: 150),
                TextButton(
                    child: Text(
                      "Supprimer votre compte",
                      style: TextStyle(color: Color.fromARGB(255, 241, 91, 80)),
                    ),
                    onPressed: () => showDialog(
                        context: context,
                        builder: (context) => _buildPopupDelete(
                              context,
                            ))),
              ]),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: disconnect,
          child: const Icon(Icons.logout),
        ));
  }
}
