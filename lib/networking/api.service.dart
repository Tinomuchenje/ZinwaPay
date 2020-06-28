import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class APIServices {
  var baseUrl = 'https://a8dcd314913d.ngrok.io/main/app/api';
  var accountInformationUrl ='https://a8dcd314913d.ngrok.io/main/app/api/accounts.php';
  var loginUrl = 'https://a8dcd314913d.ngrok.io/main/app/api/login.php';  

  Future<http.Response> retrieveAccountInformation() async {
    return await http.get(accountInformationUrl);
  }

  Future<http.Response> login(TextEditingController meterNumber, TextEditingController password) async{
    return await http.post(loginUrl);
  }
}