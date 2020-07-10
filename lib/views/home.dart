import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:zinwa_pay/models/account_data.dart';
import 'package:zinwa_pay/views/payment.dart';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final AccountInformation accountInformation = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          centerTitle: true,
        ),
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
                      fontSize: 50,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                SizedBox(
                  height: 300.0,
                  width: 230.0,
                  child: paymentProgressBar(accountInformation.balance),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Container(
                  height: 50,
                  child: payNow(),
                ),
              ],
            )));
  }

  SleekCircularSlider paymentProgressBar(double balance) {
    return SleekCircularSlider(
      appearance: CircularSliderAppearance(
        infoProperties: InfoProperties(
          bottomLabelText: "Amount Due",
          bottomLabelStyle: TextStyle(
            color: Colors.red,
          ),
          modifier: getAmount,
        ),
        customWidths: CustomSliderWidths(
          progressBarWidth: 10.0,
          trackWidth: 10.0,
        ),
        customColors: CustomSliderColors(
          progressBarColor: Colors.blue,
          trackColor: Colors.grey,
        ),
      ),
      min: 0,
      max: 200000,
      initialValue: balance,
    );
  }

  String getAmount(double value) {
    final amountDue = value.ceilToDouble();
    return '\$ $amountDue';
  }

  RaisedButton payNow() {
    return RaisedButton(
        textColor: Colors.white,
        color: Colors.blue,
        child: Text(
          'Pay Now',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 28,
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Payment()),
          );
        });
  }
}
