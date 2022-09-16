part of my_common;

enum SSS {
  success,
  notSuccess,
  init,
  error,
  hasError,
  emailError,
  nameError,
  passwordError,
  notVerifiedUser,
  apiNull,
  noData,
  cannotReadKey,
  notSamePassword,
  errWithMessage,
}

enum Pages {
  loading,
  cannotCallServer,
  staff,
  table,
  revenue,
  invite,
  branch,
  changePassword,
  profile,
  openTable,
}

enum BranchPage {
  branch,
  category,
}

enum StaffMode {
  queNormal,
  queZone,
  eachTable,
}

enum UserRole {
  frontStaff,
  backStaff,
  cashier,
  manager,
  chainManager,
  owner,
}

enum StaffStatus {
  working,
  online,
  offline,
}

extension MyStaffStatus on StaffStatus {
  String get str {
    switch (this) {
      case StaffStatus.working:
        return 'กำลังทำงาน';
      case StaffStatus.online:
        return 'เตรียมพร้อม';
      case StaffStatus.offline:
        return 'ไม่พร้อม';
      default:
        return '-';
    }
  }
}

enum TableStatus {
  ready,
  notReady,
  inHouse,
  waiting,
}

extension TableStatusStr on TableStatus {
  String get str {
    switch (this) {
      case TableStatus.ready:
        return 'พร้อม';
      case TableStatus.notReady:
        return 'ไม่พร้อม';
      case TableStatus.inHouse:
        return 'มีลูกค้า';
      case TableStatus.waiting:
        return 'รอเครื่องดื่ม';
      default:
        return '-';
    }
  }
}

enum OrderStatus {
  requesting,
  waitingBack,
  waitingFront,
  delivered,
  cancled,
}

extension OrderStatusStr on OrderStatus {
  String get str {
    switch (this) {
      case OrderStatus.requesting:
        return 'สั่งเครื่องดื่ม';
      case OrderStatus.waitingBack:
        return 'กำลังเตรียมของ';
      case OrderStatus.waitingFront:
        return 'กำลังนำเสิร์ฟ';
      case OrderStatus.delivered:
        return 'ได้รับแล้ว';
      case OrderStatus.cancled:
        return 'ยกเลิก';
      default:
        return '-';
    }
  }

  Color get color {
    switch (this) {
      case OrderStatus.requesting:
        return CC.onWaiting;
      case OrderStatus.waitingBack:
        return CC.onWaiting;
      case OrderStatus.waitingFront:
        return CC.onWaiting;
      case OrderStatus.delivered:
        return CC.onSuccess;
      case OrderStatus.cancled:
        return CC.onError;
      default:
        return CC.onError;
    }
  }
}

enum WorkingStatus {
  offline,
  ready,
  working,
}

enum LevelStaff {
  customer,
  artist,
  frontStaff,
  backStaff,
  cashier,
  manager,
  chainManager,
  owner,
  admin,
  system,
}

extension MyLevelStaff on LevelStaff {
  int get level {
    switch (this) {
      case LevelStaff.customer:
        return 100;
      case LevelStaff.artist:
        return 200;
      case LevelStaff.frontStaff:
        return 410;
      case LevelStaff.backStaff:
        return 420;
      case LevelStaff.cashier:
        return 500;
      case LevelStaff.manager:
        return 600;
      case LevelStaff.chainManager:
        return 700;
      case LevelStaff.owner:
        return 800;
      case LevelStaff.admin:
        return 900;
      case LevelStaff.system:
        return 1000;
      default:
        return 0;
    }
  }

  String get str {
    switch (this) {
      case LevelStaff.customer:
        return 'ผู้ให้บริการ';
      case LevelStaff.artist:
        return 'ศิลปิน';
      case LevelStaff.frontStaff:
        return 'พนักงานหน้าร้าน';
      case LevelStaff.backStaff:
        return 'พนักงานหลังร้าน';
      case LevelStaff.cashier:
        return 'พนักงานเก็บเงิน';
      case LevelStaff.manager:
        return 'ผู้จัดการ';
      case LevelStaff.chainManager:
        return 'ผู้จัดการฝ่าย';
      case LevelStaff.owner:
        return 'เจ้าของร้าน';
      case LevelStaff.admin:
        return 'ผู้ดูแล';
      case LevelStaff.system:
        return 'ระบบ';
      default:
        return '-';
    }
  }
}

enum VisibleMode { show, grey, hide }
