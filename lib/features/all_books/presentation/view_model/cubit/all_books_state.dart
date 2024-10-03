part of 'all_books_cubit.dart';

sealed class AllBooksState extends Equatable {
  const AllBooksState();

  @override
  List<Object> get props => [];
}

final class AllBooksInitial extends AllBooksState {}

final class AllBooksSuccess extends AllBooksState {
  final List<ABookModel> books;

 const AllBooksSuccess({required this.books});
}

final class AllBooksError extends AllBooksState {
  final String errorMsg ;

  AllBooksError({required this.errorMsg}); 
}

final class AllBooksLoading extends AllBooksState {}
