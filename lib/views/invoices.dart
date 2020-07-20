import 'package:flutter/material.dart';
import 'package:zinwa_pay/models/invoice.dart';
import 'payment.dart';

class Invoices extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<Invoices> {
  @override
  Widget build(BuildContext context) {
    final List<Invoice> invoices = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text('Invoices'),
          centerTitle: true,
        ),
        body: Container(
          child: new ListView.builder(
            itemCount: invoices.length,
            itemBuilder: (BuildContext context, int index) => invoiceCard(invoices, index),
          ),
        ));
  }

  Widget invoiceCard(List<Invoice> invoices, int index) {
    final invoice = invoices[index];
    return new Container(
      child: Card(
        margin: EdgeInsets.all(13.0),
        elevation: 10.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
                child: Row(children: <Widget>[
                  Text(
                    invoice.id,
                    style: new TextStyle(fontSize: 20.0),
                  ),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
                child: Row(children: <Widget>[
                  Text("20/07/20"),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 0.0),
                child: Row(
                  children: <Widget>[
                    invoiceStatus(invoice.status),
                    Spacer(),
                    Icon(
                      Icons.attach_money,
                      color: Colors.green,
                    ),
                    Text(
                      (invoice.amount).toString(),
                      style: new TextStyle(fontSize: 30.0),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  RaisedButton invoiceStatus(String status) {
    if (status == 'Paid') {
      return RaisedButton(
        textColor: Colors.white,
        color: Colors.green,
        child: Text(
          'Paid',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
        onPressed: () {},
      );
    }
    return RaisedButton(
      textColor: Colors.white,
      color: Colors.red[700],
      child: Text(
        'Not Paid',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Payment()),
        );
      },
    );
  }
}
