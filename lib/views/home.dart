import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:zinwa_pay/models/account_information_model.dart';
import 'package:zinwa_pay/models/invoice_model.dart';
import 'package:zinwa_pay/networking/api.service.dart';
import 'package:zinwa_pay/views/payment_options.dart';
import 'invoices.dart';

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
        endDrawer: Drawer(
          child: ListView(children: <Widget>[
            UserAccountsDrawerHeader(accountName: Text("meterNumber"), accountEmail: Text("tino@gmail.com")),
            ListTile(
              title: Text(
                " Dashboard",
                style: TextStyle(color: Colors.blue),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text(
                " Account Details",
                style: TextStyle(color: Colors.blue),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text(
                " Notification History",
                style: TextStyle(color: Colors.blue),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text(
                " Location Services",
                style: TextStyle(color: Colors.blue),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text(
                "Contact Zinwa",
                style: TextStyle(color: Colors.blue),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text(
                "Reset Password",
                style: TextStyle(color: Colors.blue),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ]),
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
                  height: 280.0,
                  width: 230.0,
                  child: paymentProgressBar(accountInformation.balance),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 50,
                  child: payNow(),
                ),
                SizedBox(
                  height: 50.0,
                ),
                SizedBox(
                  height: 50.0,
                ),
                Container(
                  height: 50.0,
                  child: viewInvoices(accountInformation.meterNumber),
                )
              ],
            )));
  }

  RaisedButton viewInvoices(String meterNumber) {
    return RaisedButton(
      textColor: Colors.white,
      color: Colors.blue,
      child: Text(
        'View Invoices',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 28,
        ),
      ),
      onPressed: () async {
        var response = await APIServices().retrieveInvoices(meterNumber);
        if (response.statusCode == 200) {
          var dynamicList = json.decode(response.body) as List;
          var invoicesListToDisplay = dynamicList.map((x) => Invoice.fromJson(x)).toList();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Invoices(),
              settings: RouteSettings(arguments: invoicesListToDisplay),
            ),
          );
        }
      },
    );
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
            MaterialPageRoute(builder: (context) => PaymentOptionsScreen()),
          );
        });
  }
}
