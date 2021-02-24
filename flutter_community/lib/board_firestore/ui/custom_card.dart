import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../util/date_convert.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomCard extends StatelessWidget {
  final QuerySnapshot snapshot;
  final int index;

  const CustomCard({Key key, this.snapshot, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    @override
    var timeToDate = new DateTime.fromMillisecondsSinceEpoch(
        snapshot.docs[index]['timestamp'].seconds * 1000);
    var dateFormatted = new DateFormat("EEEE, MMM d, y").format(timeToDate);

    var snapshotData = snapshot.docs[index];
    var docId = snapshot.docs[index].id;
    TextEditingController nameInputController =
        TextEditingController(text: snapshotData["name"]);
    TextEditingController titleInputController =
        TextEditingController(text: snapshotData["title"]);
    TextEditingController descriptionInputController =
        TextEditingController(text: snapshotData["description"]);

    return Column(
      children: <Widget>[
        Container(
          height: 190,
          child: Card(
            elevation: 9,
            child: Column(
              children: [
                ListTile(
                  title: Text(snapshotData['title']),
                  subtitle: Text(snapshotData['description']),
                  leading: CircleAvatar(
                    radius: 34,
                    child: Text(snapshotData['title'].toString()[0]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("By: ${snapshotData['name']} "),
                      Text(dateFormatted),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(
                          FontAwesomeIcons.edit,
                          size: 15,
                        ),
                        onPressed: () async {
                          await showDialog(
                              context: context,
                              child: AlertDialog(
                                contentPadding: EdgeInsets.all(10),
                                content: Column(children: <Widget>[
                                  Text("Please update the form"),
                                  Expanded(
                                    child: TextField(
                                      autofocus: true,
                                      autocorrect: true,
                                      decoration: InputDecoration(
                                          labelText: "Your name*"),
                                      controller: nameInputController,
                                    ),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      autofocus: true,
                                      autocorrect: true,
                                      decoration:
                                          InputDecoration(labelText: "Title*"),
                                      controller: titleInputController,
                                    ),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      autofocus: true,
                                      autocorrect: true,
                                      decoration: InputDecoration(
                                          labelText: "Description*"),
                                      controller: descriptionInputController,
                                    ),
                                  ),
                                ]),
                                actions: <Widget>[
                                  FlatButton(
                                      onPressed: () {
                                        nameInputController.clear();
                                        titleInputController.clear();
                                        descriptionInputController.clear();
                                        Navigator.pop(context);
                                      },
                                      child: Text("Cancel")),
                                  FlatButton(
                                    onPressed: () {
                                      if (titleInputController
                                              .text.isNotEmpty &&
                                          nameInputController.text.isNotEmpty &&
                                          descriptionInputController
                                              .text.isNotEmpty) {
                                        FirebaseFirestore.instance
                                            .collection("board")
                                            .doc(docId)
                                            .update({
                                          "name": nameInputController.text,
                                          "title": titleInputController.text,
                                          "description":
                                              descriptionInputController.text,
                                          "timestamp": new DateTime.now()
                                        }).then((response) {
                                          Navigator.pop(context);
                                        }

                                                // FirebaseFirestore.instance
                                                //     .collection("board")
                                                //     .add({
                                                //   "name": nameInputController.text,
                                                //   "title": titleInputController.text,
                                                //   "description":
                                                //       descriptionInputController.text,
                                                //   "timestamp": new DateTime.now()
                                                // }).then((response) {
                                                //   //print(response.id);
                                                //   Navigator.pop(context);
                                                //   nameInputController.clear();
                                                //   titleInputController.clear();
                                                //   descriptionInputController.clear();
                                                // }).catchError(
                                                //   (error) => {
                                                //     print("Error"),
                                                //   },
                                                // );
                                                );
                                      }
                                    },
                                    child: Text("Update"),
                                  ),
                                ],
                              ));
                        }),
                    SizedBox(
                      height: 19,
                    ),
                    IconButton(
                      icon: Icon(
                        FontAwesomeIcons.trashAlt,
                        size: 15,
                      ),
                      onPressed: () async {
                        await FirebaseFirestore.instance
                            .collection("board")
                            .doc(docId)
                            .delete();

                        // print("docid ${docId}");
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
