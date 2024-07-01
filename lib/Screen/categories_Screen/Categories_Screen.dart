import 'package:ebookstore/Utils/assets.dart';
import 'package:ebookstore/model/books_categories_tabbarView.dart';
import 'package:ebookstore/widget/feature_Now/GridView_Items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Categories_Screen extends StatefulWidget {
  const Categories_Screen({super.key});

  @override
  State<Categories_Screen> createState() => _Categories_ScreenState();
}

class _Categories_ScreenState extends State<Categories_Screen> with TickerProviderStateMixin {
  late TabController tabController ;
  
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: bookCategories.length, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    final categoriesName = bookCategories
        .map((bookCategory) => Tab(text: bookCategory.title))
        .toList();
    final categoriesWidgets = bookCategories
        .map((bookCategory) => GridViewitems(category: bookCategory.title))
        .toList();

    return 
       Column(
        children: [
          SizedBox(
            child: TabBar(
              controller: tabController,
              enableFeedback: true,
              tabs: categoriesName,
              physics: const BouncingScrollPhysics(),
              dividerHeight: 0.h,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              
              indicatorColor: assets.blue_Color,
              indicatorWeight: 3,
              labelColor: assets.blue_Color,
            ),
          ),
          SizedBox(
            height:  MediaQuery.of(context).size.height * 5.0.h,
            child: TabBarView(
              controller: tabController,
              children: categoriesWidgets,
            ),
          ),
        ],
      
    );
  }
}
