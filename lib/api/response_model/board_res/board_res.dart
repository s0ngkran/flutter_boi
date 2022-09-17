import 'dart:convert';

import 'datum.dart';

class BoardRes {
  List<Datum>? data;

  BoardRes({this.data});

  factory BoardRes.fromMap(Map<String, Object?> data) => BoardRes(
        data: (data['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromMap(e as Map<String, Object?>))
            .toList(),
      );

  Map<String, Object?> toMap() => {
        'data': data?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [BoardRes].
  factory BoardRes.fromJson(String data) {
    return BoardRes.fromMap(json.decode(data) as Map<String, Object?>);
  }

  /// `dart:convert`
  ///
  /// Converts [BoardRes] to a JSON string.
  String toJson() => json.encode(toMap());
}
