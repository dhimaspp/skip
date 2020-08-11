import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:skip/constants.dart';

class SecondBar extends StatefulWidget {
  @override
  _SecondBarState createState() => _SecondBarState();
}

// TODO Cari referensi design second bar yang bagus
class _SecondBarState extends State<SecondBar> {
  List<bool> isSelected = [false, false, false];

  List<String> selectedCategory = new List<String>();
  String all = "Semua";
  String category1 = "Lingkar Teman";
  String category2 = "Orang Lain";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, top: 5, right: 0),
      child: Container(
        height: 30,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 2.0,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                            splashColor: Colors.transparent,
                            onTap: () {
                              selectedCategory = new List<String>();
                              selectedCategory.add(category1);
                              setState(() {});
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 7.0),
                              decoration: selectedCategory.contains(category1)
                                  ? BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      color: kMaincolor.withOpacity(0.3),
                                      //color: selectedCategory.contains(category1)
                                    )
                                  : BoxDecoration(),
                              child: Text(
                                "Lingkar Teman",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 2.0,
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            onTap: () {
                              selectedCategory = new List<String>();
                              selectedCategory.add(category2);
                              setState(() {});
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 7.0),
                              decoration: selectedCategory.contains(category2)
                                  ? BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      color: kMaincolor.withOpacity(0.3),
                                      //color: selectedCategory.contains(category1)
                                    )
                                  : BoxDecoration(),
                              child: Text(
                                "Orang Lain",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 2.0,
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            onTap: () {
                              selectedCategory = new List<String>();
                              selectedCategory.add(all);
                              selectedCategory.add(category1);
                              selectedCategory.add(category2);
                              setState(() {});
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 7.0),
                              decoration: selectedCategory.contains(all)
                                  ? BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      color: kMaincolor.withOpacity(0.3),
                                      //color: selectedCategory.contains(category1)
                                    )
                                  : BoxDecoration(),
                              child: Text(
                                "Semua",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            VerticalDivider(
              width: 0,
              thickness: 1.0,
              indent: 2,
              endIndent: 3,
            ),
            Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              child: FlatButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onPressed: () => {},
                color: Colors.white,
                //padding: EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 29,
                      padding: const EdgeInsets.only(right: 5, left: 0),
                      child: Image.asset(
                        "assets/images/gopay.png",
                        height: 25,
                        width: 25,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        RichText(
                            text: TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: "Rp 1.200.000",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w600),
                            ),
                          ],
                        )),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: "Top Up",
                                style: TextStyle(
                                  color: kTextLightColor,
                                  fontSize: 8,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
