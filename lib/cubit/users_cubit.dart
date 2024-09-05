import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'users_cubit_state.dart';

class UsersCubit extends Cubit<UsersCubitState> {
  UsersCubit() : super(UsersCubitInitial());

  void getUsers() async {
    emit(UsersCubitLoading());
    final Dio _dio = Dio();
    try {
      final res = await _dio.get("https://jsonplaceholder.typicode.com/users");
      if (res.statusCode == 200) {
        emit(UsersCubitSuccess(users: res.data));
      } else {
        emit(UsersCubitFailure());
      }
    } catch (e) {
      emit(UsersCubitFailure());
    }
  }
}
