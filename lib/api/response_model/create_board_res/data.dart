import 'dart:convert';

class Data {
  int? id;
  String? title;
  dynamic sortingIndex;
  bool? isActive;

  Data({this.id, this.title, this.sortingIndex, this.isActive});

  factory Data.fromMap(Map<String, Object?> data) => Data(
        id: data['id'] as int?,
        title: data['title'] as String?,
        sortingIndex: data['sorting_index'] as dynamic,
        isActive: data['is_active'] as bool?,
      );

  Map<String, Object?> toMap() => {
        'id': id,
        'title': title,
        'sorting_index': sortingIndex,
        'is_active': isActive,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Data].
  factory Data.fromJson(String data) {
    return Data.fromMap(json.decode(data) as Map<String, Object?>);
  }

  /// `dart:convert`
  ///
  /// Converts [Data] to a JSON string.
  String toJson() => json.encode(toMap());
}
