// lib/models/api/youtube_api.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ui_awesome/models/apis/api_class.dart';

class YoutubeApi {
  final String _baseUrl = ApiConstants.youtubeApiUrl;

  Future<List<dynamic>> searchVideos(String query) async {
    final url = Uri.parse(
      '$_baseUrl/search?part=snippet&q=$query&type=video&key=${ApiConstants.youtubeApiKey}',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['items'];
    } else {
      throw Exception('Failed to load videos');
    }
  }
}
