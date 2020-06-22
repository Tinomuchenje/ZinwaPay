import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

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
                    height: 300.0, width: 230.0, child: paymentProgressBar()),
                SizedBox(
                  height: 50.0,
                ),
                Container(height: 50, child: payNow()),
              ],
            )));
  }

  SleekCircularSlider paymentProgressBar() {
    var amountDue = 1300;

    return SleekCircularSlider(
        appearance: CircularSliderAppearance(
            infoProperties: InfoProperties(
                bottomLabelText: "Amount Due",
                bottomLabelStyle: TextStyle(color: Colors.red),
                modifier: (double value) {
                  final amountDue = value.ceilToDouble();
                  return '\$ $amountDue';
                }),
            customWidths:
                CustomSliderWidths(progressBarWidth: 10.0, trackWidth: 10.0),
            customColors: CustomSliderColors(
                progressBarColor: Colors.blue, trackColor: Colors.grey)),
        min: 0,
        max: 2000,
        initialValue: amountDue.toDouble());
  }

  RaisedButton payNow() {
    return RaisedButton(
        textColor: Colors.white,
        color: Colors.blue,
        child: Text('Pay Now',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 28)),
        onPressed: () {
          print("Payment");
        });
  }
}
