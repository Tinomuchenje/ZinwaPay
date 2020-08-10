import 'package:flutter/material.dart';
import 'package:zinwa_pay/models/bank_options_model.dart';
import 'package:zinwa_pay/widgets/drawer.dart';

import 'bank_payment.dart';
import 'mobile_payment.dart';

class SelectBankScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _State();
  }
  
  class _State extends State<SelectBankScreen> {
    int _selectedOption = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select A Bank'),
        centerTitle: true,       
      ),
      endDrawer: AppDrawer(),
      body: ListView.builder(
        itemCount: banks.length + 2,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return SizedBox(height: 15.0);
          } else if (index == banks.length + 1) {
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
      title: Text(
        banks[index - 1].name,
        style: TextStyle(
          fontSize: 17.0,
          fontWeight: FontWeight.bold,
          color: _selectedOption == index - 1 ? Colors.blue : Colors.grey[600],
        ),
      ),
      selected: _selectedOption == index - 1,
      onTap: () {
        setState(() {
          _selectedOption = index - 1;
        });
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BankPaymentScreen()),
      );
      },
    );
  }
}
