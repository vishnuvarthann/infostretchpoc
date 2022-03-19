import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petfitproject/bloc_cubit/bloccubit_state.dart';
import 'package:petfitproject/bloc_cubit/blocrepositoryImpl.dart';
import 'package:petfitproject/pojoClass/CountriesResponse.dart';

class TodocubitCubit extends Cubit<TodocubitState> {
  final TodoRepository _todoRepository;

  TodocubitCubit(this._todoRepository) : super(TodocubitInitial());

  Future<void> getData() async {
    try {
      CountriesResponse data = await _todoRepository.fetchData();
      emit(TodoLoaded(data: data));
    } on Exception {
      // emit(const TodoError("message: Error(e)");
      emit(const TodoError(
          message: "Could not fetch the list, please try again later!"));
    }
  }
}