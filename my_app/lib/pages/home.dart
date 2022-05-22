import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/pages/connexion.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../services/AuthService.dart';
import 'accueil.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

//Load the HomeScreen
class _HomeState extends State<Home> {
  Future<bool> Reconnection() async {
    final prefs = await SharedPreferences.getInstance();
    final login = prefs.getString('login');
    final password = prefs.getString('password');
    bool result = true;
    var uri = Uri.parse(
        "http://192.168.1.61:5000/getUserId/" + login! + '/' + password!);

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      return (false);
    }
    dynamic parsed = json.decode(response.body);
    dynamic data = parsed["data"];

    if (data.length == 0) {
      return (false);
    }
    var id = data[0]["id"];
    AuthService.currentUserId = id;
    return result;
  }

  @override
  void initState() {
    Future.delayed(
        //use the delay for see the home screen in all case
        new Duration(
            days: 0,
            hours: 0,
            minutes: 0,
            seconds: 2,
            milliseconds: 500,
            microseconds: 0), () {
      Reconnection().then((isLog) {
        if (isLog) {
          //if after the delay the app is already connected, we go to the questionnary
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AccueilPage()),
          );
        } else {
          //Else we need to connect
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ConnexionPage()),
          );
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color.fromARGB(255, 54, 155, 238),
                Color.fromARGB(255, 11, 74, 126)
              ])),
          child: Center(
            child: Text('M2L',
                style: GoogleFonts.satisfy(
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 38))),
          )),
    );
  }
}
