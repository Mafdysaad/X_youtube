import 'package:equatable/equatable.dart';

class Thumbnail extends Equatable {
  final String? url;
  final int? width;
  final int? height;
  final bool? moving;

  const Thumbnail({this.url, this.width, this.height, this.moving});

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
    url: json['url'] as String?,
    width: json['width'] as int?,
    height: json['height'] as int?,
    moving: json['moving'] as bool?,
  );

  Map<String, dynamic> toJson() => {
    'url': url,
    'width': width,
    'height': height,
    'moving': moving,
  };

  @override
  List<Object?> get props => [url, width, height, moving];
}
