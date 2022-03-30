import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petfitproject/bloc_cubit/bloccubit_cubit.dart';
import 'package:petfitproject/bloc_cubit/blocrepositoryImpl.dart';
import 'package:petfitproject/bloc_cubit/newsheaderview.dart';

// ignore: camel_case_types
class bloc_base extends StatelessWidget {
  const bloc_base({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Today news",
      home: BlocProvider(
        create: (context) => TodocubitCubit(TodoRepositoryImpl()),
        child: NewsHeaderView(),
      ),
    );
  }
}
