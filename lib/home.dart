import 'dart:async';

import 'package:bezier_chart/bezier_chart.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tracker/FadeIndexedStack.dart';
import 'package:tracker/data.dart';
import 'package:tracker/developer.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'about.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    caseData.fetchData(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  AnimationController _controller;
  Map<String, int> caseDataValues = Map();
  String lastUpdateTime;
  List<dynamic> stateWiseData = List();
  DateTime fromDate = DateTime.now().subtract(Duration(days: 7));
  DateTime toDate = DateTime.now().subtract(Duration(days: 1));
  bool sort = false;
  int _index = 0;
  bool sync = false;
  @override
  void initState() {
    super.initState();
    caseData.fetchData(() {});
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    caseDataValues = caseData.overAllData(() {});
    lastUpdateTime = caseData.lastUpdateTime();
    stateWiseData = caseData.stateWise();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        height: 50,
        color: Color(0xfffe2c55),
        items: <Widget>[
          Icon(Icons.add, size: 30, color: Colors.white),
          Icon(Icons.list, size: 30, color: Colors.white),
          Icon(Icons.help, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
      body: FadeIndexedStack(
        duration: Duration(seconds: 1),
        //controller: _pageController,
        //physics: NeverScrollableScrollPhysics(),
        index: _index,
        children: [HomeWig(context), About(), Developer()],
      ),
    );
  }

  Widget HomeWig(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 15, bottom: 15),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("images/map.png"),
                alignment: Alignment.topCenter)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 100,
              margin: EdgeInsets.only(left: 20, top: 20),
              child: Stack(
                children: [
                  Text("Statistics",
                      style: GoogleFonts.poppins(
                        fontSize: 21,
                        color: Color(0xffacb1c0),
                      )),
                  Positioned(
                    top: 20,
                    child: SvgPicture.asset(
                      "images/india.svg",
                      height: 84,
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 25,
                    child: RotationTransition(
                      turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                      child: InkWell(
                        child: Container(
                          padding: EdgeInsets.all(0),
                          decoration: BoxDecoration(
                              color: Color(0xffff2d55),
                              borderRadius: BorderRadius.circular(50)),
                          child: IconButton(
                            tooltip: "Sync",
                            onPressed: () {
                              setState(() {
                                sync = true;
                              });
                              _controller.repeat();
                              caseData.fetchData(() {
                                setState(() {
                                  lastUpdateTime = caseData.lastUpdateTime();
                                  stateWiseData = caseData.stateWise();
                                  caseDataValues = caseData.overAllData(() {
                                    _controller.reset();
                                    sync = false;
                                  });
                                });
                              });
                            },
                            icon: Icon(
                              Icons.refresh,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 60,
                    right: 20,
                    child: AnimatedOpacity(
                      opacity: sync ? 1 : 0,
                      duration: Duration(milliseconds: 500),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                            color: Colors.black.withOpacity(0.4),
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "Syncing",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    "Overall Cases",
                    style: TextStyle(
                      fontFamily: "Proxima Nova",
                      fontWeight: FontWeight.w300,
                      fontSize: 22,
                      color: Color(0xff0c1e44),
                    ),
                  ),
                ),
                Container(
                  height: 300,
                  margin: EdgeInsets.all(20),
                  padding:
                      EdgeInsets.only(left: 25, top: 20, bottom: 20, right: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.14),
                            offset: Offset(0, 8),
                            blurRadius: 45)
                      ]),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "CONFIRMED",
                                  style: TextStyle(
                                    fontFamily: "Proxima Nova",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: Colors.red,
                                  ),
                                ),
                                Text(
                                  caseDataValues["totalConf"].toString(),
                                  style: TextStyle(
                                    fontFamily: "Proxima Nova",
                                    fontSize: 35,
                                    color: Colors.red,
                                  ),
                                ),
                                Text(
                                  (caseDataValues["todayConf"] > 0)
                                      ? "Today +" +
                                          caseDataValues["todayConf"].toString()
                                      : "",
                                  style: TextStyle(
                                    fontFamily: "Proxima Nova",
                                    fontSize: 16,
                                    color: Colors.redAccent.withOpacity(0.8),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "ACTIVE",
                                  style: TextStyle(
                                    fontFamily: "Proxima Nova",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: Colors.blue,
                                  ),
                                ),
                                Text(
                                  caseDataValues["totalActive"].toString(),
                                  style: TextStyle(
                                    fontFamily: "Proxima Nova",
                                    fontSize: 35,
                                    color: Colors.blue,
                                  ),
                                ),
                                Text(
                                  "",
                                  style: TextStyle(
                                    fontFamily: "Proxima Nova",
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "RECOVERED",
                                  style: TextStyle(
                                    fontFamily: "Proxima Nova",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: Colors.green,
                                  ),
                                ),
                                Text(
                                  caseDataValues["totalRecov"].toString(),
                                  style: TextStyle(
                                    fontFamily: "Proxima Nova",
                                    fontSize: 35,
                                    color: Colors.green,
                                  ),
                                ),
                                Text(
                                  (caseDataValues["todayRecov"] > 0)
                                      ? "Today +" +
                                          caseDataValues["todayRecov"]
                                              .toString()
                                      : "",
                                  style: TextStyle(
                                    fontFamily: "Proxima Nova",
                                    fontSize: 16,
                                    color: Colors.green.withOpacity(0.6),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "DEATHS",
                                  style: TextStyle(
                                    fontFamily: "Proxima Nova",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: Color(0xff0c1e44),
                                  ),
                                ),
                                Text(
                                  caseDataValues["totalDeath"].toString(),
                                  style: TextStyle(
                                    fontFamily: "Proxima Nova",
                                    fontSize: 35,
                                    color: Color(0xff1e2432),
                                  ),
                                ),
                                Text(
                                  (caseDataValues["todayDeath"] > 0)
                                      ? "Today +" +
                                          caseDataValues["todayDeath"]
                                              .toString()
                                      : "",
                                  style: TextStyle(
                                    fontFamily: "Proxima Nova",
                                    fontSize: 16,
                                    color: Color(0xffacb1c0),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            lastUpdateTime,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: "Proxima Nova",
                              fontSize: 18,
                              color: Color(0xffacb1c0),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.14),
                        offset: Offset(0, 8),
                        blurRadius: 45)
                  ]),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Stack(
                        children: <Widget>[
                          Center(
                            child: Text(
                              "Daily Trend",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                          ),
                          Positioned(
                              right: 20,
                              child: InkWell(
                                  onTap: () async {
                                    List<DateTime> picked =
                                        await DateRagePicker.showDatePicker(
                                            context: context,
                                            initialFirstDate: fromDate,
                                            initialLastDate: toDate,
                                            firstDate: DateTime(2020, 01, 30),
                                            lastDate: DateTime.now().subtract(
                                                new Duration(days: 1)));
                                    if (picked != null && picked.length > 0) {
                                      setState(() {
                                        fromDate = picked.first;
                                        toDate = picked.last;
                                      });
                                    }
                                  },
                                  child: SvgPicture.asset(
                                    "images/interface.svg",
                                    height: 30,
                                  )))
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        DateFormat("dd MMMM").format(fromDate) +
                            " - " +
                            DateFormat("dd MMMM").format(toDate),
                        style: TextStyle(
                          fontFamily: "Proxima Nova",
                          fontSize: 13,
                          color: Color(0xff0c1e44),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      dailyGraph(context, fromDate, toDate),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Container(
                margin: EdgeInsets.all(0),
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.14),
                      offset: Offset(0, 8),
                      blurRadius: 45)
                ]),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "State Wise",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 3, top: 4, bottom: 4),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.black12))),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 6,
                            child: Text("State",
                                style: TextStyle(
                                    fontFamily: "Proxima Nova",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.black87)),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: EdgeInsets.only(right: 7),
                              child: Text(
                                "",
                                textAlign: TextAlign.right,
                                style: GoogleFonts.poppins(color: Colors.red),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text("CNF",
                                style: TextStyle(
                                    fontFamily: "Proxima Nova",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.red)),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text("ACT",
                                style: TextStyle(
                                    fontFamily: "Proxima Nova",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.blue)),
                          ),
                          Expanded(
                              flex: 2,
                              child: Text(
                                "REC",
                                style: TextStyle(
                                    fontFamily: "Proxima Nova",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.green),
                              )),
                          Expanded(
                              flex: 2,
                              child: Text(
                                "DTH",
                                style: TextStyle(
                                  fontFamily: "Proxima Nova",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ))
                        ],
                      ),
                    ),
                    ListView.builder(
                      padding: EdgeInsets.only(left: 10, top: 0),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: stateWiseData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: EdgeInsets.only(
                              left: 10, right: 3, top: 4, bottom: 4),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.black12))),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 6,
                                child: Text(
                                  stateWiseData[index]["state"].toString(),
                                  style: GoogleFonts.poppins(),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 7),
                                  child: Text(
                                    int.parse(stateWiseData[index]
                                                ["todayConf"]) >
                                            0
                                        ? "+" +
                                            stateWiseData[index]["todayConf"]
                                                .toString()
                                        : "",
                                    textAlign: TextAlign.right,
                                    style:
                                        GoogleFonts.poppins(color: Colors.red),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  stateWiseData[index]["conf"].toString(),
                                  style: GoogleFonts.poppins(),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  stateWiseData[index]["active"].toString(),
                                  style: GoogleFonts.poppins(),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  stateWiseData[index]["recov"].toString(),
                                  style: GoogleFonts.poppins(),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  stateWiseData[index]["death"].toString(),
                                  style: GoogleFonts.poppins(),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

Widget dailyGraph(BuildContext context, DateTime fromDate, DateTime toDate) {
  List<DataPoint> confData = [];
  List<DataPoint> recData = [];
  List<DataPoint> deathData = [];
  caseData.getDailyConf().forEach((DateTime k, int i) {
    confData.add(DataPoint<DateTime>(value: i.floorToDouble(), xAxis: k));
  });
  caseData.getDailyRecov().forEach((DateTime k, int i) {
    recData.add(DataPoint<DateTime>(value: i.floorToDouble(), xAxis: k));
  });
  caseData.getDailyDeaths().forEach((DateTime k, int i) {
    deathData.add(DataPoint<DateTime>(value: i.floorToDouble(), xAxis: k));
  });
  Widget graph = Center(
    child: Container(
      color: Colors.white,
      height: (MediaQuery.of(context).size.height / 2) - 100,
      width: MediaQuery.of(context).size.width,
      child: BezierChart(
        fromDate: fromDate,
        bezierChartScale: BezierChartScale.WEEKLY,
        toDate: toDate,
        bubbleLabelDateTimeBuilder: (a, b) => DateFormat("d MMMM\n").format(a),
        footerDateTimeBuilder: (a, b) => DateFormat("d\nMMMM").format(a),
        selectedDate: toDate,
        series: [
          BezierLine(
            lineColor: Colors.red,
            label: "Confirmed",
            onMissingValue: (dateTime) => 0,
            data: confData,
          ),
          BezierLine(
            lineColor: Colors.lightGreen,
            label: "Recovered",
            onMissingValue: (dateTime) => 0,
            data: recData,
          ),
          BezierLine(
            lineColor: Colors.blueGrey,
            label: "Death",
            onMissingValue: (dateTime) => 0,
            data: deathData,
          )
        ],
        config: BezierChartConfig(
          snap: true,
          verticalIndicatorStrokeWidth: 3.0,
          verticalIndicatorColor: Colors.black,
          xLinesColor: Colors.black,
          showVerticalIndicator: true,
          verticalIndicatorFixedPosition: false,
          backgroundColor: Colors.white,
          xAxisTextStyle: TextStyle(color: Colors.black, fontSize: 10),
        ),
      ),
    ),
  );

  return graph;
}
