// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ui_bill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UiBill _$$_UiBillFromJson(Map<String, dynamic> json) => _$_UiBill(
      id: json['id'] as String?,
      remark: json['remark'] as String?,
      password: json['password'] as String?,
      status: $enumDecodeNullable(_$OrderStatusEnumMap, json['status']),
      createdOn: json['createdOn'] == null
          ? null
          : DateTime.parse(json['createdOn'] as String),
    );

Map<String, dynamic> _$$_UiBillToJson(_$_UiBill instance) => <String, dynamic>{
      'id': instance.id,
      'remark': instance.remark,
      'password': instance.password,
      'status': _$OrderStatusEnumMap[instance.status],
      'createdOn': instance.createdOn?.toIso8601String(),
    };

const _$OrderStatusEnumMap = {
  OrderStatus.requesting: 'requesting',
  OrderStatus.waitingBack: 'waitingBack',
  OrderStatus.waitingFront: 'waitingFront',
  OrderStatus.delivered: 'delivered',
  OrderStatus.cancled: 'cancled',
};
