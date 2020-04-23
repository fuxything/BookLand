import 'dart:convert';
import 'package:bookland/model/model_user.dart';
import 'package:bookland/model/error.dart';
import 'package:http/http.dart' as http;
import 'package:bookland/services/globalVariable.dart';


class HTTPAll{
  static String basicAuth = 'Basic ' + base64Encode(utf8.encode('Daryl:WalkingDead'));
  static User user;
  Future getUser(String _email, String _password) async {
    http.Response response = await http.post('http://10.0.2.2:8080/login',
      headers: <String, String>{
        'Authorization': HTTPAll.basicAuth,
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': 'admin@a',//_email,
        'password':'12345678sdasc', // _password,
      }
      ),
    );
    if (response.statusCode < 400) {
      HTTPAll.user = User.fromJson(json.decode(response.body));
      CUSTOMERID = HTTPAll.user.CustomerId;
      FIRSTNAME = HTTPAll.user.firstName;
      ISADMIN =  HTTPAll.user.IsAdmin;
      isAnyUserLogin = true;
    } else {
      Error msg = Error.fromJson(json.decode(response.body));
      errorMessage = msg.error;
      isAnyUserLogin = false;

    }
  }

}