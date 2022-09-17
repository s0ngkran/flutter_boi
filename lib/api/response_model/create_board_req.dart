import 'dart:convert';

class CreateBoardReq {
  String? title;
  String? description;

  CreateBoardReq({this.title, this.description});

  factory CreateBoardReq.fromMap(Map<String, Object?> data) {
    return CreateBoardReq(
      title: data['title'] as String?,
      description: data['description'] as String?,
    );
  }

  Map<String, Object?> toMap() => {
        'title': title,
        'description': description,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CreateBoardReq].
  factory CreateBoardReq.fromJson(String data) {
    return CreateBoardReq.fromMap(json.decode(data) as Map<String, Object?>);
  }

  /// `dart:convert`
  ///
  /// Converts [CreateBoardReq] to a JSON string.
  String toJson() => json.encode(toMap());
}
