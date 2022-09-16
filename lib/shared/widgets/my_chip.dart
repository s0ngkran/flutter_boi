import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../utils/common.dart';

class MyChip extends StatelessWidget {
  const MyChip({
    Key? key,
    required this.isActive,
    required this.title,
    this.onTap,
  }) : super(key: key);
  final bool isActive;
  final String title;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Chip(
        shadowColor: Colors.black,
        elevation: 3,
        backgroundColor: isActive ? CC.primaryLight : CC.background,
        label: C.textNormal(
          title,
          color: isActive ? CC.onPrimary : CC.onBackground,
        ),
      ),
    );
  }
}
