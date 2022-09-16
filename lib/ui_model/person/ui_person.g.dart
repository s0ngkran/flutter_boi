// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ui_person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UiPerson _$$_UiPersonFromJson(Map<String, dynamic> json) => _$_UiPerson(
      id: json['id'] as String?,
      nickname: json['nickname'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      level: $enumDecodeNullable(_$LevelStaffEnumMap, json['level']),
      branchFk: json['branchFk'] as String?,
      exp: json['exp'] as int?,
      wallet: (json['wallet'] as num?)?.toDouble(),
      tel: json['tel'] as String?,
      address: json['address'] as String?,
      facebook: json['facebook'] as String?,
      line: json['line'] as String?,
      ig: json['ig'] as String?,
      imageUrl: json['imageUrl'] as String?,
      lastLogin: json['lastLogin'] == null
          ? null
          : DateTime.parse(json['lastLogin'] as String),
      isFrontStaff: json['isFrontStaff'] as bool?,
      status: $enumDecodeNullable(_$StaffStatusEnumMap, json['status']) ??
          StaffStatus.offline,
    );

Map<String, dynamic> _$$_UiPersonToJson(_$_UiPerson instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'level': _$LevelStaffEnumMap[instance.level],
      'branchFk': instance.branchFk,
      'exp': instance.exp,
      'wallet': instance.wallet,
      'tel': instance.tel,
      'address': instance.address,
      'facebook': instance.facebook,
      'line': instance.line,
      'ig': instance.ig,
      'imageUrl': instance.imageUrl,
      'lastLogin': instance.lastLogin?.toIso8601String(),
      'isFrontStaff': instance.isFrontStaff,
      'status': _$StaffStatusEnumMap[instance.status],
    };

const _$LevelStaffEnumMap = {
  LevelStaff.customer: 'customer',
  LevelStaff.artist: 'artist',
  LevelStaff.frontStaff: 'frontStaff',
  LevelStaff.backStaff: 'backStaff',
  LevelStaff.cashier: 'cashier',
  LevelStaff.manager: 'manager',
  LevelStaff.chainManager: 'chainManager',
  LevelStaff.owner: 'owner',
  LevelStaff.admin: 'admin',
  LevelStaff.system: 'system',
};

const _$StaffStatusEnumMap = {
  StaffStatus.working: 'working',
  StaffStatus.online: 'online',
  StaffStatus.offline: 'offline',
};
