import 'package:flutter/services.dart';
import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/main.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter/material.dart';
import 'package:my_app/main.dart';
import 'package:my_app/pages/accueil.dart';
import 'package:my_app/pages/userPage.dart';

class ReservationPage extends StatefulWidget {
  const ReservationPage({Key? key}) : super(key: key);

  @override
  State<ReservationPage> createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
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
                padding: const EdgeInsets.fromLTRB(30, 50, 30, 5),
                child: Container(
                    height: 120,
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
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 10,
                        ),
                        const Text('Terrain 1',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Le 25/06/2022 de 8:00 à 9:00',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(30, 8, 10, 0),
                                height: 40.0,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                  ),
                                  onPressed: () {},
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
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(10, 8, 25, 0),
                                height: 40.0,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                  ),
                                  onPressed: () {},
                                  child: Row(
                                    children: const [
                                      Text('        Annuler    ',
                                          style: TextStyle(color: Colors.blue)),
                                      const Icon(Icons.cancel,
                                          size: 20, color: Colors.blue),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const UserPage()));
          },
          child: const Icon(Icons.settings),
        ));
  }
}
