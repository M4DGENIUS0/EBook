import 'package:ebookstore/Screen/detail_page.dart';
import 'package:ebookstore/model/Json_Model.dart';
import 'package:ebookstore/provider/services/ApiServiceForCards.dart';
import 'package:ebookstore/widget/Trending_Now/shimmer/Horizontal_TrendShimmer.dart';
import 'package:ebookstore/widget/Trending_Now/Horizontal_book_cards.dart';
import 'package:flutter/material.dart';

class Books extends StatefulWidget {
  final String trend;
  const Books({
    super.key,
    required this.trend,
  });

  @override
  State<Books> createState() => _BooksState();
}

class _BooksState extends State<Books> {
  late Future<List<Items>> futureTrendingBooks;

  @override
  initState() {
    futureTrendingBooks = TrendingServiceAPI().getBooks(widget.trend);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Items>>(
      future: futureTrendingBooks,
      builder: (BuildContext context, AsyncSnapshot<List<Items>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const ShimmerTrendHorizontal();
        } else if (snapshot.connectionState == ConnectionState.none) {
          return const Center(child: Text('Error: No Internet'));
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error: No Internet'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No books found'));
        } else {
          List<Items> books = snapshot.data!;

          return ListView.builder(
            itemCount: books.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final book = books[index];
              return Card_book(
                image:
                    book.volumeInfo?.imageLinks?.thumbnail ?? "Loading Image",
                title: book.volumeInfo?.title ?? "Loading Author",
                description:
                    book.volumeInfo?.description ?? "Loading Description",
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
              );
            },
          );
        }
      },
    );
  }
}
