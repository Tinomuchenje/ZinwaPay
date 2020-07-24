import 'package:flutter/material.dart';
import 'package:zinwa_pay/models/invoice_model.dart';
import 'package:zinwa_pay/widgets/drawer.dart';
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
        endDrawer: AppDrawer(),
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
        color: Colors.blue[400],
        shadowColor: Colors.blue,
        margin: EdgeInsets.all(13.0),
        elevation: 10.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 0.0, bottom: 5.0),
                child: Row(children: <Widget>[
                  Text(
                    invoice.datePaid,
                    style: new TextStyle(fontSize: 17.0, color: Colors.white),
                  ),
                  Spacer(),
                  Icon(Icons.attach_money, color: Colors.white,),
                  displayAmount(invoice.amount),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
                child: Row(children: <Widget>[
                  Text(
                    invoice.id,
                    style: new TextStyle(fontSize: 17.0, color: Colors.white),
                  ),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 0.0),
                child: Row(
                  children: <Widget>[
                    invoiceStatus(invoice.status),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.file_download),
                      color: Colors.blue[50],
                      onPressed: () {},
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

  Text displayAmount(double amount) {
    if (amount < 0) {
      return Text(
        (amount).toString(),
        style: new TextStyle(fontSize: 24, color: Colors.red[700]),
      );
    }
    return Text(
      (amount).toString(),
      style: new TextStyle(
        fontSize: 24.0,
        color: Colors.white,
      ),
    );
  }

  RaisedButton invoiceStatus(String status) {
    if (status.toUpperCase() == 'PAID') {
      return RaisedButton(
        textColor: Colors.white,
        color: Colors.green,
        child: Text(
          'PAID',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0, color: Colors.white),
        ),
        onPressed: () {},
      );
    }
    return RaisedButton(
      textColor: Colors.white,
      color: Colors.red[700],
      child: Text(
        'Not Paid',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0, color: Colors.white),
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
