import 'package:flutter/material.dart';
import 'package:flutter_googlekeep/json/sidemenu_icon_json.dart';
import 'package:flutter_googlekeep/pages/home_page.dart';
import './side_menu_detail_page.dart';
import '../theme/colors.dart';

class SideMenuPage extends StatefulWidget {
  @override
  _SideMenuPageState createState() => _SideMenuPageState();
}

class _SideMenuPageState extends State<SideMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
            decoration: BoxDecoration(color: cardColor),
            child: ListView(
              children: [
                header(),
                sectionOne(),
                sectionTwo(),
                sectionThree(),
                sectionFour(),
              ],
            )));
  }

  Widget header() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: white.withOpacity(0.1),
          ),
        ),
      ),
      child: DrawerHeader(
          padding: EdgeInsets.zero,
          child: Padding(
            padding: EdgeInsets.only(top: 10, left: 30),
            child: Text(
              "Google Keep",
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 18, color: white),
            ),
          )),
    );
  }

  Widget sectionOne() {
    return Column(
      children: [
        Column(
          children: List.generate(2, (index) {
            return FlatButton(
              onPressed: () {
                if (index == 0) {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => HomePage(),
                    ),
                  );
                } else {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => SideMenuDetailPage(
                              title: sideMenuItem[index]['text'])));
                }
              },
              padding: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.only(top: 25, left: 25),
                child: Row(
                  children: [
                    Icon(
                      sideMenuItem[index]['icon'],
                      color: white.withOpacity(0.7),
                      size: 22,
                    ),
                    SizedBox(width: 25),
                    Text(
                      sideMenuItem[index]['text'],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: white.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 75),
          child: Divider(
            thickness: 1,
            color: white.withOpacity(0.1),
          ),
        )
      ],
    );
  }

  Widget sectionTwo() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25, top: 15),
          child: Text("LABELS",
              style: TextStyle(
                fontSize: 12,
                color: white.withOpacity(0.7),
              )),
        ),
        Column(
          children: List.generate(5, (index) {
            return FlatButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => SideMenuDetailPage(
                            title: sideMenuItem[index + 2]['text'])));
              },
              padding: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.only(top: 25, left: 25),
                child: Row(
                  children: [
                    Icon(
                      sideMenuItem[index + 2]['icon'],
                      color: white.withOpacity(0.7),
                      size: 22,
                    ),
                    SizedBox(width: 25),
                    Text(
                      sideMenuItem[index + 2]['text'],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: white.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 75),
          child: Divider(
            thickness: 1,
            color: white.withOpacity(0.1),
          ),
        )
      ],
    );
  }

  Widget sectionThree() {
    return Column(
      children: [
        Column(
          children: List.generate(2, (index) {
            return FlatButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => SideMenuDetailPage(
                            title: sideMenuItem[index + 7]['text'])));
              },
              padding: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.only(top: 25, left: 25),
                child: Row(
                  children: [
                    Icon(
                      sideMenuItem[index + 7]['icon'],
                      color: white.withOpacity(0.7),
                      size: 22,
                    ),
                    SizedBox(width: 25),
                    Text(
                      sideMenuItem[index + 7]['text'],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: white.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 75),
          child: Divider(
            thickness: 1,
            color: white.withOpacity(0.1),
          ),
        )
      ],
    );
  }

  Widget sectionFour() {
    return Column(
      children: [
        Column(
          children: List.generate(3, (index) {
            return FlatButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => SideMenuDetailPage(
                            title: sideMenuItem[index + 9]['text'])));
              },
              padding: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.only(top: 25, left: 25),
                child: Row(
                  children: [
                    Icon(
                      sideMenuItem[index + 9]['icon'],
                      color: white.withOpacity(0.7),
                      size: 22,
                    ),
                    SizedBox(width: 25),
                    Text(
                      sideMenuItem[index + 9]['text'],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: white.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 75),
          child: Divider(
            thickness: 1,
            color: white.withOpacity(0.1),
          ),
        )
      ],
    );
  }
}
