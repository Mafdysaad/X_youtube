import 'package:equatable/equatable.dart';

class Videos extends Equatable {
  final String? errorId;
  final int? expiration;
  final List<dynamic>? items;

  const Videos({this.errorId, this.expiration, this.items});

  factory Videos.fromJson(Map<String, dynamic> json) => Videos(
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
