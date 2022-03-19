import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petfitproject/bloc_cubit/bloccubit_cubit.dart';
import 'package:petfitproject/bloc_cubit/blocrepositoryImpl.dart';
import 'package:petfitproject/bloc_cubit/newsheaderview.dart';

class TodaysNews extends StatelessWidget {
  const TodaysNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Todays News",
      home: BlocProvider(
        create: (context) => TodocubitCubit(TodoRepositoryImpl()),
        child: const NewsHeaderView(),
      ),
    );
  }
}
