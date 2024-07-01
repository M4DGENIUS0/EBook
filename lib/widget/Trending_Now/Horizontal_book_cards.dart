import 'package:ebookstore/Utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Card_book extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final VoidCallback tap;
  const Card_book(
      {super.key,
      required this.image,
      required this.title,
      required this.description,
      required this.tap});

  @override
  Widget build(BuildContext context) {
    const placeholderImage = 'https://via.placeholder.com/150';
    final validImageUrl = image.isNotEmpty && Uri.tryParse(image)?.hasAbsolutePath == true
        ? image
        : placeholderImage;

    return InkWell(
      onTap: tap,
      child: Card(
        borderOnForeground: true,
        elevation: 5,
        shadowColor: Colors.grey[300],
        color: Colors.white,
        margin: const EdgeInsets.all(10),
        child: SizedBox(
          width: 290.w,
          child: Stack(
            children: [
              Positioned(
                top: 10,
                left: 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: Image(
                    image: NetworkImage(validImageUrl),
                    fit: BoxFit.cover,
                    height: 150.h,
                    width: 100.w,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.network(placeholderImage, height: 150.h, width: 100.w,);
                    },
                  ),
                ),
              ),
              Positioned(
                  top: 20,
                  left: 120,
                  child: SizedBox(
                    height: 100.h,
                    width: 120.w,
                    child: Text(title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                        )),
                  )),
              Positioned(
                top: 65,
                left: 120,
                child: SizedBox(
                  width: 120.w,
                  height: 100.h,
                  child: Text(
                    description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(color: Colors.grey[600], fontSize: 11.sp),
                  ),
                ),
              ),
              Positioned(
                top: 120,
                left: 150,
                width: 90.w,
                height: 30.h,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: assets.blue_Color,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {},
                    child: Text(
                      "Explore",
                      style: TextStyle(color: Colors.white, fontSize: 9.sp),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
