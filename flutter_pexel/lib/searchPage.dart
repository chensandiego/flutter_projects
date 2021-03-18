import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_pexel/DartObject.dart';
import 'package:flutter_pexel/photoView.dart';

import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  DartObject obj;
  Map<String, String> header = {
    "Authorization": "563492ad6f917000010000015d842721ed684865bee241e885765720"
  };

  String url(String query, int perPage) {
    return 'https://api.pexels.com/v1/search?query=${query.trim()}&per_page=1&per_page=$perPage';
  }

  Future<void> fetchData(String query, int perPage) async {
    var response = await http.get(
      url(query, perPage),
      headers: header,
    );

    var decodedJson = jsonDecode(response.body);
    obj = DartObject.fromJson(decodedJson);
    setState(() {});
    return null;
  }

  Widget list() {
    return obj == null
        ? Center(child: Text("No Image found"))
        : ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Column(
                    children: <Widget>[
                      Hero(
                          tag: obj.photos[index].src.original,
                          child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PhotoPage(
                                            url: obj
                                                .photos[index].src.original)));
                              },
                              child: Image.network(
                                  obj.photos[index].src.landscape))),
                      Container(
                        width: double.infinity,
                        child: Material(
                          color: Theme.of(context).primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              obj.photos[index].photographer,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: obj.photos.length,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
              ),
              onFieldSubmitted: (String text) {
                fetchData(text, 10);
              },
            ),
          ),
          list(),
        ],
      ),
    );
  }
}
