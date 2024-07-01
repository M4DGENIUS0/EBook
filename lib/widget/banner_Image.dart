import 'package:flutter/material.dart';

class BannerImage extends StatelessWidget {
  final double? width, height;
  final String imageURL;
  final bool applyimageradius;
  final BoxBorder? border;
  final Color? bgcolor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isnetworkingimage;
  final VoidCallback? onPressed;
  const BannerImage({
    super.key,
    this.width,
    this.height,
    required this.imageURL,
    this.applyimageradius = false,
    this.border,
    this.bgcolor,
    this.fit,
    this.padding,
    this.isnetworkingimage = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
            border: border,
            color: bgcolor,
            borderRadius: BorderRadius.circular(15)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image(
            image: isnetworkingimage
                ? NetworkImage(imageURL)
                : AssetImage(imageURL) as ImageProvider,
            fit: fit,
          ),
        ),
      ),
    );
  }
}
