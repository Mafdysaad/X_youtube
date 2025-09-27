import 'package:flutter/material.dart';

class CustomAvatar extends StatelessWidget {
  const CustomAvatar({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(radius: 30, backgroundImage: NetworkImage(url));
  }
}
