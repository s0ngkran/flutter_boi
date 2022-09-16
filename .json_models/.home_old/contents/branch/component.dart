import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../../../shared/constants/colors.dart';
import '../../../../shared/utils/common.dart';

class MyIcon extends StatelessWidget {
  final IconData iconData;
  const MyIcon({
    Key? key,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 20,
      bottom: 10,
      child: SizedBox(
        height: 120,
        child: Icon(
          iconData,
          size: 100,
          color: CC.grey1,
        ),
      ),
    );
  }
}

class MyPerson extends StatelessWidget {
  final bool isWorking;
  final String repeatNum;
  final String money;
  final String name;
  final onTap;
  MyPerson({
    Key? key,
    required this.isWorking,
    required this.repeatNum,
    required this.money,
    required this.name,
    required this.onTap,
  }) : super(key: key);
  final double size = 100;
  var activeColor = Colors.yellow;
  var inActiveColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    var filterColor = isWorking ? activeColor : inActiveColor;
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: size,
        height: size,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Stack(
            children: [
              SimpleShadow(
                sigma: 2,
                color: filterColor,
                child: Image.asset('assets/images/component/person_white.png',
                    width: size),
              ),
              Positioned(
                left: 8,
                top: 8,
                child: Text(repeatNum,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Positioned(
                left: 33,
                top: 8,
                child: CircleAvatar(
                  backgroundColor: filterColor,
                  radius: 8,
                ),
              ),
              Positioned(
                right: 16 + 8,
                top: size / 2,
                child: Row(
                  children: [
                    Text('\$ $money',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
              Positioned(
                bottom: 16,
                left: 4,
                child: Text(name,
                    style: TextStyle(
                      fontSize: 16,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BranchButton extends StatelessWidget {
  final bool isActive;
  final String title;
  final onTap;
  final onTapDel;
  BranchButton({
    Key? key,
    required this.isActive,
    required this.title,
    required this.onTap,
    this.onTapDel,
  }) : super(key: key);

  Color aColor = CC.aColor;
  Color iColor = CC.iColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: isActive ? aColor : iColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Center(
                child: C.textH6(
                  title,
                  normal: 8,
                ),
              ),
              if (onTapDel != null) ...[
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: onTapDel,
                  child: Center(
                    child: C.textH6('-'),
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
