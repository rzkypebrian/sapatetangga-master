# enerren

A new Flutter project.

ini adalah project kosongan sebagai dasar pembuatan project lainnya seperti membuat module,model ataupun project Utah

## Getting Started

buat breach baru dari breanc ini dan mulai menambahkan modul modul atau komppnen lainnya dengan cara pull from pada vs code

## Change Icon Louncher

ubah settingan pada file flutter_louncher_icon.yaml dan jalankan perintah berikut pada terminal

```c
flutter pub get
flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons.yaml
```

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

--cara bikin keystore
Nandangs-MacBook-Pro:Enerren_Mobile-1 nandanghermawan$ keytool -genkey -v -keystore ~/sieraddriver.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key

--cara bikin .pem untuk reset keystore
keytool -export -rfc -alias unggah -file upload_certificate.pem -keystore keystore.jks

---catatan build

## create app bundle

flutter build apk --release --no-tree-shake-icons

You are building a fat APK that includes binaries for android-arm, android-arm64, android-x64.
If you are deploying the app to the Play Store, it's recommended to use app bundles or split the
APK to reduce the APK size.
    To generate an app bundle, run:
        flutter build appbundle --target-platform android-arm,android-arm64,android-x64 --no-tree-shake-icons
        Learn more on: <https://developer.android.com/guide/app-bundle>
    To split the APKs per ABI, run:
        flutter build apk --target-platform android-arm,android-arm64,android-x64 --split-per-abi
        Learn more on:
        <https://developer.android.com/studio/build/configure-apk-splits#configure-abi-split>

## sierad driver -> sreeya

 dart package_changer.dart changePackage com.enerren.sierad.driver 'Sreeya Driver' 66 1.2.16 'assets/sierad/driver_launcher.png' sieraddriver

## sierad customer -> sreeya

 dart package_changer.dart changePackage com.enerren.sierad.customer 'Sreeya Customer' 37 1.2.7 'assets/sierad/sreeya_louncher.png' sieradcustomer

## sierad transporter -> sreeya

 dart package_changer.dart changePackage com.enerren.sierad.transporter 'Sreeya Transporter' 40 1.2.10 'assets/sierad/transporter_launcher.png' sieradtransporter

## sierad admin -> sreeya

 dart package_changer.dart changePackage com.enerren.sierad.admin 'Sreeya Admin' 38 1.2.8 'assets/sierad/admin_launcher.png' sieradadmin

## angkut driver

 dart package_changer.dart changePackage com.enerren.angkut.driver 'Angkut Driver' 64 1.2.34 'assets/angkut/driver_launcher.png' angkutdriver

## angkut customer

dart package_changer.dart changePackage com.enerren.angkut.customer 'Angkut' 89 1.2.59 'assets/angkut/logo_angkut.png' angkutcustomer

## angkut transporter

 dart package_changer.dart changePackage com.enerren.angkut.transporter 'Angkut Transporter' 39 1.1.39 'assets/angkut/transporter_launcher.png' angkuttransporter  

## inovatrack customer

 dart package_changer.dart changePackage com.enerren.inovatrack 'Inovatrack' 3 3.1.0 'assets/inovatrack/logo_inovatrack.png' inovatrack

## TMS Driver

dart package_changer.dart changePackage com.enerren.tms.driver 'Tms Driver' 7 1.1.7 'assets/tms/tms_driver_launcher.png' sieraddriver

## TMS Customer

dart package_changer.dart changePackage com.enerren.tms.customer 'TMS Customer' 7 1.1.7 'assets/tms/tms_launcher.png' sieradcustomer

## TMS Transporter

dart package_changer.dart changePackage com.enerren.tms.transporter 'TMS Transporter' 7 1.1.7 'assets/tms/tms_transporter_launcher.png' sieradtransporter

## TMS Admin

dart package_changer.dart changePackage com.enerren.tms.admin 'TMS Admin' 11 1.1.11 'assets/tms/tms_transporter_launcher.png' sieradadmin

## TMS Sapa Tetangga

dart package_changer.dart changePackage com.enerren.sapatetangga 'TMS Admin' 1 1.1.1 'assets/tms/tms_transporter_launcher.png' sieradadmin
