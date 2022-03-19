// ignore: file_names

import 'package:equatable/equatable.dart';
import 'package:petfitproject/pojoClass/CountriesResponse.dart';

abstract class TodocubitState extends Equatable {
  const TodocubitState();

  @override
  List<Object> get props => [];
}

class TodocubitInitial extends TodocubitState {}

class TodoLoaded extends TodocubitState {
  final CountriesResponse data;
  const TodoLoaded({required this.data});
}

class TodoError extends TodocubitState {
  final String message;
  const TodoError({required this.message});
}