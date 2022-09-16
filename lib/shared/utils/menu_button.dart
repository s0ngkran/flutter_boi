import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'common.dart';

class MenuButton extends StatelessWidget {
  final Function() onPressed;
  final String title;
  final Widget? img;
  final Widget? icon;
  final double? width;
  final double? height;
  final bool selected;
  final Color? color;

  MenuButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.img,
    this.icon,
    this.width,
    this.height,
    this.selected = false,
    this.color,
  }) : super(key: key);

  final Color activeColor = CC.aColor;
  final Color inactiveColor = Colors.black87;

  @override
  Widget build(BuildContext context) {
    var colorActive = selected ? activeColor : inactiveColor;
    return SizedBox(
      width: width,
      height: height,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            primary: color ?? CC.grey2,
            onPrimary: Colors.black87,
          ),
          child: Padding(
            padding: const EdgeInsets.all(C.s),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: C.p,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon == null) img! else icon!,
                  const SizedBox(height: C.p),
                  Text(
                    title,
                    // softWrap: true,
                    maxLines: 1,
                    // overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: colorActive,
                      fontSize: C.pm,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
