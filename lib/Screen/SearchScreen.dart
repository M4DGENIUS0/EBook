import 'package:ebookstore/Screen/detail_page.dart';
import 'package:ebookstore/Utils/assets.dart';
import 'package:ebookstore/provider/state%20management/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SearchProvider>(context, listen: false).getBooks('fiction');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SearchProvider>(
        builder: (BuildContext context, value, Widget? child) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             SizedBox(height: 40.h),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_rounded),
                ),
                SizedBox(
                  width: 300.w,
                  child: TextField(
                    onChanged: (v) {
                      value.search(v);
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Hero(
                        tag: 'search',
                        child: Icon(
                          Icons.search_outlined,
                        ),
                      ),
                      hintText: 'Search Books',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: assets.blue_Color),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: value.books.length,
                itemBuilder: (context, index) {
                  final book = value.books[index];
                  return ListTile(
                    onTap: (){
                       Navigator.push(context, PageRouteBuilder(
                    
                    transitionDuration: const Duration(seconds: 5),
                    
                    pageBuilder: (context, animation, secondaryAnimation) =>  DetailPage(books:  book,),));
                    },
                    contentPadding: const EdgeInsets.all(10),
                    title: Text(book.volumeInfo!.title!),
                    leading: ClipRRect(child: Image(
                      fit: BoxFit.cover,
                    height: 110.h,
                    width: 60.w,
                      
                      image: NetworkImage(book.volumeInfo!.imageLinks!.thumbnail ?? 'No Image')),),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
