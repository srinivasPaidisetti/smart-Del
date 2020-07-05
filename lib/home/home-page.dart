import 'package:flutter/material.dart';
import 'package:flutterbasicapp/services/main-service.dart';
import 'package:flutterbasicapp/strings.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;

  Map<String, dynamic> applicationData;

  @override
  void initState() {
    getApplicationData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appname),
      ),
      body: Container(
        child: Center(
            child: isLoading
                ? CircularProgressIndicator()
                : applicationData != null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              "AndroidAppMinVersion : ${applicationData['Data']['AndroidAppMinVersion'].toString()}"),
                          Text(
                              "AndroidAppLatestVersion : ${applicationData['Data']['AndroidAppLatestVersion'].toString()}"),
                          Text(
                              "iOSAppLatestVersion :${applicationData['Data']['iOSAppLatestVersion'].toString()}"),
                          Text(
                              "iOSAppMinVersion :${applicationData['Data']['iOSAppMinVersion'].toString()}"),
                          Text(
                              "ServerDeployedOn :${applicationData['Data']['ServerDeployedOn'].toString()}"),
                          Text(
                              "ServerVersion :${applicationData['Data']['ServerVersion'].toString()}"),
                          Text(
                              "SettingModifiedOn :${applicationData['Data']['SettingModifiedOn'].toString()}"),
                          Text(
                              "iOSAppMinVersion :${applicationData['Data']['iOSAppMinVersion'].toString()}"),
                        ],
                      )
                    : Text('SomeThing Went Wrong')),
      ),
    );
  }

  void getApplicationData() async {
    setState(() {
      isLoading = true;
    });
    await MainService.getApplicationData().then((value) {
      setState(() {
        applicationData = value;
        isLoading = false;
      });
    });
  }
}
