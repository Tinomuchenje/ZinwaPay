import 'package:http/http.dart' as http;
import 'dart:async';

class APIServices {
  var accountInformationUrl =
      'https://a8dcd314913d.ngrok.io/main/app/api/accounts.php';

  Future<http.Response> retrieveAccountInformation() async {
    return await http.get(accountInformationUrl);
  }
}