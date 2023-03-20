import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:notif_firebase/fcm_controller.dart';

class FcmService {
  late RemoteNotification? remoteNotification;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FCMController _fcmController = Get.put(FCMController());

  _initFcmController() {
    try {
      _fcmController = Get.find<FCMController>();
    } catch (e) {
      _fcmController = Get.put(FCMController());
    }
  }

  ///initial channel
  AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.max,
  );

  ///fetch device id
  fetchDeviceID() async {
    var deviceId = await FirebaseMessaging.instance.getToken();
    log(deviceId ?? "", name: "DEVICE_ID");
    return deviceId;
  }

  ///init key
  initKey() async {
    // ApiService().updateDeviceId(map: {"device_id": await fetchDeviceID()});
  }

  ///initial notification
  initFCM({required String resourceImage}) async {
    _initFcmController();
    fetchDeviceID();

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings(resourceImage);
    var initializationSettingsIOS = const IOSInitializationSettings();
    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: (String? payload) async {
      log("$payload", name: "Payload FCM");
      if (payload != null && payload != "") {
        selectedNotification(payload);
      }
    });

    await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);

    await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );

    // handle fcm notif
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      log("EventData: ${event.data["id"]}, ${event.data.toString()}", name: "broadcast received for message");
      log("EventNotification: ${event.notification?.title}, ${event.notification!.body}", name: "broadcast received for message");

      RemoteNotification? notification = event.notification;
      _fcmController.setPayload = "${event.data["id"]}:${event.data['page']}";
      // }
      if (notification != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              iOS: IOSNotificationDetails(),
              android: AndroidNotificationDetails(channel.id, channel.name,
                  channelDescription: channel.description, largeIcon: DrawableResourceAndroidBitmap(resourceImage)),
            ),
            payload: "${event.data["id"]}:${event.data['page']}");
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      RemoteNotification? notification = event.notification;
      _fcmController.setPayload = "${event.data["id"]}:${event.data['page']}";
      if (notification != null) {
        selectedNotification("${event.data["id"]}:${event.data['page']}");
      }
    });
  }

  ///select notification
  selectedNotification(String payload) async {
    flutterLocalNotificationsPlugin.cancelAll();
    try {
      List result = payload.split(":");
      var resultId = result[0];
      var resultPage = result[1];

      if (resultId != "null" && resultId != null) {
        log("id_not_null");
      } else {
        log("id_null");
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
