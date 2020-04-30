import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class Developer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              "images/dev.svg",
              width: 250,
            ),
            SizedBox(height: 50),
            SvgPicture.asset("images/dev_image.svg"),
            SizedBox(height: 50),
            Container(
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () async {
                      await launch("https://www.linkedin.com/in/yash-maurya");
                    },
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Color(0xff646464).withOpacity(0.5),
                            offset: Offset(3, 7),
                            blurRadius: 11)
                      ]),
                      child: SvgPicture.asset(
                        "images/linkedin.svg",
                        width: 70,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  InkWell(
                    onTap: () async {
                      if (await canLaunch(
                          "https://instagram.com/_yash.maurya_")) {
                        print("acasc");
                        await launch("https://instagram.com/_yash.maurya_");
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Color(0xff646464).withOpacity(0.5),
                            offset: Offset(3, 7),
                            blurRadius: 11)
                      ]),
                      child: SvgPicture.asset(
                        "images/instagram.svg",
                        width: 70,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 70),
            SvgPicture.asset(
              "images/love.svg",
              height: 44,
            )
          ],
        ),
      ),
    ));
  }
}
