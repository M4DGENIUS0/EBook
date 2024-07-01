import 'package:ebookstore/Screen/detail_page.dart';
import 'package:ebookstore/model/Json_Model.dart';
import 'package:ebookstore/provider/services/config_API.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:ebookstore/widget/feature_Now/gridviewBooks_Cards.dart';
import 'package:ebookstore/widget/feature_Now/shimmer/Shimmer_Feature_Grid.dart';
import 'package:flutter/material.dart';

class GridViewitems extends StatefulWidget {
  const GridViewitems({super.key, required this.category});
  final String category;
  @override
  State<GridViewitems> createState() => _GridViewitemsState();
}

class _GridViewitemsState extends State<GridViewitems> {
  late Future<List<Items>> futureBooks;
  final bool reset = false;
  @override
  void initState() {
    futureBooks = Service_API().getBooks(widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Items>>(
      future: futureBooks,
      builder: (BuildContext context, AsyncSnapshot<List<Items>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const FeatureShimmerGrid();
        } else if (snapshot.connectionState == ConnectionState.none) {
          // Has Error like Internet
          return Builder(
            builder: (context) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                MotionToast.error(
                    animationDuration: const Duration(seconds: 1),
                    animationType: AnimationType.fromLeft,
                    animationCurve: Curves.decelerate,
                    toastDuration: const Duration(seconds: 7),
                    title: const Text(
                      "Network Error",
                      style: TextStyle(color: Colors.white),
                    ),
                    description: const Text(
                      "No Internet, Connect to internet and try again",
                      style: TextStyle(color: Colors.white),
                    )).show(context);
              });
              return const Center(
                child: Text('Error '),
              );
            },
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          // Server has no book or data
          return Builder(
            builder: (context) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                MotionToast.warning(
                        animationDuration: const Duration(seconds: 1),
                        animationType: AnimationType.fromLeft,
                        toastDuration: const Duration(seconds: 7),
                        title: const Text("Server Error"),
                        description: const Text(
                            "Server is Busy rightnow, Try again later"))
                    .show(context);
              });
              return const Center(
                child: Text('Server Busy'),
              );
            },
          );
        } else {
          List<Items> books = snapshot.data!;
          return GridView.builder(
            itemCount: books.length ,
            shrinkWrap: true,
            padding: const EdgeInsets.only(bottom: 30, top: 40),
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.width.w /
                  (MediaQuery.of(context).size.height.h / 4),
              mainAxisExtent: 256,
            ),
            itemBuilder: (context, index) {
              final book = books[index];
           


              return GridBookCard(
                image: book.volumeInfo?.imageLinks?.thumbnail ?? 'No Image',
                title: book.volumeInfo?.title ?? 'No Title',
                tap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(seconds: 5),
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            DetailPage(
                          books: book,
                        ),
                      ));
                },
                index: index,
                
              );
            });
              
          
        }
      },
    );
  }
}
