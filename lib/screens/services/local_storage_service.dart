import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  // Save data to local storage
  Future<void> saveData(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(value);
    await prefs.setString(key, jsonString);
  }

  // Load data from local storage
  Future<dynamic> loadData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(key);
    if (jsonString != null) {
      return jsonDecode(jsonString);
    }
    return null;
  }

  // Remove data from local storage
  Future<void> removeData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}