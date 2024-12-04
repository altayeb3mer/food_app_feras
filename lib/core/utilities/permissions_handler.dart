

import 'package:food_app/core/utilities/logging.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsHandler{
  // Request write permission to external storage
 static Future<void> requestPermissions() async {
    //storage
    storagePermission();
  }
 static storagePermission()async{
    PermissionStatus status = await Permission.storage.status;

    // If permission is not granted, request it
    if (!status.isGranted) {
      status = await Permission.storage.request();
    }

    // If permission is still not granted, handle it accordingly
    if (status.isGranted) {
      Logging.info("Storage permission granted.");
    } else if (status.isDenied) {
      Logging.info("Storage permission denied.");
    } else if (status.isPermanentlyDenied) {
      Logging.info("Storage permission permanently denied. Open settings to enable it.");
      openAppSettings(); // Opens app settings for the user to manually grant permission
    }
  }
}