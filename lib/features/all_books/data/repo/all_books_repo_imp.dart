import 'dart:developer';

import 'package:book_store/core/api_services/api_service.dart';
import 'package:book_store/features/all_books/data/models/a_book.dart';
import 'package:book_store/features/all_books/data/repo/all_books_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/error.dart';

class AllBooksRepoImp extends AllBooksRepo {
  @override
  Future<Either<Faliers, List<ABookModel>>> getAllBooks() async {
    try {
      final data = await ApiService().get(
          apiUrl:
              "https://api.codingarabic.online/api/books"); // response. data
      List dataList = data['data'];
      List<ABookModel> books = [];
      ABookModel book;
      for (var item in dataList) {
        book = ABookModel.fromAtef(item);
        books.add(book);
      }
      return Right(books);
    } catch (e) {
      log(e.toString()) ;
      if (e is DioException) {
        return Left(DioErrors.errorFromDio(e));
      } 
    else{
      return Left(DioErrors(errorMsg: e.toString())) ;
    }
    }
  }
}
