import 'package:bloc/bloc.dart';
import 'package:book_store/features/books/data/models/book_model.dart';
import 'package:book_store/features/books/data/repo/get_books_repo.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit() : super(BooksInitial());
  GetBooksRepoImp getBooksRepoImp = GetBooksRepoImp();
  List<BookModel> books = [];
  getBooks() async {
    try {
      emit(GetBooksLoading());
      books = await getBooksRepoImp.getBooks();
      emit(GetBooksSuccess(books: books));
    } on DioException catch (e) {
      debugPrint(e.toString());
      emit(GetBooksError());
    } catch (e) {
      debugPrint(e.toString());

      emit(GetBooksError());
    }
  }
}
