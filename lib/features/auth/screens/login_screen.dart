import 'package:book_store/features/auth/cubit/auth_cubit.dart';
import 'package:book_store/features/auth/screens/register_screen.dart';
import 'package:book_store/features/books/presentation/views/get_all_books.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text("Login", style: TextStyle(fontSize: 24)),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Email"),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 10),

                  // Password field
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Password"),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 10),

                  SizedBox(
                    height: 20,
                  ),

                  BlocConsumer<AuthCubit, AuthState>(
                    builder: (context, state) {
                      return SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<AuthCubit>(context).login(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          child: state is LoginLoadingState
                              ? CircularProgressIndicator()
                              : Text("Login", style: TextStyle(fontSize: 24)),
                        ),
                      );
                    },
                    listener: (context, state) {
                      if (state is LoginSuccessState) {
                        Future.delayed(Duration(seconds: 3), () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GetBooksView(),
                            ),
                          );
                        });
                      }
                      if (state is LoginErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('There is Error'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                  ),
                  // TextButton(
                  //   onPressed: () {
                  //     Navigator.pushReplacement(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => RegisterScreen()));
                  //   },
                  //   child: Text(
                  //     "create account",
                  //     style: TextStyle(
                  //       fontSize: 24,
                  //       decoration: TextDecoration.underline,
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
