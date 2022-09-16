import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../utils/common.dart';

class PhotoHero extends StatelessWidget {
  const PhotoHero({
    Key? key,
    required this.urlPhoto,
    this.onTap,
    required this.width,
    required this.tag,
    required this.imageFile,
  }) : super(key: key);

  final String urlPhoto;
  final String imageFile;
  final String tag;
  final VoidCallback? onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    if (imageFile == '') {
      return SizedBox(
        width: width,
        height: width,
        child: Hero(
          tag: tag,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: (urlPhoto != '')
                    ? CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: urlPhoto,
                        placeholder: (context, url) => Center(
                          child: SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              color: CC.primary,
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      )
                    : Image.asset(
                        'assets/images/leo/leo2.png',
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),
        ),
      );
    } else {
      return SizedBox(
        width: width,
        height: width,
        child: Hero(
          tag: tag,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: SizedBox(
                    width: 110,
                    height: 110,
                    child: Image.file(
                      File(
                        imageFile,
                      ),
                      fit: BoxFit.cover,
                    ),
                  )),
            ),
          ),
        ),
      );
    }
  }
}

class MyImage extends StatelessWidget {
  const MyImage({
    Key? key,
    required this.urlPhoto,
    this.onTap,
    required this.width,
    required this.imageFile,
  }) : super(key: key);

  final String urlPhoto;
  final String imageFile;
  final VoidCallback? onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    if (imageFile == '') {
      return SizedBox(
        width: width,
        height: width,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: (urlPhoto != '')
                  ? CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: urlPhoto,
                      placeholder: (context, url) => Center(
                        child: SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            color: CC.primary,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            C.textH1('+'),
                          ],
                        );
                      },
                    )
                  : Image.asset(
                      'assets/images/empty_product.jpg',
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        ),
      );
    } else {
      return SizedBox(
        width: width,
        height: width,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: SizedBox(
                  width: 110,
                  height: 110,
                  child: Image.file(
                    File(
                      imageFile,
                    ),
                    fit: BoxFit.cover,
                  ),
                )),
          ),
        ),
      );
    }
  }
}
