import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  Color light = Color(0xff636b61);
  Color dark = Color(0xff171a21);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.red.withOpacity(0.2),
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              margin: EdgeInsets.only(top: 35),
              color: Colors.white,
              elevation: 10,
              child: Container(
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Text(
                      "Symptoms",
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: "Proxima Nova",
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Signs and symptoms of coronavirus disease 2019 (COVID-19) may appear two to 14 days after exposure. This time after exposure and before having symptoms is called the incubation period. Common signs and symptoms can include:",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontFamily: "SF Pro Display", color: light),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          "images/fever.svg",
                          height: 100,
                          width: 100,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                "High Fever",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: "Proxima Nova",
                                    color: dark),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "You have a fever if your temperature is above 37.8C. This can make you feel warm, cold or shivery.",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontFamily: "SF Pro Display", color: light),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Cough",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: "Proxima Nova",
                                    color: dark),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Irritation in throat or airway resulting regular coughing. Usually dry cough happens. ",
                                style: TextStyle(
                                    fontFamily: "SF Pro Display", color: light),
                              )
                            ],
                          ),
                        ),
                        SvgPicture.asset(
                          "images/sneeze.svg",
                          height: 100,
                          width: 100,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          "images/breath.svg",
                          height: 100,
                          width: 100,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                "Shortness of Breath",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: "Proxima Nova",
                                    color: dark),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Uncomfortable condition that makes it difficult to fully get air into your lungs",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontFamily: "SF Pro Display", color: light),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              margin: EdgeInsets.only(top: 35),
              color: Colors.white,
              elevation: 10,
              child: Container(
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Text(
                      "Prevention",
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: "Proxima Nova",
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "You can reduce your chances of being infected or spreading COVID-19 by taking some simple precautions:",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontFamily: "SF Pro Display", color: light),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          "images/hand-wash.svg",
                          height: 100,
                          width: 100,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                "Wash Hand",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: "Proxima Nova",
                                    color: dark),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Regularly and thoroughly clean your hands with an alcohol-based hand rub or wash them with soap and water.",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontFamily: "SF Pro Display", color: light),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Social Distancing",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: "Proxima Nova",
                                    color: dark),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Maintain at least 1 metre (3 feet) distance between yourself and others.",
                                style: TextStyle(
                                    fontFamily: "SF Pro Display", color: light),
                              )
                            ],
                          ),
                        ),
                        SvgPicture.asset(
                          "images/long-distance.svg",
                          height: 100,
                          width: 100,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          "images/face-mask.svg",
                          height: 100,
                          width: 100,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                "Wear Mask",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: "Proxima Nova",
                                    color: dark),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "By following good respiratory hygiene, you protect the people around you from viruses such as cold, flu and COVID-19.",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontFamily: "SF Pro Display", color: light),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Stay at Home",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: "Proxima Nova",
                                    color: dark),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Stay home and avoid going crowded places to decrease chanses of exposure",
                                style: TextStyle(
                                    fontFamily: "SF Pro Display", color: light),
                              )
                            ],
                          ),
                        ),
                        SvgPicture.asset(
                          "images/stay-at-home.svg",
                          height: 100,
                          width: 100,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                margin: EdgeInsets.only(top: 35),
                color: Colors.white,
                elevation: 10,
                child: Container(
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Helpful Links",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: "Proxima Nova",
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () async {
                              await launch(
                                  "https://www.mohfw.gov.in/pdf/coronvavirushelplinenumber.pdf");
                            },
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.pink,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "State Helpline Numbers",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: "SF Pro Display",
                                      color: Colors.pinkAccent),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () async {
                              await launch("https://www.mohfw.gov.in/");
                            },
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.pink,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Ministry of Health and Welfare, GoI",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: "SF Pro Display",
                                      color: Colors.pinkAccent),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () async {
                              await launch(
                                  "https://www.who.int/emergencies/diseases/novel-coronavirus-2019");
                            },
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.pink,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "COVID-19 - WHO",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: "SF Pro Display",
                                      color: Colors.pinkAccent),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () async {
                              await launch("https://covid.icmr.org.in/");
                            },
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.pink,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "ICMR Official",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: "SF Pro Display",
                                      color: Colors.pinkAccent),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () async {
                              await launch(
                                  "https://covid.icmr.org.in/index.php/testing-labs-deatails");
                            },
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.pink,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "List of COVID-19 Test Labs",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: "SF Pro Display",
                                      color: Colors.pinkAccent),
                                ),
                              ],
                            ),
                          )
                        ])))
          ],
        ),
      ),
    );
  }
}
