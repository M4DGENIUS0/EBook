import 'package:ebookstore/provider/state%20management/addtosave.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BookMarkCard extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback? tap;
  BookMarkCard(
      {super.key,
      required this.image,
      required this.title,
      this.tap});

  @override
  Widget build(BuildContext context) {
  const placeholderImage = 'https://via.placeholder.com/150';

  final validImageUrl =
      image.isNotEmpty && Uri.tryParse(image)?.hasAbsolutePath == true
          ? image
          : placeholderImage;
    return InkWell(
        onTap: tap,
        child: SizedBox(
          height: 150.h,
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: BorderSide(width: 300.w)),
          
            child: Stack(
              children: [
                Positioned(
                  left: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image(
                      image: NetworkImage(validImageUrl),
                      errorBuilder: (context, error, stackTrace) {
                        return Image.network(
                          placeholderImage,
                          height: 150.h,
                          width: 100.w,
                        );
                      },
                      height: 150.h,
                      width: 100.w,
                    ),
                  ),
                ),
                Positioned(
                  left: 130,
                  top: 40,
                  child: SizedBox(
                    width: 150.w,
                    height: 80.h,
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
                      Positioned(
                        right: 10,
                        top: 50,
                        child: IconButton(onPressed: (){
                           Provider.of<AddToSaveProvider>(context, listen: false).removeBook(title);
                        }, icon: const Icon(Icons.bookmark)))
              ],
            ),
          ),
        ));
  }
}
