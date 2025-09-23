import 'package:equatable/equatable.dart';

import 'channel.dart';
import 'music_credits.dart';
import 'subtitles.dart';
import 'thumbnail.dart';

class Videomodle extends Equatable {
  final String? errorId;
  final String? type;
  final String? id;
  final String? title;
  final String? description;
  final Channel? channel;
  final int? lengthSeconds;
  final int? viewCount;
  final int? likeCount;
  final String? publishedTime;
  final String? publishedTimeText;
  final bool? isLiveStream;
  final bool? isLiveNow;
  final bool? isRegionRestricted;
  final bool? isUnlisted;
  final bool? isCommentDisabled;
  final String? commentCountText;
  final List<Thumbnail>? thumbnails;
  final MusicCredits? musicCredits;
  final Subtitles? subtitles;

  const Videomodle({
    this.errorId,
    this.type,
    this.id,
    this.title,
    this.description,
    this.channel,
    this.lengthSeconds,
    this.viewCount,
    this.likeCount,
    this.publishedTime,
    this.publishedTimeText,
    this.isLiveStream,
    this.isLiveNow,
    this.isRegionRestricted,
    this.isUnlisted,
    this.isCommentDisabled,
    this.commentCountText,
    this.thumbnails,
    this.musicCredits,
    this.subtitles,
  });

  factory Videomodle.fromJson(Map<String, dynamic> json) => Videomodle(
    errorId: json['errorId'] as String?,
    type: json['type'] as String?,
    id: json['id'] as String?,
    title: json['title'] as String?,
    description: json['description'] as String?,
    channel: json['channel'] == null
        ? null
        : Channel.fromJson(json['channel'] as Map<String, dynamic>),
    lengthSeconds: json['lengthSeconds'] as int?,
    viewCount: json['viewCount'] as int?,
    likeCount: json['likeCount'] as int?,
    publishedTime: json['publishedTime'] as String?,
    publishedTimeText: json['publishedTimeText'] as String?,
    isLiveStream: json['isLiveStream'] as bool?,
    isLiveNow: json['isLiveNow'] as bool?,
    isRegionRestricted: json['isRegionRestricted'] as bool?,
    isUnlisted: json['isUnlisted'] as bool?,
    isCommentDisabled: json['isCommentDisabled'] as bool?,
    commentCountText: json['commentCountText'] as String?,
    thumbnails: (json['thumbnails'] as List<dynamic>?)
        ?.map((e) => Thumbnail.fromJson(e as Map<String, dynamic>))
        .toList(),
    musicCredits: json['musicCredits'] == null
        ? null
        : MusicCredits.fromJson(json['musicCredits'] as Map<String, dynamic>),
    subtitles: json['subtitles'] == null
        ? null
        : Subtitles.fromJson(json['subtitles'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'errorId': errorId,
    'type': type,
    'id': id,
    'title': title,
    'description': description,
    'channel': channel?.toJson(),
    'lengthSeconds': lengthSeconds,
    'viewCount': viewCount,
    'likeCount': likeCount,
    'publishedTime': publishedTime,
    'publishedTimeText': publishedTimeText,
    'isLiveStream': isLiveStream,
    'isLiveNow': isLiveNow,
    'isRegionRestricted': isRegionRestricted,
    'isUnlisted': isUnlisted,
    'isCommentDisabled': isCommentDisabled,
    'commentCountText': commentCountText,
    'thumbnails': thumbnails?.map((e) => e.toJson()).toList(),
    'musicCredits': musicCredits?.toJson(),
    'subtitles': subtitles?.toJson(),
  };

  @override
  List<Object?> get props {
    return [
      errorId,
      type,
      id,
      title,
      description,
      channel,
      lengthSeconds,
      viewCount,
      likeCount,
      publishedTime,
      publishedTimeText,
      isLiveStream,
      isLiveNow,
      isRegionRestricted,
      isUnlisted,
      isCommentDisabled,
      commentCountText,
      thumbnails,
      musicCredits,
      subtitles,
    ];
  }
}
