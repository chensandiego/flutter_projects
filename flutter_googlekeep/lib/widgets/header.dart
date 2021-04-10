import 'package:flutter/material.dart';
import 'package:flutter_googlekeep/theme/colors.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
    @required this.size,
    @required GlobalKey<ScaffoldState> drawerKey,
  })  : _drawerKey = drawerKey,
        super(key: key);

  final Size size;
  final GlobalKey<ScaffoldState> _drawerKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Container(
        width: size.width,
        height: 45,
        decoration: BoxDecoration(
          color: cardColor,
          boxShadow: [
            BoxShadow(
                color: black.withOpacity(0.2), spreadRadius: 1, blurRadius: 3),
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _drawerKey.currentState.openDrawer();
                      },
                      child: Icon(Icons.menu, color: white.withOpacity(0.7)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Search your notes",
                      style: TextStyle(
                        fontSize: 15,
                        color: white.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.grid_view, color: white.withOpacity(0.7)),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://static.scientificamerican.com/sciam/cache/file/92E141F8-36E4-4331-BB2EE42AC8674DD3_source.jpg?w=590&h=800&1966AE6B-E8E5-4D4A-AACA385519F64D03"),
                              fit: BoxFit.cover)),
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
