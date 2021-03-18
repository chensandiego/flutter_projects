import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pexel/DartObject.dart';
import 'package:http/http.dart' as http;
import './wallpapersPage.dart';
import './searchPage.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;
  Map<String, String> header = {
    "Authorization": ""
  };
  DartObject obj;
  int pageNo = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData("wallpaper", 20);
    controller = TabController(length: 2, vsync: this);
  }

  incPage() {
    pageNo++;
  }

  String url(String query, int perPage) {
    return 'https://api.pexels.com/v1/search?query=${query.trim()}&per_page=$pageNo&per_page=$perPage';
  }

  Future<void> fetchData(String query, int perPage) async {
    var response = await http.get(
      url(query, perPage),
      headers: header,
    );
    incPage();
    var decodedJson = jsonDecode(response.body);
    obj = DartObject.fromJson(decodedJson);
    setState(() {});
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pexels App"),
        bottom: TabBar(
          controller: controller,
          tabs: <Widget>[
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.image),
                  Text("Wallpapers"),
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.search),
                  Text("Search"),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: (obj == null)
            ? CircularProgressIndicator()
            : TabBarView(
                controller: controller,
                children: <Widget>[
                  WallpapersPage(obj, fetchData),
                  SearchPage(),
                ],
              ),
      ),
    );
  }
}
