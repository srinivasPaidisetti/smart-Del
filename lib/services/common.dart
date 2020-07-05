import 'package:shared_preferences/shared_preferences.dart';

class Common {
  // save mobileNumber on storage
  static Future<bool> setMobileNumber(String number) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('mobileNumber', number);
  }

  // get mobileNumber from storage
  static Future<String> getMobileNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return Future(() => prefs.getString('mobileNumber'));
  }
}
