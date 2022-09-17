import 'dart:convert';

import 'data.dart';

class CreateBoardRes {
  Data? data;

  CreateBoardRes({this.data});

  factory CreateBoardRes.fromMap(Map<String, Object?> data) {
    return CreateBoardRes(
      data: data['data'] == null
          ? null
          : Data.fromMap(data['data']! as Map<String, Object?>),
    );
  }

  Map<String, Object?> toMap() => {
        'data': data?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CreateBoardRes].
  factory CreateBoardRes.fromJson(String data) {
    return CreateBoardRes.fromMap(json.decode(data) as Map<String, Object?>);
  }

  /// `dart:convert`
  ///
  /// Converts [CreateBoardRes] to a JSON string.
  String toJson() => json.encode(toMap());
}
