import 'package:equatable/equatable.dart';

class Items extends Equatable {
  final String? url;
  final String? quality;
  const Items({this.quality, this.url});

  factory Items.fromJson(Map<String, dynamic> json) {
    return Items(
      url: json['url'] as String?,
      quality: json['quality'] as String?,
    );
  }
  Map<String, dynamic> tojson() => {'url': url, 'quality': quality};
  @override
  List<Object?> get props => throw UnimplementedError();
}
