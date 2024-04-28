import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:gcet_app/models/api_model.dart';

const _base = "https://home-hub-app.herokuapp.com";
const _tokenURL = _base + _tokenEndpoint;

const _scheme = "http";
const _host = "localhost";
const _port = 8000;
const _tokenEndpoint = "/api-token-auth/";

Future<Token> getToken(UserLogin userLogin) async {
  // print(_tokenURL);
  final http.Response response = await http.post(
    Uri(scheme: _scheme, host: _host, port: _port, path: _tokenEndpoint),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(userLogin.toDatabaseJson()),
  );
  if (response.statusCode == 200) {
    return Token.fromJson(json.decode(response.body));
  } else {
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}
