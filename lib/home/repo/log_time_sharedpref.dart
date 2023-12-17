import 'dart:convert';

import 'package:elixr_poc/home/model/log_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogTimeSharedPref {
  static final Future<SharedPreferences> _pref =
      SharedPreferences.getInstance();

  static Future<void> setLog(LogModel logdata) async {
    try {
      SharedPreferences preferences = await _pref;
      List<String> existingList = preferences.getStringList('loglist') ?? [];
      existingList.add(jsonEncode(logdata.toMap()));
      await preferences.setStringList('loglist', existingList);
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<LogModel>> getLog() async {
    List<LogModel> logData = [];

    try {
      SharedPreferences preferences = await _pref;
      List<String> existingData = preferences.getStringList('loglist') ?? [];

      existingData.map((e) {
        LogModel logModel = LogModel();
        logModel = LogModel.fromJson(jsonDecode(e));
        logData.add(logModel);
      }).toList();

      return logData;
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> deleteLogData(LogModel logData) async {
    try {
      SharedPreferences preferences = await _pref;
      List<String> existingData = preferences.getStringList('loglist') ?? [];
      if (existingData.isNotEmpty) {
        var dataTodelete = jsonEncode(logData.toMap());
        existingData.remove(dataTodelete.toString());
        await preferences.setStringList('loglist', existingData);
      }
    } catch (e) {
      rethrow;
    }
  }
}
