import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridShimmerWidget extends StatelessWidget {
  
  const GridShimmerWidget(
      {super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FadeShimmer(
          radius: 10.r,
          width: 100.w, height: 150.h, highlightColor: const Color.fromARGB(255, 203, 223, 248),
        baseColor: Colors.white),
        
        SizedBox(
          height: 10.h,
        ),
        FadeShimmer(width: 80.w, height: 10.h,
         highlightColor: const Color.fromARGB(255, 203, 223, 248),
        baseColor: Colors.white),
        
        SizedBox(
          height: 10.h,
        ),
        FadeShimmer(width: 90.w, height: 30.h,
         highlightColor: const Color.fromARGB(255, 203, 223, 248),
                baseColor: Colors.white
        )
      ],
    );
  }
}
