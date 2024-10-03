import 'package:book_store/core/api_services/api_service.dart';
import 'package:book_store/features/books/data/models/book_model.dart';
import 'package:flutter/widgets.dart';

class GetBooksRepoImp {
  Future<List<BookModel>> getBooks() async {
    final data = await ApiService().get(
      apiUrl: "https://api.codingarabic.online/api/books",
    );
    List<BookModel> books = [];
    BookModel book;
    for (var item in data['data']) {
      book = BookModel.fromAtef(item);
      debugPrint(book.title.toString());
      books.add(book);
    }
    return books;
  }
}
