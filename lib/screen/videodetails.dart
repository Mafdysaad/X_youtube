import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;
import 'package:x_youtube/function/featchdata.dart';

class Videodetails extends StatefulWidget {
  const Videodetails({super.key, required this.id});
  final String id;
  @override
  State<Videodetails> createState() => _VideodetailsState();
}

class _VideodetailsState extends State<Videodetails> {
  VideoPlayerController? videocontroller;
  String videourl = '';
  bool isloding = true;
  Future<void> getvideo() async {
    String path =
        '/v2/video/details?videoId=${widget.id}&urlAccess=normal&videos=auto&audios=auto';
    var respons = await http.get(
      Uri.parse('${Helper.basul}$path'),
      headers: Helper.header,
    );
    var data = jsonDecode(respons.body) as Map;

    String url = data['videos']['items'][0]['url'];
    setState(() {
      videourl = url;
    });
    videocontroller = VideoPlayerController.networkUrl(Uri.parse(videourl))
      ..initialize().then(
        (_) => setState(() {
          isloding = false;
          videocontroller!.play();
          videocontroller!.setVolume(1.0);
        }),
      );
  }

  togglevideo() {
    if (videocontroller!.value.isPlaying) {
      videocontroller!.pause();
    } else {
      videocontroller!.play();
    }
  }

  @override
  void initState() {
    getvideo();

    super.initState();
  }

  @override
  void dispose() {
    videocontroller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 30),
      body: isloding == true || videocontroller == null
          ? Center(child: CircularProgressIndicator(color: Colors.white))
          : Column(
              children: [
                InkWell(
                  onTap: () => setState(() {
                    togglevideo();
                  }),
                  child: AspectRatio(
                    aspectRatio: videocontroller!.value.aspectRatio,
                    child: VideoPlayer(videocontroller!),
                  ),
                ),
              ],
            ),
    );
  }
}
