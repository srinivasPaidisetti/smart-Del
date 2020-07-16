import 'dart:convert';

class ApplicationSettings {
  ApplicationSettings({
    this.data,
    this.responseCode,
    this.responseMessage,
    this.responseCodeText,
  });

  Data data;
  int responseCode;
  String responseMessage;
  String responseCodeText;

  factory ApplicationSettings.fromJson(String str) =>
      ApplicationSettings.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ApplicationSettings.fromMap(Map<String, dynamic> json) =>
      ApplicationSettings(
        data: json["Data"] == null ? null : Data.fromMap(json["Data"]),
        responseCode:
            json["ResponseCode"] == null ? null : json["ResponseCode"],
        responseMessage:
            json["ResponseMessage"] == null ? null : json["ResponseMessage"],
        responseCodeText:
            json["ResponseCodeText"] == null ? null : json["ResponseCodeText"],
      );

  Map<String, dynamic> toMap() => {
        "Data": data == null ? null : data.toMap(),
        "ResponseCode": responseCode == null ? null : responseCode,
        "ResponseMessage": responseMessage == null ? null : responseMessage,
        "ResponseCodeText": responseCodeText == null ? null : responseCodeText,
      };
}

class Data {
  Data({
    this.androidAppMinVersion,
    this.androidAppLatestVersion,
    this.iOsAppLatestVersion,
    this.iOsAppMinVersion,
    this.serverDeployedOn,
    this.serverVersion,
    this.settingModifiedOn,
    this.supportedLanguages,
  });

  int androidAppMinVersion;
  int androidAppLatestVersion;
  String iOsAppLatestVersion;
  String iOsAppMinVersion;
  DateTime serverDeployedOn;
  String serverVersion;
  DateTime settingModifiedOn;
  List<dynamic> supportedLanguages;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        androidAppMinVersion: json["AndroidAppMinVersion"] == null
            ? null
            : json["AndroidAppMinVersion"],
        androidAppLatestVersion: json["AndroidAppLatestVersion"] == null
            ? null
            : json["AndroidAppLatestVersion"],
        iOsAppLatestVersion: json["iOSAppLatestVersion"] == null
            ? null
            : json["iOSAppLatestVersion"],
        iOsAppMinVersion:
            json["iOSAppMinVersion"] == null ? null : json["iOSAppMinVersion"],
        serverDeployedOn: json["ServerDeployedOn"] == null
            ? null
            : DateTime.parse(json["ServerDeployedOn"]),
        serverVersion:
            json["ServerVersion"] == null ? null : json["ServerVersion"],
        settingModifiedOn: json["SettingModifiedOn"] == null
            ? null
            : DateTime.parse(json["SettingModifiedOn"]),
        supportedLanguages: json["SupportedLanguages"] == null
            ? null
            : List<dynamic>.from(json["SupportedLanguages"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "AndroidAppMinVersion":
            androidAppMinVersion == null ? null : androidAppMinVersion,
        "AndroidAppLatestVersion":
            androidAppLatestVersion == null ? null : androidAppLatestVersion,
        "iOSAppLatestVersion":
            iOsAppLatestVersion == null ? null : iOsAppLatestVersion,
        "iOSAppMinVersion": iOsAppMinVersion == null ? null : iOsAppMinVersion,
        "ServerDeployedOn": serverDeployedOn == null
            ? null
            : serverDeployedOn.toIso8601String(),
        "ServerVersion": serverVersion == null ? null : serverVersion,
        "SettingModifiedOn": settingModifiedOn == null
            ? null
            : settingModifiedOn.toIso8601String(),
        "SupportedLanguages": supportedLanguages == null
            ? null
            : List<dynamic>.from(supportedLanguages.map((x) => x)),
      };
}
