import 'dart:io';

void main(List<String> arguments) async {
  if (arguments[0] == "changePackage") {
    if (arguments.length == 3) {
      changePackage(arguments[1], arguments[2]);
    } else if (arguments.length == 4) {
      try {
        changePackage(arguments[1], arguments[2], int.parse(arguments[3]));
      } catch (e) {
        print(e);
      }
    } else if (arguments.length == 5) {
      try {
        changePackage(
          arguments[1],
          arguments[2],
          int.parse(arguments[3]),
          arguments[4],
        );
      } catch (e) {
        print(e);
      }
    } else if (arguments.length == 6) {
      try {
        changePackage(
          arguments[1],
          arguments[2],
          int.parse(arguments[3]),
          arguments[4],
          arguments[5],
        );
      } catch (e) {
        print(e);
      }
    } else if (arguments.length == 7) {
      changePackage(
        arguments[1],
        arguments[2],
        int.parse(arguments[3]),
        arguments[4],
        arguments[5],
        arguments[6],
      );
    } else {
      print(
          "jumlah argument tidak valid changePackage memerlukan appId versioncode versionname");
    }
  } else if (arguments[0] == "changeGoogleMapApiKey") {
    if (arguments.length != 2) {
      print(
          "change package memerlukan 1 parameter googleMapApiKey anda memasukan ${arguments.length - 1}");
    } else {
      changeGoogleMapApiKey(arguments[1]);
    }
  } else if (arguments[0] == "remarkAsset") {
    if (arguments.length != 2) {
      print(
          "change package memerlukan 1 parameter assetName anda memasukan ${arguments.length - 1}");
    } else {
      remarkAsset(arguments[1]);
    }
  } else if (arguments[0] == "unRemarkAsset") {
    if (arguments.length != 2) {
      print(
          "change package memerlukan 1 parameter assetName anda memasukan ${arguments.length - 1}");
    } else {
      unRemarkAsset(arguments[1]);
    }
  } else {
    print("perintah ${arguments[0]} tidak ditermukan");
  }
}

void changePackage(
  String packageName,
  String appName, [
  int versionCode,
  String versionName,
  String newIcon,
  String keyStoreProperties,
]) {
  print("change bundle id in android/app/build.gradle");
  File buildGradle = File('android/app/build.gradle');
  buildGradle.readAsString().then((String contents) {
    var newcontent = contents.replaceAll(
        RegExp(r'applicationId ".*"'), 'applicationId "$packageName"');
    if (versionCode != null) {
      print("change version code in android/app/build.gradle");
      newcontent = newcontent.replaceAll(
          RegExp(r'versionCode .*'), 'versionCode $versionCode');
    }
    if (versionName.isNotEmpty && versionName != null) {
      print("change version name in android/app/build.gradle");
      newcontent = newcontent.replaceAll(
          RegExp(r'versionName .*'), "versionName '$versionName'");
    }
    if (keyStoreProperties.isNotEmpty && keyStoreProperties != null) {
      print("change keystoreproperties in android/app/build.gradle");
      newcontent = newcontent.replaceAll(
          RegExp(r"def keystorePropertiesFile = rootProject\.file\(\'.*\'\)"),
          "def keystorePropertiesFile = rootProject.file('properties/$keyStoreProperties.properties')");
    }
    buildGradle.writeAsString(newcontent);
  });

  print("change bundle id in android manifest debug");
  File debugManifest = File('android/app/src/debug/AndroidManifest.xml');
  debugManifest.readAsString().then((contents) {
    var newcontent =
        contents.replaceAll(RegExp(r'package=".*"'), 'package="$packageName"');
    debugManifest.writeAsString(newcontent);
  });

  print("change bundle id and app label in android manifest main");
  File mainManifest = File('android/app/src/main/AndroidManifest.xml');
  mainManifest.readAsString().then((contents) {
    var newcontent = contents
        .replaceAll(RegExp(r'package=".*"'), 'package="$packageName"')
        .replaceAll(
            RegExp(r'(android:label="[^"]*")'), 'android:label="$appName"');
    mainManifest.writeAsString(newcontent);
  });

  print(
      "change package name in android app/src/main/java/com/example/enerren/MainActivity.java");
  File mainActivityJava =
      File('android/app/src/main/java/com/example/enerren/MainActivity.java');
  mainActivityJava.readAsString().then((contents) {
    var newcontent =
        contents.replaceAll(RegExp(r'package .*'), 'package $packageName;');
    mainActivityJava.writeAsString(newcontent);
  });

  print(
      "change package name in android app/src/main/kotlin/com/example/enerren/MainActivity.kt");
  File mainActivityKt =
      File('android/app/src/main/kotlin/com/example/enerren/MainActivity.kt');
  mainActivityKt.readAsString().then((contents) {
    var newcontent =
        contents.replaceAll(RegExp(r'package .*'), 'package $packageName');
    mainActivityKt.writeAsString(newcontent);
  });

  print("change version name in lib/util/internalDataUtil.dart");
  File internalDataUtil = File('lib/util/internalDataUtil.dart');
  internalDataUtil.readAsString().then((contents) {
    var newcontent = contents.replaceAll(
        RegExp(r'String version = .*'), 'String version = "$versionName";');
    internalDataUtil.writeAsString(newcontent);
  });

  if (newIcon.isNotEmpty && newIcon != null) {
    print("change image path in flutter_loucher_icon.yaml");
    File laucherIcon = File('flutter_launcher_icons.yaml');
    laucherIcon.readAsString().then((contents) {
      var newcontent = contents.replaceAll(
          RegExp(r'image_path:.*'), 'image_path: "$newIcon"');
      laucherIcon.writeAsString(newcontent);
    });
    print("harap jalankan flutter pub get kemudian");
    print(
        "harap jalankan flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons.yaml");
    print("untuk menerapkan icon baru");
  }

  print("updade google service json");
  if (FileSystemEntity.typeSync("google-service/$packageName.json") !=
      FileSystemEntityType.notFound) {
    File googleServiceProperties = File('google-service/$packageName.json');
    print("update google-service.json");
    googleServiceProperties.readAsString().then((value) {
      File("android/app/google-services.json").writeAsString(value);
      print("add google service");
      File buildGradle = File('android/app/build.gradle');
      buildGradle.readAsString().then((String contents) {
        var newcontent = contents.replaceAll(
            RegExp(r"// apply plugin: 'com.google.gms.google-services'"),
            "apply plugin: 'com.google.gms.google-services'");
        newcontent = newcontent.replaceAll(
            RegExp(r"// googleServices { disableVersionCheck = true }"),
            "googleServices { disableVersionCheck = true }");
        buildGradle.writeAsString(newcontent);
      });
    });
  } else {
    print("delete google-service.json");
    if (FileSystemEntity.typeSync("android/app/google-services.json") !=
        FileSystemEntityType.notFound) {
      final dir = Directory("android/app/google-services.json");
      dir.deleteSync(recursive: true);
    }
    print("remark google-service in build gradle");
    // File buildGradle2 = File('android/app/build.gradle');
    // buildGradle2.readAsString().then((String contents) {
    //   var newcontent2 = contents.replaceAll(
    //       RegExp(r"apply plugin: 'com.google.gms.google-services'"),
    //       "// apply plugin: 'com.google.gms.google-services'");
    //   newcontent2 = newcontent2.replaceAll(
    //       RegExp(r"googleServices { disableVersionCheck = true }"),
    //       "// googleServices { disableVersionCheck = true }");
    //   buildGradle2.writeAsString(newcontent2);
    // });
  }
}

