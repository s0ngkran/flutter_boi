import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../generated_model/branchs_res/branch.dart';
import '../../generated_model/branchs_res/branchs_res.dart';
import '../../generated_model/change_password_res/change_password_res.dart';
import '../../generated_model/create_branch_res/create_branch_res.dart';
import '../../generated_model/create_category_res/create_category_res.dart';
import '../../generated_model/login_res/login_res.dart';
import '../../generated_model/staffs_res/staffs_res.dart';
import '../../languages/About/MemberTiers/generated_text_realestate.dart';
import '../../routes/app_pages.dart';
import '../../shared/services/storage_service.dart';
import '../../shared/utils/common.dart';
import '../../shared/utils/my_controller.dart';

import 'package:dospace/dospace.dart' as dospace;

enum Pages {
  staff,
  table,
  revenue,
  invite,
  branch,
  changePassword,
  profile,
}
enum BranchPage {
  branch,
  category,
}

class HomeCtl extends MyCtl {
  var dummy = ''.obs;
  // var scaffoldKey = GlobalKey<ScaffoldState>();
  // '''
  // profile -> scaffold (key1) -> drawer (key1)
  // home -> scaffold (key2) -> drawer (key2)
  // '''
  var homeScaffoldKey = GlobalKey<ScaffoldState>();
  var isSettingPage = false.obs;
  var selectedIndex = 0.obs;
  var container = 'a'.obs;
  var selectedCategoryId = 'beer'.obs;
  var token = 'empty'.obs;
  var rng = Random();
  var profileData = LoginRes().obs;
  var loading = false.obs;

  /// animation
  var ssscale = 1.0.obs;
  var ssscale2 = true.obs;

  // profile scr
  var data = 'data'.obs;
  var cardPath = ''.obs;
  var idCard = ''.obs;
  var errMessage = ''.obs;

  // staff
  var page = Pages.staff.obs;
  var branchPage = BranchPage.branch.obs;

  // invite
  var branchId = ''.obs;
  var levelId = ''.obs;
  var invite_code = ''.obs;

  // revenue scr
  var numm = 4500.0.obs;

  // animation
  var crossFadeAnimation = GlobalKey();

  // service screens
  var nameBox = ''.obs;
  var songBox = ''.obs;

  // branch
  var keyFormNewBranch = GlobalKey<FormState>();
  var keyFormRenameBranch = GlobalKey<FormState>();
  var branchNameRename = TextEditingController();
  var branchName = TextEditingController();
  var branchs = BranchsRes().obs;
  var branch = Branch().obs;
  var branchContainer = ''.obs;
  var orderNum = 1.obs;

  /// staffs
  var staffs = StaffsRes().obs;

  /// cat
  var orderEditing = false.obs;
  var keyFormRenameCategory = GlobalKey<FormState>();
  var categoryNameRename = TextEditingController();
  var keyFormCreateCategory = GlobalKey<FormState>();
  var categoryName = TextEditingController();

  /// product
  var keyFormProduct = GlobalKey<FormState>();
  var keyFormUpdateProduct = GlobalKey<FormState>();
  var productName = TextEditingController();
  var productDisp1 = TextEditingController();
  var productDisp2 = TextEditingController();
  var productPrice = TextEditingController();
  var productMargin = TextEditingController();
  var productName_ = ''.obs;
  var productDisp1_ = ''.obs;
  var productDisp2_ = ''.obs;
  var productPrice_ = ''.obs;
  var productMargin_ = ''.obs;

  // zone
  var keyFormZone = GlobalKey<FormState>();
  var zoneName = TextEditingController();

  // table
  var keyFormTable = GlobalKey<FormState>();
  var tableName = TextEditingController();

  // changePassword
  var keyFormChangePassword = GlobalKey<FormState>();
  var oldPassword = TextEditingController();
  var newPassword1 = TextEditingController();
  var newPassword2 = TextEditingController();

  // service
  var keyFormService = GlobalKey<FormState>();
  var serviceName = TextEditingController();

  /// temp
  var outputId = ''.obs;

