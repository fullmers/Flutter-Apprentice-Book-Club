import 'dart:convert';

import 'package:apod/apod.dart';
import 'package:flutter/services.dart';

// Mock apod api service that grabs sample json data to mock apod request/response
class MockApodService {
  // Request that gets today's APOD
  Future<Apod> getCurrentApod() async {
    final currentApod = await _getCurrentApod();

    return currentApod;
  }

  // Get sample current Apod json to display in ui
  Future<Apod> _getCurrentApod() async {
    // Simulate api request wait time
    await Future.delayed(const Duration(milliseconds: 1000));
    // Load json from file system
    final dataString = await _loadAsset('assets/json/sample_current_apod.json');
    // Decode to json
    final Map<String, dynamic> json = jsonDecode(dataString);

    return Apod.fromJson(json);
  }

  // Get the recent Apod list from sample json posts to display on the recents tab
  Future<List<Apod>> _getRecentApodList() async {
    // Simulate api request wait time
    await Future.delayed(const Duration(milliseconds: 1000));
    // Load json from file system
    final dataString =
        await _loadAsset('assets/sample_data/sample_friends_feed.json');
    // Decode to json
    final Map<String, dynamic> json = jsonDecode(dataString);

    // Go through each Apod and convert json to Apod object.
    List<Apod> recentApods =
        List<Apod>.from(json.values.map((model) => Apod.fromJson(model)));

    return recentApods;
  }

  // Get the recent Apod list from sample json posts to display on the favorites tab
  Future<List<Apod>> _getFavoriteApodList() async {
    // Simulate api request wait time
    await Future.delayed(const Duration(milliseconds: 1000));
    // Load json from file system
    final dataString =
        await _loadAsset('assets/sample_data/sample_friends_feed.json');
    // Decode to json
    final Map<String, dynamic> json = jsonDecode(dataString);

    // Go through each Apod and convert json to Apod object.
    List<Apod> recentApods =
        List<Apod>.from(json.values.map((model) => Apod.fromJson(model)));

    return recentApods;
  }

  // Loads sample json data from file system
  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
}
