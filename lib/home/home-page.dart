import 'package:flutter/material.dart';
import 'package:flutterbasicapp/model/application_settings.dart';
import 'package:flutterbasicapp/services/main-service.dart';
import 'package:flutterbasicapp/strings.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;

  ApplicationSettings applicationSettings;

  @override
  void initState() {
    getApplicationData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appName),
      ),
      body: Container(
        child: Center(
            child: isLoading
                ? CircularProgressIndicator()
                : applicationSettings != null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              "AndroidAppMinVersion : ${applicationSettings.data.androidAppMinVersion.toString()}"),
                          Text(
                              "AndroidAppLatestVersion : ${applicationSettings.data.androidAppLatestVersion.toString()}"),
                          Text(
                              "iOSAppLatestVersion :${applicationSettings.data.iOsAppLatestVersion.toString()}"),
                          Text(
                              "iOSAppMinVersion :${applicationSettings.data.iOsAppMinVersion.toString()}"),
                          Text(
                              "ServerDeployedOn :${applicationSettings.data.serverDeployedOn.toString()}"),
                          Text(
                              "ServerVersion :${applicationSettings.data.serverVersion.toString()}"),
                          Text(
                              "SettingModifiedOn :${applicationSettings.data.settingModifiedOn.toString()}"),
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
        applicationSettings = ApplicationSettings.fromMap(value);
        isLoading = false;
      });
    });
  }
}
