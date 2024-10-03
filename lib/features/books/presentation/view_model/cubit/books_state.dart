part of 'books_cubit.dart';

sealed class BooksState extends Equatable {
  const BooksState();

  @override
  List<Object> get props => [];
}

final class BooksInitial extends BooksState {}

final class GetBooksSuccess extends BooksState {
  final List<BookModel> books;

  GetBooksSuccess({required this.books});
}

final class GetBooksError extends BooksState {}

final class GetBooksLoading extends BooksState {}
