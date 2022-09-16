import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../constants/colors.dart';
import '../utils/common.dart';

class ACard2 extends StatelessWidget {
  final String? title;
  final String? discount;
  final String? text;
  final String? imgUrl;
  // final HomeCtl ctl;

  const ACard2({
    Key? key,
    this.title,
    this.discount,
    this.text,
    this.imgUrl,
  }) : super(key: key);
  static const double height = 450;
  // static const double width = height * 0.93;
  static const double width = height * 0.8;
  static const double heightImage = height * 0.55;
  static const double widthTitle = width * 0.55;
  static const double radius = 20;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 235, 238, 239),
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Container(
                width: width,
                height: heightImage,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 207, 206, 204),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(radius),
                    topRight: Radius.circular(radius),
                  ),
                ),
                child: Stack(
                  children: [
                    // Center(
                    //   child: CachedNetworkImage(
                    //     progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
                    //     errorWidget: (context, url, error) => const Icon(Icons.error),
                    //   ),
                    // ),
                    Image.asset(
                      imgUrl ?? "http://via.placeholder.com/350x200",
                      width: width,
                    ),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Text(
                        discount ?? '',
                        style: const TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: C.m, left: C.p),
              child: Text(
                ' ' + (title ?? 'Title'),
                style: TextStyle(
                  color: CC.blue,
                  fontSize: 16,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  child: Text(
                    text ??
                        'Aute amet magna nostrud id adipisicing. Cillum adipisicing excepteur adipisicing magna laborum esse quis magna sunt deserunt cupidatat. Voluptate dolor magna laborum ea est voluptate reprehenderit aliquip deserunt laborum labore. Commodo consectetur aliqua est consectetur ut excepteur nulla.',
                    // softWrap: true,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
            // Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: radius * 0.7,
                    bottom: 12.0,
                  ),
                  child: InkWell(
                    onTap: () {
                      // var ctl = Get.find<SpecialCtl>();
                      // String route = ctl.findRoute(title ?? 'xxxx');
                      // Get.toNamed(Routes.special + route, arguments: ctl);
                    },
                    child: const Text('อ่านต่อ'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ACard extends StatelessWidget {
  final String? title;
  final String? text;
  final String? discount;
  final String? url;
  // final HomeCtl ctl;
  final onTap;

  const ACard({
    Key? key,
    this.title,
    this.discount,
    this.text,
    this.url,
    // required this.ctl,
    this.onTap,
  }) : super(key: key);
  static const double height = 420;
  static const double width = height * 0.85;
  static const double heightImage = height * 0.55;
  static const double widthTitle = width * 0.55;
  static const double radius = 20;

  @override
  Widget build(BuildContext context) {
    var _text = {
      const Locale('th', 'us'): {
        'read more': 'อ่านต่อ',
      },
      const Locale('en', 'us'): {
        'read more': 'read more',
      },
    };
    var myText = _text[Get.locale] as Map;
    return Padding(
      padding: const EdgeInsets.all(C.p),
      child: SizedBox(
        child: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 222, 222, 222),
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: width,
                height: heightImage,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 207, 206, 204),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(radius),
                    topRight: Radius.circular(radius),
                  ),
                ),
                child: Stack(
                  children: [
                    // Center(
                    //   child: CachedNetworkImage(
                    //     imageUrl: url ?? "http://via.placeholder.com/350x200",
                    //     progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
                    //     errorWidget: (context, url, error) => const Icon(Icons.error),
                    //   ),
                    // ),
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(radius),
                        topRight: Radius.circular(radius),
                      ),
                      // child: Container(
                      //   color: Colors.black,
                      //   width: width,
                      // )
                      child: Image.asset(
                        url ?? "http://via.placeholder.com/350x200",
                        width: width,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Positioned(
                      bottom: C.s,
                      right: C.s,
                      child: Text(
                        discount ?? '',
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: widthTitle,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(radius * 0.5),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromARGB(255, 175, 123, 43),
                        Color.fromARGB(255, 224, 199, 106),
                        // Color.fromARGB(255, 223, 182, 0),
                      ],
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Text(
                    ' ' + (title ?? 'Title'),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                    ),
                    child: Text(
                      text ??
                          'Aute amet magna nostrud id adipisicing. Cillum adipisicing excepteur adipisicing magna laborum esse quis magna sunt deserunt cupidatat. Voluptate dolor magna laborum ea est voluptate reprehenderit aliquip deserunt laborum labore. Commodo consectetur aliqua est consectetur ut excepteur nulla.',
                      //  'Aute amet magna nostrud id adipisicing. Cillum adipisicing excepteur adipisicing magna laborum esse quis magna sunt deserunt cupidatat. Voluptate dolor magna laborum ea est voluptate reprehenderit aliquip deserunt laborum labore. Commodo consectetur aliqua est consectetur ut excepteur nulla.',
                      // softWrap: true,
                      maxLines: 6,
                      // overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              // Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: radius * 0.7,
                      bottom: 12.0,
                    ),
                    child: InkWell(
                      onTap: onTap,
                      child: Text(myText['read more']),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
