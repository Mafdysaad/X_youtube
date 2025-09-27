import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;
import 'package:x_youtube/function/featchdata.dart';
import 'package:x_youtube/remote_data/modle/modle.dart';
import 'package:x_youtube/screen/widgets/customavatar.dart';

import 'package:x_youtube/screen/widgets/customtext.dart';

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
  bool isdescraption = false;
  Modle modle = Modle();
  Future<void> getvideo() async {
    String path =
        '/v2/video/details?videoId=${widget.id}&urlAccess=normal&videos=auto&audios=auto';
    var respons = await http.get(
      Uri.parse('${Helper.basul}$path'),
      headers: Helper.headers,
    );
    var data = jsonDecode(respons.body);
    modle = Modle.fromJson(data);
    String? url = modle.videos!.items![0].url;
    setState(() {
      videourl = url!;
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
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          Customtext(
                            title: modle.title!,
                            style: TextStyle(fontSize: 24, color: Colors.white),
                            isdescraption: false,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsGeometry.symmetric(
                                    vertical: 15,
                                  ),
                                  child: RichText(
                                    maxLines: isdescraption ? 40 : 1,
                                    overflow: TextOverflow.ellipsis,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: Helper.instance.formatViews(
                                            ('${modle.viewCount!}'),
                                          ),
                                          style: TextStyle(
                                            color: Colors.white54,
                                          ),
                                        ),
                                        TextSpan(text: " "),
                                        TextSpan(
                                          text: " views",
                                          style: TextStyle(
                                            color: Colors.white54,
                                          ),
                                        ),
                                        TextSpan(text: " "),
                                        TextSpan(
                                          text: modle.publishedTimeText,
                                          style: TextStyle(
                                            color: Colors.white54,
                                          ),
                                        ),
                                        TextSpan(text: " "),
                                        ...Helper.buildTextSpans(
                                          modle.description!,
                                        ),

                                        TextSpan(
                                          text: '...Less',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 16,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              setState(() {
                                                isdescraption = false;
                                              });
                                            },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isdescraption = true;
                                  });
                                },
                                child: isdescraption
                                    ? SizedBox.shrink()
                                    : Text(
                                        'More',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.blue,
                                        ),
                                      ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomAvatar(url: modle.channel!.avatar![0].url!),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Customtext(
                                    title: modle.title!,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    isdescraption: true,
                                  ),
                                  Customtext(
                                    title: modle.channel!.subscribercounttext!,
                                    style: TextStyle(color: Colors.white54),
                                    isdescraption: isdescraption,
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Subscribe',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
