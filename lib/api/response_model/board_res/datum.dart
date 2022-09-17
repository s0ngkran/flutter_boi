import 'dart:convert';

class Datum {
  int? id;
  String? title;
  String? description;
  int? sortingIndex;
  bool? isActive;
  bool? isChecked;

  Datum({
    this.id,
    this.title,
    this.sortingIndex,
    this.isActive,
    this.isChecked,
    this.description,
  });

  factory Datum.fromMap(Map<String, Object?> data) => Datum(
        id: data['id'] as int?,
        title: data['title'] as String?,
        description: data['description'] as String?,
        sortingIndex: data['sorting_index'] as int?,
        isActive: data['is_active'] as bool?,
        isChecked: data['is_checked'] as bool?,
      );

  Map<String, Object?> toMap() => {
        'id': id,
        'title': title,
        'description': description,
        'sorting_index': sortingIndex,
        'is_active': isActive,
        'is_checked': isChecked,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
  factory Datum.fromJson(String data) {
    return Datum.fromMap(json.decode(data) as Map<String, Object?>);
  }

  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
  String toJson() => json.encode(toMap());
}
