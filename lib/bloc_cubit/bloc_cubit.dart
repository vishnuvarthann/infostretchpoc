// igno'package:continental_poc/bloc_state.dart'

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petfitproject/bloc_cubit/bloc_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());
}
