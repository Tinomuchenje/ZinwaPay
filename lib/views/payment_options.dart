import 'package:flutter/material.dart';
import 'package:zinwa_pay/models/payment_options_model.dart';
import 'package:zinwa_pay/views/payment.dart';

class PaymentOptionsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<PaymentOptionsScreen> {
  int _selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Methods'),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            child: Text(
              '',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () => print(''),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: paymentOptions.length + 2,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return SizedBox(height: 15.0);
          } else if (index == paymentOptions.length + 1) {
            return SizedBox(height: 100.0);
          }
          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(10.0),
            width: double.infinity,
            height: 100.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: _selectedOption == index - 1 ? Border.all(color: Colors.blue) : null,
            ),
            child: buildListTile(index, context),
          );
        },
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: 20.0,
        color: Color(0xFFF3F3F3),
        child: Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                '',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(width: 8.0),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 2.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListTile buildListTile(int index, BuildContext context) {
    return ListTile(
      leading: paymentOptions[index - 1].image,
      title: Text(
        paymentOptions[index - 1].title,
        style: TextStyle(
          color: _selectedOption == index - 1 ? Colors.blue : Colors.grey[600],
        ),
      ),
      selected: _selectedOption == index - 1,
      onTap: () {
        setState(() {
          _selectedOption = index - 1;
        });
        if (paymentOptions[index - 1].title == "Ecocash") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Payment()),
          );
        }
      },
    );
  }
}
