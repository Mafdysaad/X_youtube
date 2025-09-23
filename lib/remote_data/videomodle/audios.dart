import 'package:equatable/equatable.dart';

class Audios extends Equatable {
  final String? errorId;
  final int? expiration;
  final List<dynamic>? items;

  const Audios({this.errorId, this.expiration, this.items});

  factory Audios.fromJson(Map<String, dynamic> json) => Audios(
    errorId: json['errorId'] as String?,
    expiration: json['expiration'] as int?,
    items: json['items'] as List<dynamic>?,
  );

  Map<String, dynamic> toJson() => {
    'errorId': errorId,
    'expiration': expiration,
    'items': items,
  };

  @override
  List<Object?> get props => [errorId, expiration, items];
}
