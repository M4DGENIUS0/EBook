import 'package:ebookstore/widget/Trending_Now/shimmer/shimmer_trendingNow_widget.dart';
import 'package:flutter/material.dart';

class ShimmerTrendHorizontal extends StatefulWidget {
  const ShimmerTrendHorizontal({super.key});

  @override
  State<ShimmerTrendHorizontal> createState() => _ShimmerTrendHorizontalState();
}

class _ShimmerTrendHorizontalState extends State<ShimmerTrendHorizontal> {

  


  @override
  Widget build(BuildContext context) {
    
          return ListView.builder(
            itemCount: 2,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              
              return const ShimmerTrendingNow();
            },
          );
        }}
      
    
  
