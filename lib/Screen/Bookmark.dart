import 'package:ebookstore/Screen/bookmark_detail_screen.dart';
import 'package:ebookstore/provider/state%20management/addtosave.dart';
import 'package:ebookstore/widget/AddtobookmarkCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookMark extends StatefulWidget {
  @override
  State<BookMark> createState() => _BookMarkState();
}

class _BookMarkState extends State<BookMark> {
  @override
  void initState() {
    super.initState();
    Provider.of<AddToSaveProvider>(context, listen: false).loadBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<AddToSaveProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.savedBooks.length,
            itemBuilder: (context, index) {
              var book = provider.savedBooks[index];
              return BookMarkCard(
                image: book['image']!,
                title: book['title']!,
                tap: () {
                 Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(seconds: 5),
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            BookMarkdetail(image: book['image']!, title: book['title']!,
                          
                        ),
                      ));
                },
              );
            },
          );
        },
      ),
    );
  }
}
