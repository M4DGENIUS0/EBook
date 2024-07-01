import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShimmerTrendingNow extends StatefulWidget {

  const ShimmerTrendingNow(
      {super.key,
      });

  @override
  State<ShimmerTrendingNow> createState() => _ShimmerTrendingNowState();
}

class _ShimmerTrendingNowState extends State<ShimmerTrendingNow> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.grey[300],
      color: Colors.white,
      margin: const EdgeInsets.all(10),
      child: SizedBox(
        width: 250.w,
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 10,
              child: FadeShimmer(height: 150.h,
                width: 100.w,
                radius: 10.r,
                 highlightColor: const Color.fromARGB(255, 203, 223, 248),
                baseColor: Colors.white
                ),
            ),
            Positioned(
                top: 20,
                left: 120,
                child: FadeShimmer(
                  radius: 10.r,
                  height: 10.h, width: 120.w,
                 highlightColor: const Color.fromARGB(255, 203, 223, 248),
                baseColor: Colors.white,
                
                )),
            Positioned(
              top: 65,
              left: 120,
              child: FadeShimmer(height: 10.h, width: 120.w,
               highlightColor: const Color.fromARGB(255, 203, 223, 248),
                baseColor: Colors.white,radius: 10,
              ),
            ),
            Positioned(
              top: 140,
              left: 150,
              
              child: FadeShimmer(width: 80.w,height: 20.h,

              radius: 10.r,
               highlightColor: const Color.fromARGB(255, 203, 223, 248),
                baseColor: Colors.white
              ),
            )
          ],
        ),
      ),
    );
  }
}
