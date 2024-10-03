import 'package:book_store/core/api_services/api_service.dart';
import 'package:book_store/features/auth/cubit/auth_cubit.dart';
import 'package:book_store/features/books/presentation/view_model/cubit/books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/all_books/presentation/view_model/cubit/all_books_cubit.dart';
import 'features/all_books/presentation/views/get_all_books_screen.dart';
import 'features/auth/screens/login_screen.dart';
import 'features/books/presentation/views/get_all_books.dart';

void main() async {
  // await ApiService().register(
  //   name: "Yusuf",
  //   email: "yusuf@gmail.com",
  //   password: "123456",
  //   passwordConfirm: "123456",
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit(),
          ),
          BlocProvider(
            create: (context) => AllBooksCubit()..getAllBooks(),
          ),
        ],
        child: MaterialApp(
          home: GetAllBooksScreen(),
        ));
  }
}
/*
1 - Create States *
2 - Create Cubit *
3 - Create Function * 
4 - emit  
5 - Bloc provider 
6- 

 */
