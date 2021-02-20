import 'package:flutter/material.dart';

class Wisdom extends StatefulWidget {
  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  int _index = 0;
  List quotes = [
    "Spread love everywhere you go. Let no one ever come to you without leaving happier.",
    "When you reach the end of your rope, tie a knot in it and hang on.",
    "Always remember that you are absolutely unique. Just like everyone else.",
    "Don't judge each day by the harvest you reap but by the seeds that you plant.",
    "The future belongs to those who believe in the beauty of their dreams.",
    "Tell me and I forget. Teach me and I remember. Involve me and I learn.",
    "The best and most beautiful things in the world cannot be seen or even touched - they must be felt with the heart.",
    "It is during our darkest moments that we must focus to see the light.",
    "Whoever is happy will make others happy too.",
    "Do not go where the path may lead, go instead where there is no path and leave a trail."
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: 350,
                height: 200,
                margin: EdgeInsets.all(30.0),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(14.5),
                ),
                child: Center(child: Text(quotes[_index % quotes.length]))),
            Divider(
              thickness: 1.3,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: FlatButton.icon(
                  onPressed: _showQuote,
                  color: Colors.greenAccent.shade700,
                  icon: Icon(Icons.wb_sunny),
                  label: Text("inspire me"),
                  style: TextStyle(
                    fontSize: 18.8,
                    color: Colors.white,
                  )),
            ),
          ],
        ),
      ),
    );
  }

  void _showQuote() {
    setState(() {
      _index += 1;
    });
  }
}
