import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'my_controller.dart';

class MyBottomBarCtl extends MyCtl {
  var currentIndex = 0.obs;
  var selectedIndex = 0.obs;
  onItemTapped(val) {
    selectedIndex.value = val;
  }

  setCurrentIndex(int val) {
    currentIndex.value = val;
  }
}

class MyBottomBar extends StatelessWidget {
  final int currentIndex;
  MyBottomBar({
    Key? key,
    required this.data,
    required this.context,
    required this.currentIndex,
  }) : super(key: key);

  final Map<Locale, Map<String, String>> data;
  final BuildContext context;
  final ctl = Get.put(MyBottomBarCtl());

  @override
  Widget build(BuildContext context) {
    Locale? locale = Get.locale ?? const Locale('th', 'us');
    // print('locale -> $locale');
    ctl.setCurrentIndex(currentIndex);
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
