import 'package:equatable/equatable.dart';

import 'channel.dart';
import 'thumbnail.dart';

class Videosmodle extends Equatable {
  final String? type;
  final String? id;
  final String? title;
  final String? description;
  final Channel? channel;
  final bool? isLiveNow;
  final String? lengthText;
  final String? viewCountText;
  final String? publishedTimeText;
  final List<Thumbnail>? thumbnails;

  const Videosmodle({
    this.type,
    this.id,
    this.title,
    this.description,
    this.channel,
    this.isLiveNow,
    this.lengthText,
    this.viewCountText,
    this.publishedTimeText,
    this.thumbnails,
  });

  factory Videosmodle.fromJson(Map<String, dynamic> json) => Videosmodle(
    type: json['type'] as String?,
    id: json['id'] as String?,
    title: json['title'] as String?,
    description: json['description'] as String?,
    channel: json['channel'] == null
        ? null
        : Channel.fromJson(json['channel'] as Map<String, dynamic>),
    isLiveNow: json['isLiveNow'] as bool?,
    lengthText: json['lengthText'] as String?,
    viewCountText: json['viewCountText'] as String?,
    publishedTimeText: json['publishedTimeText'] as String?,
    thumbnails: (json['thumbnails'] as List<dynamic>?)
        ?.map((e) => Thumbnail.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'type': type,
    'id': id,
    'title': title,
    'description': description,
    'channel': channel?.toJson(),
    'isLiveNow': isLiveNow,
    'lengthText': lengthText,
    'viewCountText': viewCountText,
    'publishedTimeText': publishedTimeText,
    'thumbnails': thumbnails?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props {
    return [
      type,
      id,
      title,
      description,
      channel,
      isLiveNow,
      lengthText,
      viewCountText,
      publishedTimeText,
      thumbnails,
    ];
  }
}
