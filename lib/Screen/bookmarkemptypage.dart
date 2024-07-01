import 'package:ebookstore/Utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Bookmarkemptypage extends StatelessWidget {
  const Bookmarkemptypage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        const Image(image: AssetImage(assets.NoBooks)),
         
        Text(
          
          'You\'r Bookshelf is Empty\nGet started by saving books', style: TextStyle(color: const Color.fromRGBO(172, 172, 172, 1), fontFamily: '', fontSize: 22.sp),)
      ],),),
    );
  }
}