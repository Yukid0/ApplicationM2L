// ignore_for_file: unnecessary_const
import 'dart:convert';

import 'package:flutter/services.dart';
import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter/material.dart';
import 'package:my_app/main.dart';
import 'package:my_app/pages/reservation.dart';

class AccueilPage extends StatefulWidget {
  const AccueilPage({Key? key}) : super(key: key);

  @override
  State<AccueilPage> createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  DateTime _dateTime = DateTime.now();
  String time = 'Pas de date entrée';
  Future<List<dynamic>> _getTerrains() async {
    var uri = Uri.parse("http://192.168.1.61:5000/getTerrains/");

    final response = await http.get(uri);
    if (response.statusCode != 200) {
      throw Exception('Bad status code');
    }
    dynamic parsed = json.decode(response.body);
    print(parsed['data'].runtimeType);
    dynamic data = parsed['data'];
    if (data.length == 0) {
      throw Exception('Donnée vide');
    }
    return (data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 179, 229, 252),
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
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7)))),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ReservationPage()));
                          },
                          child: Row(
                            children: const [
                              SizedBox(width: 17),
                              Icon(
                                Icons.search,
                                size: 20,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'MES RESERVATIONS',
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
          FutureBuilder<List<dynamic>>(
              future: _getTerrains(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SliverToBoxAdapter(
                    child: Column(
                        children: snapshot.data!
                            .map(
                              // prends une liste en entrée et la sors sous une autre forme
                              (terrain) => Container(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(30, 50, 30, 5),
                                  child: Container(
                                      height: 390,
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Color.fromARGB(255, 81, 154, 214),
                                              Color.fromARGB(255, 24, 85, 134)
                                            ]),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                      ),
                                      child: Column(
                                        children: <Widget>[
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(terrain['Nom'],
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20)),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'Date de réservation : '
                                            '${_dateTime.day}-${_dateTime.month}-${_dateTime.year}',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Expanded(
                                            child: Container(
                                              height: 300,
                                              margin: const EdgeInsets.fromLTRB(
                                                  25, 10, 25, 25),
                                              decoration: BoxDecoration(
                                                color: Colors.lightBlue[100],
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(15)),
                                              ),
                                              child: Row(
                                                children: [
                                                  Column(
                                                    children: [
                                                      Container(
                                                        margin: const EdgeInsets
                                                                .fromLTRB(
                                                            25, 17, 0, 0),
                                                        height: 30,
                                                        width: 140,
                                                        child: ElevatedButton(
                                                            style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty.all<
                                                                          Color>(
                                                                      const Color
                                                                              .fromARGB(
                                                                          255,
                                                                          97,
                                                                          171,
                                                                          206)),
                                                            ),
                                                            onPressed: () {},
                                                            child: const Text(
                                                              '8:00',
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          255,
                                                                          255,
                                                                          255),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            )),
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets
                                                                .fromLTRB(
                                                            25, 10, 0, 0),
                                                        height: 30,
                                                        width: 140,
                                                        child: ElevatedButton(
                                                            style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty.all<
                                                                          Color>(
                                                                      const Color
                                                                              .fromARGB(
                                                                          255,
                                                                          97,
                                                                          171,
                                                                          206)),
                                                            ),
                                                            onPressed: () {},
                                                            child: const Text(
                                                                '10:00')),
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets
                                                                .fromLTRB(
                                                            25, 10, 0, 0),
                                                        height: 30,
                                                        width: 140,
                                                        child: ElevatedButton(
                                                            style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty.all<
                                                                          Color>(
                                                                      const Color
                                                                              .fromARGB(
                                                                          255,
                                                                          97,
                                                                          171,
                                                                          206)),
                                                            ),
                                                            onPressed: () {},
                                                            child: const Text(
                                                                '10:00')),
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets
                                                                .fromLTRB(
                                                            25, 10, 0, 0),
                                                        height: 30,
                                                        width: 140,
                                                        child: ElevatedButton(
                                                            style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty.all<
                                                                          Color>(
                                                                      const Color
                                                                              .fromARGB(
                                                                          255,
                                                                          97,
                                                                          171,
                                                                          206)),
                                                            ),
                                                            onPressed: () {},
                                                            child: const Text(
                                                                '14:00')),
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets
                                                                .fromLTRB(
                                                            25, 10, 0, 0),
                                                        height: 30,
                                                        width: 140,
                                                        child: ElevatedButton(
                                                            style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty.all<
                                                                          Color>(
                                                                      const Color
                                                                              .fromARGB(
                                                                          255,
                                                                          97,
                                                                          171,
                                                                          206)),
                                                            ),
                                                            onPressed: () {},
                                                            child: const Text(
                                                                '16:00')),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      Container(
                                                        margin: const EdgeInsets
                                                                .fromLTRB(
                                                            12, 17, 25, 0),
                                                        height: 30,
                                                        width: 140,
                                                        child: ElevatedButton(
                                                            style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty.all<
                                                                          Color>(
                                                                      const Color
                                                                              .fromARGB(
                                                                          255,
                                                                          97,
                                                                          171,
                                                                          206)),
                                                            ),
                                                            onPressed: () {},
                                                            child: const Text(
                                                                '9:00')),
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets
                                                                .fromLTRB(
                                                            12, 10, 25, 0),
                                                        height: 30,
                                                        width: 140,
                                                        child: ElevatedButton(
                                                            style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty.all<
                                                                          Color>(
                                                                      const Color
                                                                              .fromARGB(
                                                                          255,
                                                                          97,
                                                                          171,
                                                                          206)),
                                                            ),
                                                            onPressed: () {},
                                                            child: const Text(
                                                                '11:00')),
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets
                                                                .fromLTRB(
                                                            12, 10, 25, 0),
                                                        height: 30,
                                                        width: 140,
                                                        child: ElevatedButton(
                                                            style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty.all<
                                                                          Color>(
                                                                      const Color
                                                                              .fromARGB(
                                                                          255,
                                                                          97,
                                                                          171,
                                                                          206)),
                                                            ),
                                                            onPressed: () {},
                                                            child: const Text(
                                                                '13:00')),
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets
                                                                .fromLTRB(
                                                            12, 10, 25, 0),
                                                        height: 30,
                                                        width: 140,
                                                        child: ElevatedButton(
                                                            style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty.all<
                                                                          Color>(
                                                                      const Color
                                                                              .fromARGB(
                                                                          255,
                                                                          97,
                                                                          171,
                                                                          206)),
                                                            ),
                                                            onPressed: () {},
                                                            child: const Text(
                                                                '15:00')),
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets
                                                                .fromLTRB(
                                                            12, 10, 25, 0),
                                                        height: 30,
                                                        width: 140,
                                                        child: ElevatedButton(
                                                            style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty.all<
                                                                          Color>(
                                                                      const Color
                                                                              .fromARGB(
                                                                          255,
                                                                          97,
                                                                          171,
                                                                          206)),
                                                            ),
                                                            onPressed: () {},
                                                            child: const Text(
                                                                '17:00')),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  margin:
                                                      const EdgeInsets.fromLTRB(
                                                          30, 0, 10, 25),
                                                  height: 40.0,
                                                  child: ElevatedButton(
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all<Color>(
                                                                  Colors.white),
                                                    ),
                                                    onPressed: () async {
                                                      DateTime? _newDate =
                                                          await showDatePicker(
                                                        context: context,
                                                        initialDate:
                                                            DateTime.now(),
                                                        firstDate:
                                                            DateTime.now(),
                                                        lastDate:
                                                            DateTime(2023),
                                                      );
                                                      if (_newDate != null) {
                                                        setState(() {
                                                          _dateTime = _newDate;
                                                          time = DateFormat
                                                                  .yMMMEd()
                                                              .format(
                                                                  _dateTime);

                                                          time = _dateTime
                                                              .toString();
                                                        });
                                                      }
                                                    },
                                                    child: Row(
                                                      children: const [
                                                        Text('Changez la date ',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .blue)),
                                                        const Icon(
                                                            Icons
                                                                .calendar_month,
                                                            size: 20,
                                                            color: Colors.blue),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  margin:
                                                      const EdgeInsets.fromLTRB(
                                                          10, 0, 30, 25),
                                                  height: 40.0,
                                                  child: ElevatedButton(
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all<Color>(
                                                                  Colors.white),
                                                    ),
                                                    onPressed: () {},
                                                    child: Row(
                                                      children: const [
                                                        Text(
                                                            '         Suivant    ',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .blue)),
                                                        const Icon(
                                                            Icons
                                                                .arrow_forward_ios_outlined,
                                                            size: 20,
                                                            color: Colors.blue),
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
                            )
                            .toList()),
                  );
                } else if (snapshot.hasError) {
                  return SliverToBoxAdapter(
                      child: const Text("Pas de terrain"));
                }
                return SliverToBoxAdapter(
                  child: Center(
                      child: Container(
                          height: 100,
                          width: 100,
                          child: CircularProgressIndicator())),
                );
              })
        ],
      ),
    );
  }
}
