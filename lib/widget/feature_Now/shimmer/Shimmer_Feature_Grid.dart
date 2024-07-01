import 'package:ebookstore/widget/feature_Now/shimmer/Shimmer_FeatureBook_Widgit.dart';
import 'package:flutter/material.dart';

class FeatureShimmerGrid extends StatefulWidget {
  const FeatureShimmerGrid({super.key});

  @override
  State<FeatureShimmerGrid> createState() => _FeatureShimmerGridState();
}

class _FeatureShimmerGridState extends State<FeatureShimmerGrid> {
  

  @override
  Widget build(BuildContext context) {
    
          return GridView.builder(
            itemCount: 4,
            shrinkWrap: true,
            padding: const EdgeInsets.only(bottom: 30, top: 40),
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 4),
              mainAxisExtent: 256,
            ),
            itemBuilder: (context, index) {
             
              return const GridShimmerWidget();
            },
          );
        }
      }
