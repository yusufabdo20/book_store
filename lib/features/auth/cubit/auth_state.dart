part of 'auth_cubit.dart';

abstract class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginSuccessState extends AuthState {}

final class LoginErrorState extends AuthState {}

final class LoginLoadingState extends AuthState {}

final class RegisterSuccessState extends AuthState {}

final class RegisterErrorState extends AuthState {}

final class RegisterLoadingState extends AuthState {}
