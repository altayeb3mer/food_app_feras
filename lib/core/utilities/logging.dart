import 'dart:io';
import 'dart:math';

import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

class Logging {
  static final Logger _logger = Logger(printer: PrettyPrinter());
  static late File _logFile;
  static bool _isInitialized = false; // To track initialization

  // Initialize the log file (static method)
  static Future<void> _initLogFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/app_logs.txt';
    _logFile = File(path);

    // Check if log file is older than 7 days and delete if necessary
    await _checkAndDeleteOldLogs();
    _isInitialized = true; // Mark as initialized
  }

  // Static log method
  static Future<void> log(String message, Level level) async {
    // Initialize the log file once
    if (!_isInitialized) {
      await _initLogFile();
    }

    // Log to the console
    _logger.log(level, message);

    // Write the log to the file
    if (await _logFile.exists()) {
      await _logFile.writeAsString('${DateTime.now()} - $message\n', mode: FileMode.append);
    } else {
      await _logFile.writeAsString('${DateTime.now()} - $message\n');
    }
  }

  // Check if the log file is older than 7 days and delete it if necessary
  static Future<void> _checkAndDeleteOldLogs() async {
    if (await _logFile.exists()) {
      DateTime lastModified = await _logFile.lastModified();
      if (DateTime.now().difference(lastModified).inDays > 7) {
        await _logFile.delete();
        print("Old log file deleted.");
      }
    }
  }
 static Future<void> info(String msg) async {
    log(msg, Level.info);
  }

 static Future<void> error(String msg) async {
    log(msg, Level.error);
  }


}
