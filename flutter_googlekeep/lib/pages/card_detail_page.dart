import 'package:flutter/material.dart';
import 'package:flutter_googlekeep/theme/colors.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CardDetailPage extends StatefulWidget {
  final String title;
  final String description;
  final List img;
  const CardDetailPage({Key key, this.title, this.description, this.img})
      : super(key: key);

  @override
  _CardDetailPageState createState() => _CardDetailPageState();
}

class _CardDetailPageState extends State<CardDetailPage> {
  TextEditingController _title = TextEditingController();
  TextEditingController _description = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _title.text = widget.title;
      _description.text = widget.description;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: getAppBar(),
      body: getBody(),
      bottomSheet: getFooter(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      backgroundColor: bgColor,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          size: 22,
          color: white.withOpacity(0.7),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            MaterialCommunityIcons.pin,
            size: 22,
            color: white.withOpacity(0.7),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            MaterialIcons.notifications,
            size: 22,
            color: white.withOpacity(0.7),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.archive,
            size: 22,
            color: white.withOpacity(0.7),
          ),
        ),
      ],
    );
  }

  Widget getBody() {
    return ListView(
      padding: EdgeInsets.only(top: 25, bottom: 25, left: 15, right: 15),
      children: [
        TextField(
          controller: _title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: white.withOpacity(0.8),
          ),
          decoration: InputDecoration(border: InputBorder.none),
        ),
        TextField(
          maxLines: 10,
          controller: _description,
          style: TextStyle(
            fontSize: 14,
            height: 1.5,
            fontWeight: FontWeight.w400,
            color: white.withOpacity(0.8),
          ),
          decoration: InputDecoration(border: InputBorder.none),
        ),
        Row(
            children: List.generate(widget.img.length, (imgIndex) {
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
                      image: NetworkImage(widget.img[imgIndex]),
                      fit: BoxFit.cover)),
            ),
          );
        }))
      ],
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: null,
                icon: Icon(
                  AntDesign.plussquareo,
                  size: 22,
                  color: white.withOpacity(0.5),
                ),
              ),
              Text(
                "Edited Apr 3",
                style: TextStyle(fontSize: 12, color: white.withOpacity(0.7)),
              ),
              IconButton(
                onPressed: null,
                icon: Icon(
                  Octicons.kebab_vertical,
                  size: 22,
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
        ));
  }
}
