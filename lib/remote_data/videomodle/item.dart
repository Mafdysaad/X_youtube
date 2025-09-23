import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final String? url;
  final String? code;
  final String? text;

  const Item({this.url, this.code, this.text});

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    url: json['url'] as String?,
    code: json['code'] as String?,
    text: json['text'] as String?,
  );

  Map<String, dynamic> toJson() => {'url': url, 'code': code, 'text': text};

  @override
  List<Object?> get props => [url, code, text];
}
