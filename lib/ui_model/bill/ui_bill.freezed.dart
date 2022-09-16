// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ui_bill.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UiBill _$UiBillFromJson(Map<String, dynamic> json) {
  return _UiBill.fromJson(json);
}

/// @nodoc
mixin _$UiBill {
  String? get id =>
      throw _privateConstructorUsedError; //  List<UiTable>? tables,
//  List<UiOrder>? orders,
  String? get remark => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  OrderStatus? get status => throw _privateConstructorUsedError;
  DateTime? get createdOn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UiBillCopyWith<UiBill> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UiBillCopyWith<$Res> {
  factory $UiBillCopyWith(UiBill value, $Res Function(UiBill) then) =
      _$UiBillCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? remark,
      String? password,
      OrderStatus? status,
      DateTime? createdOn});
}

/// @nodoc
class _$UiBillCopyWithImpl<$Res> implements $UiBillCopyWith<$Res> {
  _$UiBillCopyWithImpl(this._value, this._then);

  final UiBill _value;
  // ignore: unused_field
  final $Res Function(UiBill) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? remark = freezed,
    Object? password = freezed,
    Object? status = freezed,
    Object? createdOn = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      remark: remark == freezed
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String?,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus?,
      createdOn: createdOn == freezed
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$$_UiBillCopyWith<$Res> implements $UiBillCopyWith<$Res> {
  factory _$$_UiBillCopyWith(_$_UiBill value, $Res Function(_$_UiBill) then) =
      __$$_UiBillCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? remark,
      String? password,
      OrderStatus? status,
      DateTime? createdOn});
}

/// @nodoc
class __$$_UiBillCopyWithImpl<$Res> extends _$UiBillCopyWithImpl<$Res>
    implements _$$_UiBillCopyWith<$Res> {
  __$$_UiBillCopyWithImpl(_$_UiBill _value, $Res Function(_$_UiBill) _then)
      : super(_value, (v) => _then(v as _$_UiBill));

  @override
  _$_UiBill get _value => super._value as _$_UiBill;

  @override
  $Res call({
    Object? id = freezed,
    Object? remark = freezed,
    Object? password = freezed,
    Object? status = freezed,
    Object? createdOn = freezed,
  }) {
    return _then(_$_UiBill(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      remark: remark == freezed
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String?,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus?,
      createdOn: createdOn == freezed
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UiBill implements _UiBill {
  const _$_UiBill(
      {this.id, this.remark, this.password, this.status, this.createdOn});

  factory _$_UiBill.fromJson(Map<String, dynamic> json) =>
      _$$_UiBillFromJson(json);

  @override
  final String? id;
//  List<UiTable>? tables,
//  List<UiOrder>? orders,
  @override
  final String? remark;
  @override
  final String? password;
  @override
  final OrderStatus? status;
  @override
  final DateTime? createdOn;

  @override
  String toString() {
    return 'UiBill(id: $id, remark: $remark, password: $password, status: $status, createdOn: $createdOn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UiBill &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.remark, remark) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.createdOn, createdOn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(remark),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(createdOn));

  @JsonKey(ignore: true)
  @override
  _$$_UiBillCopyWith<_$_UiBill> get copyWith =>
      __$$_UiBillCopyWithImpl<_$_UiBill>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UiBillToJson(
      this,
    );
  }
}

abstract class _UiBill implements UiBill {
  const factory _UiBill(
      {final String? id,
      final String? remark,
      final String? password,
      final OrderStatus? status,
      final DateTime? createdOn}) = _$_UiBill;

  factory _UiBill.fromJson(Map<String, dynamic> json) = _$_UiBill.fromJson;

  @override
  String? get id;
  @override //  List<UiTable>? tables,
//  List<UiOrder>? orders,
  String? get remark;
  @override
  String? get password;
  @override
  OrderStatus? get status;
  @override
  DateTime? get createdOn;
  @override
  @JsonKey(ignore: true)
  _$$_UiBillCopyWith<_$_UiBill> get copyWith =>
      throw _privateConstructorUsedError;
}
