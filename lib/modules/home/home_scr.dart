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
      const Text('from home scr'),
      for (final Datum board in ctl.boards.value?.data ?? [])
        Card(
          // color: board.isActive ?? false ? CC.primaryLight : CC.primaryLight,
          child: CheckboxListTile(
            title: Text(
              '${board.title}',
            ),
            onChanged: (bool? value) async {
              await ctl.updateBoard(board.id ?? 1, isChecked: value!);
              await ctl.getBoards();
            },
            value: board.isChecked,
          ),
        ),
      C.buttonAdd(
        () {
          dialogCreateBoard();
        },
      ),
      C.button(
        'get',
        () async {
          await ctl.getBoards();
        },
      ),
    ];
  }
}
