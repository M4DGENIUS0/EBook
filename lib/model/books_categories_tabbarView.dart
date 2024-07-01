// ignore: file_names
import 'package:flutter/material.dart';

@immutable
class BooksCategory {
  final String title;
  

  const BooksCategory({
    required this.title,
   
  });

  factory BooksCategory.fromJson(Map<String, dynamic> json) {
    return BooksCategory(
      title: json['title'],
      
    );
  }
}

const bookCategories = [
  BooksCategory(title: 'Flutter'),
  BooksCategory(title: 'API') ,
  BooksCategory(title: 'C++/C'),
  BooksCategory(title: 'Swift'),
  BooksCategory(title: 'Rust'),
  BooksCategory(title: 'C#') ,

  
];