import 'package:book_store/features/all_books/presentation/view_model/cubit/all_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllBooksScreen extends StatelessWidget {
  const GetAllBooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AllBooksCubit, AllBooksState>(
        builder: (context, state) {
          if (state is AllBooksSuccess) {
            return SafeArea(child: ListView.builder(
             itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Image.network(state.books[index].image ?? ""),
                    title: Text(state.books[index].title ?? "No Title"),
                  ),
                );
              },
            ));
          } else if (state is AllBooksLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AllBooksError) {
            return Center(
              child: Icon(Icons.error),
            );
          }
          else{
            return const SizedBox(); 
          }
        },
      ),
    );
  }
}
