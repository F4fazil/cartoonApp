import 'package:flutter/material.dart';

import 'yt_api.dart';

class CartoonViewModel extends ChangeNotifier {
  String _searchQuery = '';

  String get searchQuery => _searchQuery;

  set searchQuery(String value) {
    _searchQuery = value;
    notifyListeners();
  }

  final YoutubeApi _youtubeApi = YoutubeApi();

  Future<List<dynamic>> fetchCartoonVideos() async {
    notifyListeners();
    return await _youtubeApi.searchVideos('cartoon');
  }
}
