import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zinwa_pay/widgets/drawer.dart';

class BankPaymentScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<BankPaymentScreen> {
  var branchCode = TextEditingController();
  var amount = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Make Payment'),
        centerTitle: true,
      ),
      endDrawer: AppDrawer(),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: ListView(children: <Widget>[
              Container(
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                    controller: branchCode,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Branch Code/ Swift Code',
                    ),
                  )),
              Container(
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                    controller: amount,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[WhitelistingTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Amount to Pay',
                    ),
                  )),Container(
                  color: Colors.red,
                  height: 50.0,
                  width: 380.0,
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.blue,
                    child: Text(
                      "Proceed to Pay",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {
                      print("PAy pay");
                    },
                  )),
            ]),
          )),
    );
  }
}
