import 'dart:convert';

import 'package:x_youtube/remote_data/modle/modle.dart';

class Helper {
  Helper._();
  static final Helper instance = Helper._();
  static final String basul = 'https://youtube-media-downloader.p.rapidapi.com';
  static final Map<String, String> header = {
    'x-rapidapi-key': '1dd0873267msh261542318bf1ce6p135c87jsn7183871fced3',
    'x-rapidapi-host': 'youtube-media-downloader.p.rapidapi.com',
  };

  String formatViews(String t) {
    String clean = t.replaceAll(RegExp(r'[^0-9]'), '');

    int value = int.parse(clean);

    if (value >= 1000000000) {
      return '${(value / 1000000000).toStringAsFixed(1)}B';
    } else if (value >= 1000000) {
      return '${(value / 1000000).toStringAsFixed(1)}M';
    } else if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(1)}K';
    } else {
      return value.toString();
    }
  }
}
