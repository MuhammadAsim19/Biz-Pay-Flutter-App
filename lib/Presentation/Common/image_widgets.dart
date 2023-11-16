

import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:flutter/material.dart';


class AssetImageWidget extends StatelessWidget {
  final String url;
  final double? scale;
  final double? width;
  final double? height;
  final Color? color;
  final bool? isCircle;
  final double? radius;
  const AssetImageWidget({
    Key? key,
    required this.url,
    this.scale = 1,
    this.width = 25,
    this.height = 25,
    this.color, this.isCircle, this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    isCircle != null
        ?
    CircleAvatar(
        radius: radius,
        backgroundColor: color,
        backgroundImage:  AssetImage(url)


    ): Image.asset(
      url,
      fit: BoxFit.fill,
      color: color,
      errorBuilder: (context, url, error) {

        return
          isCircle!
              ?
          CircleAvatar(
              radius: radius,

              backgroundImage: const AssetImage(Assets.appLogo)


          ):
          Image.network("https://firebasestorage.googleapis.com/v0/b/hbk-blankets.appspot.com/o/logo.png?alt=media&token=409f2508-9b66-44ac-9c82-ec19a1046cd6"
            ,width: width??110,
            height: height??110,

          );

      },
      width: width! * scale!,
      height: height! * scale!,
    );
  }
}

class CachedImage extends StatelessWidget {
  final String url;
  final double? scale;
  final double? radius;
  final bool? isCircle;
  final double? containerRadius;
  final double? bottomRadius;
  final double? topRadius;
  final BoxFit? fit;
  final double? width;
  final double? height;

  const CachedImage({
    super.key,
    required this.url,
    this.scale = 1,
    this.radius = 50,
    this.isCircle = true,
    this.containerRadius = 0,
    this.topRadius,
    this.bottomRadius,
    this.fit = BoxFit.fill,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(

      imageUrl: url,
      placeholder: (context, url) => isCircle!
          ? Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.primaryColor,
                ),
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
            )
          : Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(containerRadius!),
              ),
              child: const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
      errorWidget: (context, url, error) {

           return
             isCircle!
                 ?
             CircleAvatar(
             radius: radius,backgroundColor: Colors.transparent,
             backgroundImage: const NetworkImage("https://firebasestorage.googleapis.com/v0/b/hbk-blankets.appspot.com/o/logo.png?alt=media&token=409f2508-9b66-44ac-9c82-ec19a1046cd6")


           ):
                Image.network("https://firebasestorage.googleapis.com/v0/b/hbk-blankets.appspot.com/o/logo.png?alt=media&token=409f2508-9b66-44ac-9c82-ec19a1046cd6"
                ,width: width??110,
                  height: height??110,

                );

     },

      imageBuilder: (context, imageProvider) => isCircle!
          ? CircleAvatar(
              radius: radius,
              backgroundImage: imageProvider,
            )
          : ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(topRadius ?? containerRadius!),
                topLeft: Radius.circular(topRadius ?? containerRadius!),
                bottomLeft: Radius.circular(bottomRadius ?? containerRadius!),
                bottomRight: Radius.circular(bottomRadius ?? containerRadius!),
              ),
              child: Image(
                image: imageProvider,
                width: width,
                height: height,
                fit: fit,
              ),
            ),
    );
  }
}
