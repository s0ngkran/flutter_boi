import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../api/response_model/board_res/datum.dart';
import '../../shared/constants/colors.dart';
import '../../shared/utils/common.dart';
import 'dialog/create_board_dialog.dart';
import 'template_home_scr.dart';

class HomeScr extends TemplateHomeScr {
  HomeScr({Key? key}) : super('หน้าหลัก', key: key);

  @override
  List<Widget> content(context) {
    // GoogleSignInAccount? user = app.googleUser?.value;
    return [
      // if ((ctl.boards.value?.data ?? []).isEmpty) const Padding(
      //   padding: EdgeInsets.all(32),
      //   child: CircularProgressIndicator.adaptive(),
      // ),
      for (final Datum board in ctl.boards.value?.data ?? [])
        Dismissible(
          key: Key('board id ${board.id}'),
          onDismissed: (dir) async {
            await ctl.updateBoard(board.id ?? 1, isActive: false);
            await ctl.getBoards();
          },
          child: Padding(
            padding:const EdgeInsets.symmetric(horizontal: 8.0,),
            child: Card(
              // color: board.isActive ?? false ? CC.primaryLight : CC.primaryLight,
              child: CheckboxListTile(
                title: C.textP(
                  // ignore: unnecessary_string_interpolations
                  '${board.title ?? 'ไม่มีชื่อ'}',
                ),
                subtitle: C.textPP('${board.description ?? ''}'),
                onChanged: (bool? value) async {
                  await ctl.updateBoard(board.id ?? 1, isChecked: value!);
                  await ctl.getBoards();
                },
                value: board.isChecked,
              ),
            ),
          ),
        ),
      Padding(
            padding:const EdgeInsets.symmetric(horizontal: 8.0,),
        child: Card(
          // color: board.isActive ?? false ? CC.primaryLight : CC.primaryLight,
          child: ListTile(
            title: C.textP(
              'เพิ่ม...',
              textColor: CC.grey6,
            ),
                subtitle: C.textPP(''),
            onTap: () {
              dialogCreateBoard();
            },
          ),
        ),
      ),
      // C.buttonAdd(
      //   () {
      //     dialogCreateBoard();
      //   },
      // ),
      // C.button(
      //   'get',
      //   () async {
      //     await ctl.getBoards();
      //   },
      // ),
    ];
  }
}
