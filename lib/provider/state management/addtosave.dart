import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AddToSaveProvider with ChangeNotifier {
  List<Map<String, String>> _savedBooks = [];
  List<Map<String, String>> get savedBooks => _savedBooks;

  int _counter = 0;
  int get counter => _counter;

  void _setBookmarks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String booksJson = jsonEncode(_savedBooks);
    prefs.setString('saved_books', booksJson);
    prefs.setInt('counter', _counter);
    
    notifyListeners();
  }

  void _getBookmarks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? booksJson = prefs.getString('saved_books');
    prefs.getInt('counter');
    if (booksJson != null) {
      _savedBooks = List<Map<String, String>>.from(jsonDecode(booksJson));
    }
    notifyListeners();
  }

  void addBook(String image, String title) {
    _counter++;
    // if(_counter != 0 ){

    // }
    _savedBooks.add({'image': image, 'title': title});
    _setBookmarks();
    notifyListeners();
  }

  void removeBook(String title) {
    _counter--;
    _savedBooks.removeWhere((book) => book['title'] == title, );
    _setBookmarks();
    notifyListeners();
  }

  void loadBooks() {
    _getBookmarks();
  }

  void getcounterValue()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getInt('counter');
    notifyListeners();
  }
  int countervalue(){
    getcounterValue();
    return _counter;

  }


  
}
