import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_googlekeep/json/notes_json.dart';
import 'package:flutter_googlekeep/pages/card_detail_page.dart';
import 'package:flutter_googlekeep/widgets/header.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/svg.dart';
import './sidemenu_page.dart';
import '../theme/colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      backgroundColor: bgColor,
      drawer: SideMenuPage(),
      body: getBody(),
      bottomSheet: getFooter(),
      floatingActionButton: FloatingActionButton(
          onPressed: null,
          backgroundColor: bgColor,
          child: Center(
              child: SvgPicture.asset("assets/images/google_icon.svg",
                  width: 30))),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.only(bottom: 50),
        children: [
          Header(size: size, drawerKey: _drawerKey),
          SizedBox(
            height: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  "PINNED",
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: white.withOpacity(0.6),
                  ),
                ),
              ),
              SizedBox(height: 10),
              getGridView(),
            ],
          )
        ],
      ),
    );
  }

  Widget getGridView() {
    var size = MediaQuery.of(context).size;
    return Column(
      children: List.generate(notes.length, (index) {
        List img = notes[index]['img'];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CardDetailPage(
                  title: notes[index]['title'],
                  description: notes[index]['description'],
                  img: notes[index]['img'],
                ),
              ),
            );
          },
          child: ElasticIn(
            duration: Duration(milliseconds: index * 850),
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
              child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: white.withOpacity(0.1)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, top: 12, bottom: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notes[index]['title'],
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: white.withOpacity((0.9)),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          notes[index]['description'],
                          style: TextStyle(
                              fontSize: 13,
                              height: 1.5,
                              fontWeight: FontWeight.w400,
                              color: white.withOpacity(0.7)),
                        ),
                        Column(children: [
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                              children: List.generate(img.length, (imgIndex) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: white.withOpacity(0.1),
                                    ),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            notes[index]['img'][imgIndex]),
                                        fit: BoxFit.cover)),
                              ),
                            );
                          }))
                        ])
                      ],
                    ),
                  )),
            ),
          ),
        );
      }),
    );
  }

  Widget getFooter() {
    var size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        height: 80,
        decoration: BoxDecoration(color: bgColor, boxShadow: [
          BoxShadow(
              color: black.withOpacity(0.2), spreadRadius: 1, blurRadius: 3)
        ]),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 20),
          child: Row(
            children: [
              Container(
                width: size.width * 0.7,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: null,
                      icon: Icon(
                        AntDesign.checksquare,
                        size: 20,
                        color: white.withOpacity(0.5),
                      ),
                    ),
                    IconButton(
                      onPressed: null,
                      icon: Icon(
                        FontAwesome.paint_brush,
                        size: 18,
                        color: white.withOpacity(0.5),
                      ),
                    ),
                    IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.mic_rounded,
                        size: 22,
                        color: white.withOpacity(0.5),
                      ),
                    ),
                    IconButton(
                      onPressed: null,
                      icon: Icon(
                        MaterialIcons.photo,
                        size: 22,
                        color: white.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
