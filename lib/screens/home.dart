import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(40.0),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    child: Text(
                      'DashBoard',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 50),
                    )),
                SizedBox(
                  height: 30.0,
                ),
                SizedBox(
                    height: 300.0,
                    width: 230.0,
                    child: CircularProgressIndicator(
                      value: 0.1,
                      strokeWidth: 30.0,
                      backgroundColor: Colors.white,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                    )),
                SizedBox(
                  height: 50.0,
                ),
                Container(
                    height: 50,
                    child: RaisedButton(
                        textColor: Colors.white,
                        color: Colors.blue,
                        child: Text('Pay Now',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, 
                                fontSize: 28)),
                        onPressed: () {
                          print("Payment");
                        })),
              ],
            )));
  }
}