  var picker = ImagePicker().obs;
  var spaces = dospace.Spaces(
    region: "fra1",
    accessKey: "DO00E8X6CD6GM643K8W3",
    secretKey: "xBO6JQykHqxB2czxU8kUs+DaFKfVR8T58PLc0M+XXxI",
  ).obs;
  var imageUrl = ''.obs;
  var imageFile = XFile('').obs;
  // notification data
  var notificationData = [
    {
      "title": "Index Living Mall",
      "level": "รับส่วนลด สาห่กดส่หสก่ดหสาก่ดสากห่ดสาหก่แแแแ",
    },
    {
      "title": "iStore",
      "level": "istore SELF STORAGE ผู้หากสด่สาฟห่",
    },
    {
      "title": "Oui Oui",
      "level": "Sandra Adams - Do you have Paris rec...",
    },
  ].obs;
  Timer? animationTimer;

  @override
  onInit() async {
    super.onInit();
    // readToken();
    // readProfileData();
    // startAnimation();
    await fetchToken();
    await fetchBranchs();
    await autoSelectBranch();
  }

  renameCategory(id) async {
    SSS status = await C.basicAPIHandle(
      this,
      () {
        if (keyFormRenameCategory.currentState!.validate()) {
          return api.updateCategory(id, null, categoryNameRename.text);
        }
      },
    );
    return status;
  }

  deleteCategory(id) async {
    SSS status = await C.basicAPIHandle(
      this,
      () {
        return api.updateCategory(id, false, null);
      },
    );
    return status;
  }

  createCategory(String branchPk) async {
    SSS status = await C.basicAPIHandle(this, () {
      if (keyFormCreateCategory.currentState!.validate()) {
        Future<CreateCategoryRes?> res = api.createCategory(branchPk, categoryName.text);
        return res;
      }
    }, wrapperResult: (CreateCategoryRes? res) {
      String? id = res?.data?.createCategory?.category?.id;
      outputId.value = id ?? '';
    });

    return status;
  }

  categoryOrderUp() {
    print('make cat order up');
  }

  categoryOrderDown() {
    print('make cat order down');
  }

  delService(String id) async {
    SSS status = await C.basicAPIHandle(
      this,
      () {
        return api.updateService(
          id,
          serviceName.text,
          false,
        );
      },
    );
    return status;
  }

  updateService(String id) async {
    SSS status = await C.basicAPIHandle(
      this,
      () {
        if (keyFormService.currentState!.validate()) {
          return api.updateService(
            id,
            serviceName.text,
            true,
          );
        }
      },
    );
    return status;
  }

  createService(String branchId) async {
    SSS status = await C.basicAPIHandle(
      this,
      () {
        if (keyFormService.currentState!.validate()) {
          return api.createService(
            branchId,
            serviceName.text,
            0.0,
          );
        }
      },
    );
    return status;
  }

  delZone(String id) async {
    SSS status = await C.basicAPIHandle(
      this,
      () {
        return api.updateZone(
          id,
          zoneName.text,
          false,
        );
      },
    );
    return status;
  }

  updateZone(String id) async {
    SSS status = await C.basicAPIHandle(
      this,
      () {
        if (keyFormZone.currentState!.validate()) {
          return api.updateZone(
            id,
            zoneName.text,
            true,
          );
        }
      },
    );
    return status;
  }

  delTable(String tableId) async {
    SSS status = await C.basicAPIHandle(
      this,
      () {
        return api.updateTable(
          tableId,
          tableName.text,
          false,
        );
      },
    );
    return status;
  }

  updateTable(String tableId) async {
    SSS status = await C.basicAPIHandle(
      this,
      () {
        if (keyFormTable.currentState!.validate()) {
          return api.updateTable(
            tableId,
            tableName.text,
            true,
          );
        }
      },
    );
    return status;
  }

  createTable(String zoneId) async {
    SSS status = await C.basicAPIHandle(
      this,
      () {
        if (keyFormTable.currentState!.validate()) {
          return api.createTable(
            tableName.text,
            zoneId,
          );
        }
      },
    );
    return status;
  }