void changeGoogleMapApiKey(String apiKey) {
  print("change google map api key in build.gradle");
  File buildGradle = File('android/app/build.gradle');
  buildGradle.readAsString().then((String contents) {
    var newcontent = contents.replaceAll(
        RegExp(r'(mapsApiKey:[^"]*"[^"]*")'), 'mapsApiKey: "$apiKey"');
    buildGradle.writeAsString(newcontent);
  });
  print("change google map api key in AppDelegate.m");
  File appDelegate = File('ios/Runner/AppDelegate.m');
  appDelegate.readAsString().then((String contents) {
    var newcontent = contents.replaceAll(
        RegExp(r'(\[GMSServices provideAPIKey:@"[^"]*"\])'),
        '[GMSServices provideAPIKey:@"$apiKey"]');
    appDelegate.writeAsString(newcontent);
  });
  print("change google map api key in globalData.dart");
  File globalData = File('lib/util/GlobalDataUtil.dart');
  globalData.readAsString().then((String contents) {
    var newcontent = contents.replaceAll(
        RegExp(r'(String.*googleMapApiKey.*=.*"[^"]*";)'),
        'String googleMapApiKey = "$apiKey";');
    globalData.writeAsString(newcontent);
  });
}

void unRemarkAsset(String assetsName) {
  print("remark asset $assetsName from pubspecc.yaml");
  File yaml = File('pubspec.yaml');
  yaml.readAsString().then((String contents) {
    var newcontent = contents
        .replaceAll('# - assets/$assetsName/', '- assets/$assetsName/')
        .replaceAll(
          "# - assets/flares/$assetsName/",
          "- assets/flares/$assetsName/",
        );
    yaml.writeAsString(newcontent);
  });
}

void remarkAsset(String assetsName) {
  print("remark asset $assetsName from pubspec.yaml");
  File yaml = File('pubspec.yaml');
  yaml.readAsString().then((String contents) {
    var newcontent = contents
        .replaceAll('- assets/$assetsName/', '# - assets/$assetsName/')
        .replaceAll(
          "- assets/flares/$assetsName/",
          "# - assets/flares/$assetsName/",
        );
    yaml.writeAsString(newcontent);
  });
}
