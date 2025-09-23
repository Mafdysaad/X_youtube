import 'package:equatable/equatable.dart';

import 'audios.dart';
import 'videos.dart';

class MusicCredits extends Equatable {
  final Videos? videos;
  final Audios? audios;

  const MusicCredits({this.videos, this.audios});

  factory MusicCredits.fromJson(Map<String, dynamic> json) => MusicCredits(
    videos: json['videos'] == null
        ? null
        : Videos.fromJson(json['videos'] as Map<String, dynamic>),
    audios: json['audios'] == null
        ? null
        : Audios.fromJson(json['audios'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'videos': videos?.toJson(),
    'audios': audios?.toJson(),
  };

  @override
  List<Object?> get props => [videos, audios];
}
