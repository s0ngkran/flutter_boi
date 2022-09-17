import 'dart:convert';

class UpdateBoardReq {
  int? id;
  bool? isActive;
  bool? isChecked;

  UpdateBoardReq({this.id, this.isActive, this.isChecked});

  factory UpdateBoardReq.fromMap(Map<String, Object?> data) {
    return UpdateBoardReq(
      id: data['id'] as int?,
      isActive: data['is_active'] as bool?,
      isChecked: data['is_checked'] as bool?,
    );
  }

  Map<String, Object?> toMap() => {
        'id': id,
        'is_active': isActive,
        'is_checked': isChecked,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UpdateBoardReq].
  factory UpdateBoardReq.fromJson(String data) {
    return UpdateBoardReq.fromMap(json.decode(data) as Map<String, Object?>);
  }

  /// `dart:convert`
  ///
  /// Converts [UpdateBoardReq] to a JSON string.
  String toJson() => json.encode(toMap());
}
