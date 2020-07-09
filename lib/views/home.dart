import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:zinwa_pay/models/account_data.dart';
import 'package:zinwa_pay/networking/api.service.dart';
import 'package:zinwa_pay/views/payment.dart';


class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<Dashboard> {
  var accountInformation;

  @override
  void initState() {
    super.initState();
    accountInformation = getAccountInformation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text('Home')),
        body: Padding(
            padding: EdgeInsets.all(40.0),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Dashboard',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 50),
                    )),
                SizedBox(
                  height: 30.0,
                ),
                SizedBox(height: 300.0, width: 230.0, child: accontBalance()),
                SizedBox(
                  height: 50.0,
                ),
                Container(height: 50, child: payNow()),
              ],
            )));
  }

  SleekCircularSlider paymentProgressBar(dynamic accountInfomation) {
    var balance = 120.0;

    var circularProgress = SleekCircularSlider(
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
        initialValue: balance.toDouble());

    return circularProgress;
  }

  FutureBuilder accontBalance() {
    return FutureBuilder(
        future: accountInformation,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('None');
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Text('Waiting or active');
            case ConnectionState.done:
              return paymentProgressBar(accountInformation);
            default:
              return Text('Please reload');
          }
        });
  }

  RaisedButton payNow() {
    return RaisedButton(
        textColor: Colors.white,
        color: Colors.blue,
        child: Text('Pay Now',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 28)),
        onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Payment();
        }));
        });
  }

  getAccountInformation() async {
    // var someting = {"1":{"id":1,"meter_number":"abc12345678","password":"mypassword","balance":"5600","role":"customer"}};
    final response = await APIServices().retrieveAccountInformation();

    if (response.statusCode == 200) {
      return AccountInformation.fromJson(json.decode(response.body));
    } else {
      print('fail popup');
    }
  }
}
