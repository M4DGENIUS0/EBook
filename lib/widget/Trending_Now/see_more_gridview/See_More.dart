import 'package:ebookstore/Utils/assets.dart';
import 'package:ebookstore/widget/feature_Now/GridView_Items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class See_More extends StatefulWidget {
  const See_More({super.key});

  @override
  State<See_More> createState() => _See_MoreState();
}

class _See_MoreState extends State<See_More> {
  @override
  Widget build(BuildContext context) {
    return  Material(
      child: SingleChildScrollView(child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 80.h,),
          Align(
            alignment: Alignment.topLeft,
            widthFactor: 2.5.w,
            child: Text("Trending Now", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: assets.blue_Color,
                          // fontFamily: "Poppins",
                          fontSize: 18.sp),),
          ),
          const GridViewitems(category: 'Computer',),
        ],
      )),
    );
  }
}