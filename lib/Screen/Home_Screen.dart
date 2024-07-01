import 'package:ebookstore/Screen/Bookmark.dart';
import 'package:ebookstore/Screen/SearchScreen.dart';
import 'package:ebookstore/Screen/bookmarkemptypage.dart';
import 'package:ebookstore/Screen/categories_Screen/Categories_Screen.dart';
import 'package:ebookstore/Utils/assets.dart';
import 'package:ebookstore/provider/state%20management/addtosave.dart';
import 'package:ebookstore/widget/Trending_Now/see_more_gridview/See_More.dart';
import 'package:ebookstore/widget/banner_Image.dart';
import 'package:ebookstore/widget/Trending_Now/horizontal_book.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CarouselController carouselController = CarouselController();
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 40.h,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Provider.of<AddToSaveProvider>(context)
                                            .counter >
                                        0
                                    ? BookMark()
                                    : const Bookmarkemptypage(),
                          ));
                    },
                    child: Consumer<AddToSaveProvider>(
                      builder: (_, value, Widget? child) {
                        return Badge(
                          label: Text(value.countervalue().toString()),
                          child: Hero(
                            tag: 'saveimg',
                            child: Icon(
                              Provider.of<AddToSaveProvider>(context).counter >
                                      0
                                  ? Icons.bookmark
                                  : Icons.bookmark_outline_rounded,
                              color: assets.blue_Color,
                              size: 28,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Hero(
                    tag: 'search',
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SearchScreen(),
                            ));
                      },
                      icon: const Icon(
                        Icons.search_rounded,
                      ),
                      iconSize: 28,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Align(
              alignment: Alignment.topLeft,
              widthFactor: 3.2.w,
              child: Text(
                "Discover New!",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: assets.blue_Color,
                    fontFamily: "Poppins",
                    fontSize: 18.sp),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: CarouselSlider(
                  items: const [
                    BannerImage(
                      imageURL: assets.banner,
                    ),
                    BannerImage(
                      imageURL: assets.banner_2,
                    ),
                  ],
                  options: CarouselOptions(autoPlay: true, viewportFraction: 1),
                )),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Trending Now",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: assets.blue_Color,
                        // fontFamily: "Poppins",
                        fontSize: 18.sp),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const See_More(),
                            ));
                      },
                      child: Text(
                        "See more",
                        style: TextStyle(
                            color: assets.green_color,
                            fontFamily: "Poppins",
                            fontSize: 12.sp),
                      )),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                    width: double.infinity.w,
                    height: 200.h,
                    // color: Colors.red,
                    child: const Books(
                      trend: 'computer',
                    )),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Align(
              alignment: Alignment.topLeft,
              widthFactor: 2.9.w,
              child: Text(
                "Featured Books",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            const SizedBox(child: Categories_Screen())
          ],
        ),
      ),
    );
  }
}
