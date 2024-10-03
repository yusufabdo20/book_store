import 'package:book_store/core/api_services/api_service.dart';
import 'package:book_store/features/auth/data/models/auth_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  late AuthResponseModel authResponseModel;
  login({
    required String email,
    required String password,
  }) async {
    try {
      emit(LoginLoadingState());
      authResponseModel =
          await ApiService().login(userEmail: email, password: password);
      emit(LoginSuccessState());
    } catch (e) {
      emit(LoginErrorState());
    }
  }
}
