import 'package:flutter/material.dart';
import 'package:x_youtube/function/featchdata.dart';

import 'package:x_youtube/remote_data/videosmodle/videosmodle.dart';
import 'package:x_youtube/screen/widgets/customavatar.dart';
import 'package:x_youtube/screen/widgets/customtext.dart';

class Videoitem extends StatelessWidget {
  const Videoitem({super.key, required this.modl});
  final Videosmodle modl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SizedBox(
                width: double.infinity,
                child: ClipRRect(
                  child: Image.network(
                    modl.thumbnails![0].url!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 20,
              child: Container(
                color: Colors.black54,
                child: Text(
                  modl.lengthText!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CustomAvatar(url: modl.channel!.avatar![0].url!),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Customtext(
                        title: modl.title!,
                        isdescraption: true,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,

                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Customtext(
                            title: modl.channel!.name!,
                            isdescraption: false,
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 30),
                          Customtext(
                            title: Helper.instance.formatViews(
                              modl.viewCountText!,
                            ),
                            isdescraption: false,
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 30),
                          Customtext(
                            title: modl.publishedTimeText!,
                            isdescraption: false,
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
