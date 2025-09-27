import 'package:equatable/equatable.dart';
import 'items.dart';

class Videos extends Equatable {
  final String? errorId;
  final List<Items>? items;
  const Videos({this.errorId, this.items});
  factory Videos.fromJson(Map<String, dynamic> json) {
    return Videos(
      errorId: json['errorId'] as String,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
  Map<String, dynamic> tojson() => {
    'errorId': errorId,
    'items': items?.map((e) => e.tojson()).toList(),
  };
  @override
  List<Object?> get props => throw UnimplementedError();
}
