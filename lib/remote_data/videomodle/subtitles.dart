import 'package:equatable/equatable.dart';

import 'item.dart';

class Subtitles extends Equatable {
  final String? errorId;
  final int? expiration;
  final List<Item>? items;

  const Subtitles({this.errorId, this.expiration, this.items});

  factory Subtitles.fromJson(Map<String, dynamic> json) => Subtitles(
    errorId: json['errorId'] as String?,
    expiration: json['expiration'] as int?,
    items: (json['items'] as List<dynamic>?)
        ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'errorId': errorId,
    'expiration': expiration,
    'items': items?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [errorId, expiration, items];
}
