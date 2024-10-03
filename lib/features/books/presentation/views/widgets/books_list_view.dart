import 'package:book_store/features/books/data/models/book_model.dart';
import 'package:book_store/features/books/presentation/view_model/cubit/books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksCubit, BooksState>(
      builder: (context, state) {
        if (state is GetBooksLoading) {
          return const SliverToBoxAdapter(
            child: Center(
              child: LinearProgressIndicator(),
            ),
          );
        } else if (state is GetBooksSuccess) {
          List<BookModel> books = state.books;
          return SliverList.builder(
            itemCount: books.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(books[index].title ?? "NONE"),
              );
            },
          );
        } else if (state is GetBooksError) {
          return const SliverToBoxAdapter(
            child: Center(
              child: Icon(Icons.error),
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(
              child: Text('Init State'),
            ),
          );
        }
      },
    );
  }
}
