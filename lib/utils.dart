import 'dart:io';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

GetSnackBar(title) {
  return Get.rawSnackbar(
    title: 'Incomplete',
    message: title,
    duration: Duration(seconds: 1),
  );
}

GetSnack(title, message) {
  return Get.rawSnackbar(
    title: title,
    message: message,
    duration: Duration(seconds: 3),
  );
}

Future<void> GetStoragePermission() async {
  if (await Permission.storage.isDenied) {
    await Permission.storage.request();
  } else if (await Permission.storage.isRestricted) {
    await Permission.storage.request();
  } else if (await Permission.storage.isRestricted) {
    await Permission.storage.request();
  } else if (await Permission.storage.isPermanentlyDenied) {
    await Permission.storage.request();
    await openAppSettings();
  }
}

Future<bool> checkInternetConnection() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
    return false;
  } catch (_) {
    return false;
  }
}
