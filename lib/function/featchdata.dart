import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Helper {
  Helper._();
  static final Helper instance = Helper._();
  static final String basul = 'https://youtube-media-downloader.p.rapidapi.com';
  static final Map<String, String> headers = {
    'x-rapidapi-key': 'f9b77bd784mshfa68ff959d99a43p10f057jsn1a48ce64f9b7',
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

  static Future<void> _openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  static List<TextSpan> buildTextSpans(String text) {
    final regex = RegExp(r"(#\w+|https?://[^\s]+)");
    final matches = regex.allMatches(text);

    int lastIndex = 0;
    final spans = <TextSpan>[];

    for (final match in matches) {
      // Add normal text before match
      if (match.start > lastIndex) {
        spans.add(
          TextSpan(
            text: text.substring(lastIndex, match.start),
            style: const TextStyle(color: Colors.white),
          ),
        );
      }

      final matchedText = match.group(0)!;

      if (matchedText.startsWith("#")) {
        // Hashtag
        spans.add(
          TextSpan(
            text: matchedText,
            style: const TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                debugPrint("Clicked hashtag: $matchedText");
              },
          ),
        );
      } else if (matchedText.startsWith("http")) {
        // Link
        spans.add(
          TextSpan(
            text: matchedText,
            style: const TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                _openUrl(matchedText);
              },
          ),
        );
      }

      lastIndex = match.end;
    }

    // Add any remaining text after last match
    if (lastIndex < text.length) {
      spans.add(
        TextSpan(
          text: text.substring(lastIndex),
          style: const TextStyle(color: Colors.white),
        ),
      );
    }

    return spans;
  }
}