  createZone() async {
    SSS status = await C.basicAPIHandle(
      this,
      () {
        if (keyFormZone.currentState!.validate()) {
          String id = branch.value.id!;
          return api.createZone(
            id,
            zoneName.text,
          );
        }
      },
    );
    return status;
  }

  delProduct(String id, {isActive = true}) async {
    SSS status = await C.basicAPIHandle(
      this,
      () {
        return api.updateProduct(
          id,
          productName.text,
          double.parse(productPrice.text),
          double.parse(productMargin.text),
          productDisp1.text,
          productDisp2.text,
          '',
          isActive,
        );
      },
    );
    return status;
  }

  updateProduct(
    String id,
    String imageUrl, {
    isActive = true,
  }) async {
    SSS status = await C.basicAPIHandle(
      this,
      () {
        if (keyFormProduct.currentState!.validate()) {
          return api.updateProduct(
            id,
            productName.text,
            double.parse(productPrice.text),
            double.parse(productMargin.text),
            productDisp1.text,
            productDisp2.text,
            imageUrl,
            isActive,
          );
        }
      },
    );
    return status;
  }

  createProduct(catId, String imageUrl) async {
    SSS status = await C.basicAPIHandle(
      this,
      () {
        if (keyFormProduct.currentState!.validate()) {
          return api.createProduct(
            catId,
            productName.text,
            double.parse(productPrice.text),
            double.parse(productMargin.text),
            productDisp1.text,
            productDisp2.text,
            imageUrl,
          );
        }
      },
    );
    return status;
  }

  fetchBranchs() async {
    BranchsRes? res = await api.fetchBranchs();
    branchs.value = res ?? BranchsRes();
  }

  setBranch(String id) {
    branch.value = (branchs.value.data!.branchs ?? [Branch()]).firstWhere(
      (e) => e.id == id,
    );
  }

  autoSelectBranch() async {
    String? currentBranchId = await SS.currentBranchId(BB.read);
    String firstBranchId = '';
    try {
      firstBranchId = branchs.value.data!.branchs!.firstWhere((e) {
        return e.id == currentBranchId;
      }).id!;
    } catch (e) {
      firstBranchId = branchs.value.data!.branchs!.firstWhere((e) {
        return true;
      }).id!;
    }
    branchContainer.value = firstBranchId;

    // fetch staff
    if (firstBranchId != '') {
      await fetchStaffs(firstBranchId);
    }
  }

  fetchStaffs(String branchId) async {
    StaffsRes? res = await api.fetchStaffs(branchId);
    staffs.value = res ?? StaffsRes();
  }

  setFirstCategoryId() {
    try {
      selectedCategoryId.value = branch.value.categorySet!
          .firstWhere(
            (e) => e.isActive == true,
          )
          .id!;
    } catch (e) {
      print('error $e');
      selectedCategoryId.value = '';
    }
  }

  createBranch() async {
    print('create branch');
    loading.value = true;
    SSS status;
    if (keyFormNewBranch.currentState!.validate()) {
      CreateBranchRes? res = await api.createBranch(branchName.text);
      if (res == null) {
        status = SSS.apiNull;
      } else {
        if (res.data != null) {
          status = SSS.success;
          fetchBranchs();
          branchName.text = '';
        } else {
          status = SSS.hasError;
        }
      }
    } else {
      status = SSS.cannotReadKey;
    }
    loading.value = false;
    return status;
  }

  deleteBranch(String id) async {
    if (kDebugMode) {
      print('del branch');
    }
    SSS status = await C.basicAPIHandle(
      this,
      () {
        return api.updateBranch(id, false, null);
      },
    );
    if (status == SSS.success) {
      fetchBranchs();
    }
    return status;
  }

  renameBranch(String id) async {
    if (kDebugMode) {
      print('rename this branch');
    }
    SSS status = await C.basicAPIHandle(
      this,
      () {
        if (keyFormRenameBranch.currentState!.validate()) {
          return api.updateBranch(id, null, branchNameRename.text);
        }
      },
    );
    if (status == SSS.success) {
      fetchBranchs();
      branchName.text = '';
    }
    return status;
  }

  fetchToken() async {
    var res = await SS.token(BB.read);
    token.value = res;
    print('{"Authorization": "JWT ${token.value}"}');
  }

