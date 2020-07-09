import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:zinwa_pay/models/account_data.dart';
import 'package:zinwa_pay/networking/api.service.dart';
import 'home.dart';
import 'package:status_alert/status_alert.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<LoginPage> {
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text('Login')),
        body: Form(
            key: _formKey,
            child: Padding(
                padding: EdgeInsets.all(30),
                child: ListView(
                  children: <Widget>[
                    Container(alignment: Alignment.center, padding: EdgeInsets.all(10), child: name()),
                    Container(child: Image.asset('assets/zinwa_logo.png', height: 260.0, width: 260.0)),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: meterNumberInput(),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: passwordInput(),
                    ),
                    FlatButton(
                      onPressed: () {
                        //forgot password screen
                      },
                      textColor: Colors.blue,
                      child: Text('Forgot Password'),
                    ),
                    Container(height: 50, padding: EdgeInsets.fromLTRB(10, 0, 10, 0), child: loginButton(context)),
                    Container(
                        child: Row(
                      children: <Widget>[
                        Text('Does not have account?'),
                        FlatButton(
                          textColor: Colors.blue,
                          child: Text(
                            'Request',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            //signup screen
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ))
                  ],
                ))));
  }

  RaisedButton loginButton(BuildContext context) {
    return RaisedButton(
      textColor: Colors.white,
      color: Colors.blue,
      child: Text('Login'),
      onPressed: () {
        if (_formKey.currentState.validate()) {
          login();
        }
      },
    );
  }

  login() async {
    var response = await APIServices().login(nameController.text, passwordController.text);

    if (response.statusCode == 200) {
      var accountInformation = AccountInformation.fromJson(json.decode(response.body));

      if (accountInformation.status == "OK") {

        StatusAlert.show(
          context,
          duration: Duration(seconds: 3),
          title: 'Login',
          subtitle: accountInformation.message,
          configuration: IconConfiguration(icon: Icons.done),
        );

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Dashboard();
        }));
      } else {

        return StatusAlert.show(
          context,
          duration: Duration(seconds: 3),
          title: 'Login Failed',
          subtitle: accountInformation.message,
          configuration: IconConfiguration(icon: Icons.cancel),
        );
      }
    } else {
      throw Exception('Failed to connect');
    }
  }

  TextFormField passwordInput() {
    return TextFormField(
      obscureText: true,
      controller: passwordController,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Password',
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter password';
        }
        return null;
      },
    );
  }

  TextFormField meterNumberInput() {
    return TextFormField(
        controller: nameController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Meter Number',
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter meter number';
          }
          return null;
        });
  }

  Text name() {
    return Text(
      'Zinwa Pay',
      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500, fontSize: 50),
    );
  }
}
