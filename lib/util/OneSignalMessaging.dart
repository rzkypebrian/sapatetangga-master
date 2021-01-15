import 'package:enerren/util/ModeUtil.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class OneSignalMessaging {
  String appId = "ac7a2d3b-9c11-4ead-b50c-a8c6b6a13a81";
  Map<OSiOSSettings, dynamic> settings = {
    OSiOSSettings.autoPrompt: false,
    OSiOSSettings.promptBeforeOpeningPushUrl: true
  };
  ValueChanged<OSNotification> notificationHandler =
      (OSNotification notification) {
    ModeUtil.debugPrint("notif receive");
    ModeUtil.debugPrint(notification);
  };

  ValueChanged<OSNotificationOpenedResult> notificationOpenedHandler =
      (OSNotificationOpenedResult result) {
    ModeUtil.debugPrint("onOpenend Hnadler");
    ModeUtil.debugPrint(result);
  };

  ValueChanged<OSInAppMessageAction> notificationClickedHandler =
      (OSInAppMessageAction action) {
    ModeUtil.debugPrint("onCliked Hnadler");
    ModeUtil.debugPrint(action);
  };

  OneSignalMessaging({
    this.appId,
    this.notificationClickedHandler,
    this.notificationHandler,
    this.notificationOpenedHandler,
  });

  Future<void> initOneSignal() async {
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    OneSignal.shared.setRequiresUserPrivacyConsent(true);

    if (notificationOpenedHandler != null) {
      OneSignal.shared.setNotificationReceivedHandler(
        (OSNotification notification) {
          notificationHandler(notification);
        },
      );
    }

    if (notificationOpenedHandler != null) {
      OneSignal.shared
          .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
        notificationOpenedHandler(result);
      });
    }

    OneSignal.shared
        .setInAppMessageClickedHandler((OSInAppMessageAction action) {});
    ModeUtil.debugPrint("init one signal with appid ${this.appId}");
    await OneSignal.shared.init("${this.appId}", iOSSettings: settings);
    OneSignal.shared
        .setInFocusDisplayType(OSNotificationDisplayType.notification);
    OneSignal.shared.consentGranted(true);
  }

  Future<String> getTokenId() async {
    var status = await OneSignal.shared.getPermissionSubscriptionState();
    var playerId = status.subscriptionStatus.userId;
    return playerId;
  }
}
