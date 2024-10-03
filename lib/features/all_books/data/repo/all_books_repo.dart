import 'package:book_store/core/errors/error.dart';
import 'package:book_store/features/all_books/data/models/a_book.dart';
import 'package:dartz/dartz.dart';

abstract class AllBooksRepo {
  Future<Either<Faliers, List<ABookModel>>> getAllBooks();
}
