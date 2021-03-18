import 'package:flutter/material.dart';
import 'package:flutter_pexel/DartObject.dart';
import 'package:flutter_pexel/photoView.dart';

class WallpapersPage extends StatefulWidget {
  final DartObject obj;
  final Function(String, int) fetchData;
  WallpapersPage(this.obj, this.fetchData);
  @override
  _WallpapersPageState createState() => _WallpapersPageState();
}

class _WallpapersPageState extends State<WallpapersPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: RefreshIndicator(
      onRefresh: () {
        return widget.fetchData("wallpaper", 20);
      },
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Column(
                children: <Widget>[
                  Hero(
                    tag: widget.obj.photos[index].src.original,
                    child: GestureDetector(
                      child:
                          Image.network(widget.obj.photos[index].src.landscape),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PhotoPage(
                                    url: widget
                                        .obj.photos[index].src.original)));
                      },
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Material(
                      color: Theme.of(context).primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.obj.photos[index].photographer,
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
        itemCount: widget.obj.photos.length,
      ),
    ));
  }
}
