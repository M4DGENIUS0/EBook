import 'package:ebookstore/Utils/assets.dart';
import 'package:ebookstore/widget/Trending_Now/horizontal_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class BookMarkdetail extends StatefulWidget {
  final String image;
  final String title;

  const BookMarkdetail({super.key,  required this.image, required this.title});

  @override
  State<BookMarkdetail> createState() => _BookMarkdetailState();
}

class _BookMarkdetailState extends State<BookMarkdetail> {


  
  Future<void> _launchURL(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: 50.h,
          width: 200.w,
          child: FloatingActionButton(
            onPressed: () {
              final bookTitle = widget.title;
              final amazonUrl =
                  'https://www.amazon.com/s?k=${Uri.encodeComponent(bookTitle)}';
              _launchURL(amazonUrl);
            },
            backgroundColor: assets.blue_Color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(153)),
            child:  Text("Explore!",
                style: TextStyle(color: Colors.white, fontSize: 15.sp)),
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(246, 255, 255, 255),
      appBar: AppBar(
        
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: 200.w,
                child: Hero(
                    tag: 'netimg',
                    transitionOnUserGestures: true,
                    child: Image.network(
                      widget.image,
                      fit: BoxFit.contain,
                    )),
              ),
               SizedBox(
                height: 10.h,
              ),
              SizedBox(width: 150.w, child: const Divider()),
              SizedBox(
                width: 300.w,
                height: 70.h,
                child: Center(
                  child: Text(
                    widget.title,
                    style:  TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18.sp),
                  ),
                ),
              ),
              
              
               SizedBox(
                height: 20.h,
              ),
               Align(
                alignment: Alignment.topLeft,
                widthFactor: 2.9.w,
                child: Text(
                  "More Books",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                ),
              ),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    width: double.infinity,
                    height: 200.h,
                    child: const Books(
                      trend: 'Recommendation',
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
