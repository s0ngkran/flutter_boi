import 'dart:convert';

class CreateBoard {
  String? title;
  String? description;

  CreateBoard({this.title, this.description});

  factory CreateBoard.fromMap(Map<String, Object?> data) => CreateBoard(
        title: data['title'] as String?,
        description: data['description'] as String?,
      );

  Map<String, Object?> toMap() => {
        'title': title,
        'description': description,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CreateBoard].
  factory CreateBoard.fromJson(String data) {
    return CreateBoard.fromMap(json.decode(data) as Map<String, Object?>);
  }

  /// `dart:convert`
  ///
  /// Converts [CreateBoard] to a JSON string.
  String toJson() => json.encode(toMap());
}
