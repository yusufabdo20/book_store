import 'package:book_store/features/books/presentation/views/widgets/books_list_view.dart';
import 'package:flutter/material.dart';

import 'widgets/all_books_sliver.dart';

class GetBooksView extends StatelessWidget {
  const GetBooksView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: ,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [AllBooksText(), BooksListView()],
        ),
      ),
    );
  }
}
