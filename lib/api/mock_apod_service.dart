import 'dart:convert';

import 'package:apod/features/shared/models/apod.dart';
import 'package:flutter/services.dart';

/// Mock apod api service that grabs sample json data to mock apod request/response
class MockApodService {
  /// Request that gets today's APOD
  Future<Apod> getCurrentApod() async {
    final currentApod = await _getCurrentApod();

    return currentApod;
  }

  /// A painfully terrible implementation of fetching a single APOD,
  /// but we'll tidy this up further during deep state management.
  Future<Apod?> getSingleApod(int id) async {
    final recentApods = await _getRecentApodList();
    return recentApods.firstWhere((Apod apod) => apod.id == id);
  }

  /// Request that gets a list of recent APOD
  Future<List<Apod>> getRecentApods() async {
    final recentApods = await _getRecentApodList();

    return recentApods;
  }

  /// Request that gets favorited APODs
  Future<List<Apod>> getFavoriteApods() async {
    final favoriteApods = await _getFavoriteApodList();

    return favoriteApods;
  }

  /// Get sample current Apod json to display in ui
  Future<Apod> _getCurrentApod() async {
    // Simulate api request wait time
    await Future.delayed(const Duration(milliseconds: 200));
    // Load json from file system
    final dataString = await _loadAsset('assets/json/sample_current_apod.json');
    // Decode to json
    final Map<String, dynamic> json = jsonDecode(dataString);

    return Apod.fromJson(json);
  }

  /// Get the recent Apod list from sample json to display on the recents tab
  Future<List<Apod>> _getRecentApodList() async {
    // Simulate api request wait time
    await Future.delayed(const Duration(milliseconds: 200));
    // Load json from file system
    final dataString = await _loadAsset('assets/json/sample_recent_apods.json');
    // decode json
    final apodList = json.decode(dataString);
    List<Apod> recentApods = [];
    apodList.forEach((e) => recentApods.add(Apod.fromJson(e)));
    return recentApods;
  }

  /// Get the favorite Apod list from sample json to display on the favorites tab
  Future<List<Apod>> _getFavoriteApodList() async {
    // Simulate api request wait time
    await Future.delayed(const Duration(milliseconds: 200));
    // Load json from file system
    final dataString =
        await _loadAsset('assets/json/sample_favorite_apods.json');
    // decode json
    final apodList = json.decode(dataString);
    List<Apod> favoriteApods = [];
    apodList.forEach((e) => favoriteApods.add(Apod.fromJson(e)));
    return favoriteApods;
  }

  /// Loads sample json data from file system
  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
}
