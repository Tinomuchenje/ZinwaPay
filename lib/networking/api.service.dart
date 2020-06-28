import 'package:http/http.dart' as http;
import 'dart:async';

class APIServices {
  var baseUrl = 'https://a8dcd314913d.ngrok.io/main/app/api';
  var accountInformationUrl ='https://a8dcd314913d.ngrok.io/main/app/api/accounts.php';
  var loginUrl = 'https://a8dcd314913d.ngrok.io/main/app/api/login.php';  

  Future<http.Response> retrieveAccountInformation() async {
    return await http.get(accountInformationUrl);
  }

  Future<http.Response> login(String meterNumber, String password) async{
    var data = {
      'meter_number': meterNumber,
      'password': password
    };
    return await http.post(loginUrl, body: data);
  }
}