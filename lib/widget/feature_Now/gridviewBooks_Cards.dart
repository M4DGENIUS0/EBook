import 'package:ebookstore/Utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridBookCard extends StatelessWidget {
  final String image;
  final int index;
  final String title;
  final VoidCallback? tap;
  const GridBookCard(
      {super.key,
      required this.image,
      required this.title,
      this.tap, required this.index});

  @override
  Widget build(BuildContext context) {
    const placeholderImage = 'https://via.placeholder.com/150';
    final validImageUrl = image.isNotEmpty && Uri.tryParse(image)?.hasAbsolutePath == true
        ? image
        : placeholderImage;

    return InkWell(
      onTap: tap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Hero(
                tag: 'netimg$index',
                transitionOnUserGestures: true,
                child: Image(
                  image: NetworkImage(validImageUrl),
                  errorBuilder: (context, error, stackTrace) {
                    return Image.network(placeholderImage,height: 150.h, width: 100.w,);
                  },
                  height: 150.h,
                  width: 100.w,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              
              width: 150.w,

              child: Center(
                child: Text(title,
                    overflow: TextOverflow.fade,
                    maxLines: 2,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: 30.h,
              width: 100.w,
              child: ElevatedButton(
                
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child:  Text("See More",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 9.sp,
                          color: assets.blue_Color))),
            )
          ],
        ),
      ),
    );
  }
}
