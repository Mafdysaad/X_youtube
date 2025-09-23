import 'package:flutter/material.dart';

class Customtext extends StatelessWidget {
  const Customtext({
    super.key,
    required this.title,
    required this.style,
    required this.isdescraption,
  });
  final String title;
  final TextStyle style;
  final bool isdescraption;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: style, maxLines: 2);
  }
}
