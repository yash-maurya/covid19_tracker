import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tracker/data.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import 'home.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashApp());
  }
}

class SplashApp extends StatefulWidget {
  @override
  _SplashStateApp createState() => _SplashStateApp();
}

class _SplashStateApp extends State<SplashApp> {
  double size = 300;
  bool updateAvailable = false;
  String updateUrl = "";

  @override
  void initState() {
    Timer(Duration(milliseconds: 1), () {
      setState(() {
        size = 0;
      });
    });
    http.get("http://yashmaurya.in/covid19_tracker/update.php").then((res) {
      dynamic update = jsonDecode(res.body);
      if (double.parse(update["ver"].toString()) > 1.1) {
        setState(() {
          updateAvailable = true;
          updateUrl = (update["update_url"].toString());
        });
      } else {
        caseData.fetchData(() {
          Timer(Duration(seconds: 3), () {
            Navigator.of(context).pushReplacement(_AnimatePage(() => MyApp()));
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          AnimatedPositioned(
            duration: Duration(seconds: 10),
            left: size,
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              height: MediaQuery.of(context).size.width,
              child: Transform.scale(
                origin: Offset(80, 0),
                alignment: Alignment.center,
                scale: 6,
                child: SvgPicture.asset(
                  "images/map.svg",
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("Loading",
                  style: TextStyle(fontFamily: "SF Pro Display", fontSize: 14)),
              SizedBox(height: 10),
              Theme(
                data: Theme.of(context)
                    .copyWith(backgroundColor: Colors.red.withOpacity(0.3)),
                child: LinearProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              )
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset(
                      "images/logo.svg",
                      height: 140,
                      width: 140,
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "COVID-19\nIndia Tracker",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                      shadows: [
                        Shadow(
                            color: Colors.black54.withOpacity(0.3),
                            blurRadius: 25,
                            offset: Offset(2, 4))
                      ]),
                )
              ],
            ),
          ),
          (updateAvailable)
              ? BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: Container(
                    color: Colors.blueGrey.withOpacity(0.2),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  ),
                )
              : Container(),
          (updateAvailable)
              ? Center(
                  child: SizedBox(
                    height: 200,
                    width: 300,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Update Available",
                            style: TextStyle(
                                fontFamily: "Proxima Nova",
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "An latest update of app is available. Please update to continue.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "SF Pro Display", fontSize: 18),
                          ),
                          SizedBox(
                            height: 27,
                          ),
                          InkWell(
                            onTap: () async {
                              await launch(updateUrl);
                            },
                            child: Text("UPDATE",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}

Route _AnimatePage(callback) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => callback(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
