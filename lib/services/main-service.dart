import 'dart:convert';

import 'package:flutterbasicapp/services/apis.dart';
import 'package:http/http.dart';

import 'constant.dart';

class MainService {
  static final Client client = Client();

  static Future<Map<String, dynamic>> getApplicationData() async {
    final response = await client.get(BASE_URL + home_api);
    print('response ${response.body}');
    return json.decode(response.body);
  }
}
