import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:x_youtube/screen/widgets/customtext.dart';

class Customappbar extends StatelessWidget {
  const Customappbar({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onsubmitted,
    required this.istyping,
    required this.ontap,
  });
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Function(String)? onsubmitted;
  final void Function()? ontap;
  final bool istyping;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset('lib/assets/images/youtube.png', width: 100),
          Customtext(
            title: 'Youtube',
            isdescraption: true,
            style: TextStyle(
              color: Colors.white,
              fontSize: 29,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 5),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoTextField(
                onTap: ontap,
                placeholder: 'Search',
                placeholderStyle: TextStyle(color: Colors.black54),
                focusNode: focusNode,
                padding: EdgeInsetsGeometry.all(10),
                prefix: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(CupertinoIcons.search),
                ),
                suffix: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: istyping ? SizedBox.shrink() : Icon(Icons.close),
                ),
                controller: controller,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(),
                  color: Colors.white,
                ),
                onSubmitted: onsubmitted,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
