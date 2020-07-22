import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:async';

class APIServices {
  var paymentUrl = 'https://utruckit.co.za/zinwa/main/app/makepayment.php';
  var accountInformationUrl = 'https://a8dcd314913d.ngrok.io/main/app/api/accounts.php';
  var loginUrl = 'https://clicka-utenge.co.zw/zinwa/main/app/api/login.php/';
  var invoicesUrl = 'https://clicka-utenge.co.zw/zinwa/main/app/api/invoices.php';

  Future<http.Response> retrieveAccountInformation() async {
    return await http.get(accountInformationUrl);
  }

  Future<http.Response> login(String meterNumber, String password) async {
    var data = jsonEncode(<String, String>{
      'meter_number': meterNumber,
      'password': password,
    });

    return await http.post(loginUrl, body: data);
  }

  
  Future<http.Response> retrieveInvoices(String meterNumber) async {
    var data = jsonEncode(<String, String>{
      'meter_number': meterNumber,
    });

    return await http.post(invoicesUrl, body: data);
  }
}
