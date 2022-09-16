import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../shared/shared.dart';
import 'first_ctl.dart';

class FirstScr extends View<FirstCtl> {
  FirstScr({Key? key}) : super(key: key);

  final Map<Locale, Map<String, String>> data = {
    const Locale('th', 'us'): {
      'menu_1': 'หน้าหลัก',
      'menu_2': 'สิทธิพิเศษ',
    },
    const Locale('en', 'us'): {
      'menu_1': 'home',
      'menu_2': 'special',
    },
  };

  @override
  buildObx(BuildContext context) {
    var locale = Get.locale;
    // var ctl_special = Get.put(SpecialCtl());
    return Scaffold(
      appBar: C.appBar(context, 'xxx'),
      // drawer: C.drawer(context),
      bottomNavigationBar: bottomBar(context),
      // persistentFooterButtons: [
      //   const Text('text'),
      // ],
      body: Column(
        children: [
          Text(ctl.dummy.value),
          const Text('Dummy Text'),
          // ACard(),
        ],
      ),
    );
  }

  BottomNavigationBar bottomBar(BuildContext context) {
    Locale? locale = Get.locale ?? const Locale('th', 'us');
    // print('locale -> $locale');
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed, // Fixed
      selectedItemColor: const Color.fromARGB(255, 38, 38, 38),
      unselectedItemColor: const Color.fromARGB(255, 156, 156, 156),
      currentIndex: ctl.selectedIndex.value,
      onTap: ctl.onItemTapped,
      // ignore: prefer_const_literals_to_create_immutables
      items: [
        BottomNavigationBarItem(
          icon: const FaIcon(FontAwesomeIcons.a),
          label: '${data[locale]?['menu_1']}',
        ),
        const BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.a),
          activeIcon: FaIcon(FontAwesomeIcons.a),
          label: 'สิทธิพิเศษ',
        ),
        const BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.a),
          label: 'ข่าวสาร',
        ),
        const BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.a),
          label: 'การแจ้งเตือน',
        ),
        const BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.a),
          label: 'เกี่ยวกับ',
        ),
      ],
    );
  }
}
