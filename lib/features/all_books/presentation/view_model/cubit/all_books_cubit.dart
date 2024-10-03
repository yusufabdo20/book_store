import 'package:bloc/bloc.dart';
import 'package:book_store/features/all_books/data/models/a_book.dart';
import 'package:book_store/features/all_books/data/repo/all_books_repo_imp.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repo/all_books_repo.dart';

part 'all_books_state.dart';

class AllBooksCubit extends Cubit<AllBooksState> {
  AllBooksCubit() : super(AllBooksInitial());
  getAllBooks() async {
    emit(AllBooksLoading()); 
  var result = await AllBooksRepoImp().getAllBooks(); 
  result.fold((l){
emit(AllBooksError(errorMsg: l.errorMsg)); 
  }, (r){
    emit(AllBooksSuccess(books: r)) ; 
  }); 

  }
}
