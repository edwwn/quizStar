import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class getJson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString("assets/python.json"),
      builder: (context, snapshot) {
        var myData = json.decode(snapshot.data.toString());
        if (myData == null) {
          return Scaffold(
            body: Center(
              child: Text(
                "Loading",
              ),
            ),
          );
        } else {
          return quizpage();
        }
      },
    );
  }
}

class quizpage extends StatefulWidget {
  @override
  _quizpageState createState() => _quizpageState();
}

class _quizpageState extends State<quizpage> {
  Widget choiceButton() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        onPressed: () {},
        child: Text(
          "Option One",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Alike",
            fontSize: 12.0,
          ),
          maxLines: 1,
        ),
        color: Colors.indigoAccent,
        splashColor: Colors.indigo[700],
        highlightColor: Colors.indigo[700],
        minWidth: 200.0,
        height: 40.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return WillPopScope(
      onWillPop: () {
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("QizStar"),
                  content: Text("You Cant Go Back at This Stage"),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "okay",
                      ),
                    )
                  ],
                ));
      },
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                child: Container(
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "This is a Sample Question?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10.0,
                      fontFamily: "Quando",
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    choiceButton(),
                    choiceButton(),
                    choiceButton(),
                    choiceButton(),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topCenter,
                child: Center(
                  child: Text(
                    "30",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Times New Roman',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
