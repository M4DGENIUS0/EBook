import 'package:ebookstore/Utils/assets.dart';
import 'package:ebookstore/model/Json_Model.dart';
import 'package:ebookstore/provider/state%20management/addtosave.dart';
import 'package:ebookstore/widget/Trending_Now/horizontal_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final Items books;

  const DetailPage({super.key, required this.books});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {


  
  Future<void> _launchURL(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<AddToSaveProvider>(context);
    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: 50.h,
          width: 200.w,
          child: FloatingActionButton(
            onPressed: () {
              final bookTitle = widget.books.volumeInfo?.title ?? '';
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
        actions:  [
          Padding(
            padding:  const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                
                          Provider.of<AddToSaveProvider>(context, listen: false).addBook(widget.books.volumeInfo!.imageLinks!.thumbnail ?? '', widget.books.volumeInfo?.title ?? 'No Title');
              },
              child: Icon(
                Provider.of<AddToSaveProvider>(context).counter != 0 ? Icons.bookmark : Icons.bookmark_border,
                size: 30,
              ),
            ),
          )
        ],
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
                      widget.books.volumeInfo?.imageLinks?.thumbnail ??
                          'No Image',
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
                    widget.books.volumeInfo?.title ?? 'No Title',
                    style:  TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18.sp),
                  ),
                ),
              ),
               SizedBox(
                height: 5.h,
              ),
              RichText(
                text: TextSpan(children: [
                   TextSpan(text: 'Author: ',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp,color: assets.blue_Color) ,),
                  TextSpan(text:  widget.books.volumeInfo?.authors?.join(', ') ?? 'No Author', 
                  
                  
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp),)
                ]),
               
               
              ),
               SizedBox(
                height: 15.h,
              ),
               Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Description",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.books.volumeInfo?.description ?? 'No Description',
                    style: TextStyle(
                        color: Colors.grey[400],
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp),
                  ),
                ),
              ),
               SizedBox(
                height: 30.h,
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
                    width: double.infinity.w,
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
