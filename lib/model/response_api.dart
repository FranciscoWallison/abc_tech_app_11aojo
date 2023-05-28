// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ResponseApi {
  int statusCode;
  String message;
  String description;

  ResponseApi({
    required this.statusCode,
    required this.message,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'statusCode': statusCode,
      'message': message,
      'description': description,
    };
  }

  factory ResponseApi.fromMap(Map<String, dynamic> map) {
    return ResponseApi(
      statusCode: map['statusCode'] as int,
      message: map['message'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseApi.fromJson(String source) =>
      ResponseApi.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ResponseApi(id: $statusCode, message: $message, description: $description)';

  @override
  bool operator ==(covariant ResponseApi other) {
    if (identical(this, other)) return true;

    return other.statusCode == statusCode &&
        other.message == message &&
        other.description == description;
  }

  @override
  int get hashCode => statusCode.hashCode ^ message.hashCode ^ description.hashCode;
}
