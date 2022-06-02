import 'package:flutter/material.dart';
import 'package:sliverchallenge/api/api.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class BookModel extends ChangeNotifier {
  List<Book> books = [];

  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/flutter_books.json');
  }

  void loadBooks() {
    loadAsset().then((jsonString) {
      final jsonResponse = json.decode(jsonString);
      for (var book_ in jsonResponse) {
        books.add(Book.fromJson(book_));
      }

      notifyListeners();
    });
  }
}