  startAnimation() {
    animationTimer = Timer.periodic(const Duration(milliseconds: 400), (t) {
      if (ssscale2.value) {
        ssscale.value = 0.98;
      } else {
        ssscale.value = 1.2;
      }
      ssscale2.value = !ssscale2.value;
    });
  }

  cancelAnimation() {
    animationTimer?.cancel();
  }

  changePassword() async {
    loading.value = true;

    /// check confirm password
    SSS status;
    ChangePasswordRes? res = await api.changePassword(
      oldPassword.text,
      newPassword1.text,
      newPassword2.text,
    );
    if (res == null) {
      status = SSS.apiNull;
    } else if (res.data?.passwordChange?.success == false) {
      status = SSS.notSuccess;
    } else {
      // update token
      String? token = res.data?.passwordChange?.token;
      String? refreshToken = res.data?.passwordChange?.refreshToken;
      await SS.token(BB.write, token: token);
      await SS.refreshToken(BB.write, refreshToken: refreshToken);

      status = SSS.success;
    }
    print('error ${res?.data?.passwordChange?.errors?.toJson()}');

    /// clear inputs
    oldPassword.text = '';
    newPassword1.text = '';
    newPassword2.text = '';

    /// return
    loading.value = false;
    return status;
  }

  autoFillChangePassword() {
    oldPassword.text = 'adminadmin123';
    newPassword1.text = 'superpasswordsuperpassword';
    newPassword2.text = newPassword1.text;
  }

  readToken() async {
    token.value = await SS.token(BB.read);
  }

  updateProfile() async {
    profileData.value = await SS.profile(BB.read);
  }

  String findRoute(String str) {
    List routes = [
      Routes.indexLivingMall,
      Routes.istore,
      Routes.hafele,
      Routes.euroCreations,
      Routes.stiebelEltron,
      Routes.modernForm,
      // food
      Routes.restaurant64,
      Routes.marieGuimar,
      Routes.rosemary,
    ];
    String strLower = str.toLowerCase();
    String firstThreeChar = strLower[0] + strLower[1] + strLower[2];
    String searchStr = '/$firstThreeChar';
    String? route = routes.firstWhere((element) => element.contains(searchStr), orElse: () => null);

    /// manage not found
    route = route ?? Routes.istore;
    return route;
  }

  String getLang() {
    var lang = Get.locale;
    if (lang == const Locale('th', 'us')) {
      return 'ไทย';
    } else if (lang == const Locale('en', 'us')) {
      return 'English';
    } else {
      return 'Empty';
    }
  }

  setContainer(text) {
    container.value = text;
  }

  showToken() async {
    var text = await SS.token(BB.read);
    token.value = text ?? 'empty x';
  }

  Future<XFile?>? pickImage() async {
    loading.value = true;
    XFile? file;
    try {
      if (kDebugMode) {
        print('---file');
      }
      file = await picker.value.pickImage(
        source: ImageSource.gallery,
        maxWidth: 640,
        maxHeight: 640,
        imageQuality: 70,
      );
      if (kDebugMode) {
        print('---file done');
      }

      // await spaces.close();
    } catch (e) {
      if (kDebugMode) {
        print('error pick $e');
      }
      file = null;
    }
    loading.value = false;
    imageFile.value = file ?? XFile('');
    return file;
  }

  Future<String?>? uploadImage(XFile file) async {
    String? uploadedFileUrl;
    try {
      if (kDebugMode) {
        print('---dospcae');
      }

      String projectName = "qr-drink-th";
      String region = "fra1";
      String folderName = "uploaded";
      String fileName = file.path.split('/').last;

      String? etag = await spaces.value.bucket(projectName).uploadFile(
            folderName + '/' + fileName,
            file,
            'image/jpeg',
            // 'image/jpeg',
            dospace.Permissions.public,
          );
      uploadedFileUrl = "https://" + projectName + "." + region + ".digitaloceanspaces.com/" + folderName + "/" + fileName;
    } catch (e) {
      print('error upload image $e');
      uploadedFileUrl = null;
    }
    return uploadedFileUrl;
  }
}
