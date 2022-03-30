import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:petfitproject/bloc_cubit/bloccubit_cubit.dart';
import 'package:petfitproject/bloc_cubit/bloccubit_state.dart';
import 'package:petfitproject/commonclass/appstyle.dart';
import 'package:petfitproject/commonclass/colors.dart';

class NewsHeaderView extends StatelessWidget {
  NewsHeaderView({Key? key}) : super(key: key);
  final topAppBar = AppBar(
    elevation: 0.1,
    backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
    title: const Text("Live news"),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.vbackground,
      appBar: topAppBar,

      // appBar: AppBar(
      //   // leading: IconButton(
      //   //   icon: const Icon(
      //   //     Icons.arrow_back,
      //   //     color: Colors.white,
      //   //   ),
      //   //   onPressed: () => Navigator.pop(context),
      //   // ),
      //   backgroundColor: AppColors.vheader,
      //   title: Center(
      //     child: Text(
      //       HOME.appointhistorty,
      //       style: Styles.appheader,
      //     ),
      //   ),
      // ),
      body: Center(child: BlocBuilder<TodocubitCubit, TodocubitState>(
        builder: (context, state) {
          if (state is TodocubitInitial) {
            context.read<TodocubitCubit>().getData();
            return showLoader();
          } else if (state is TodoLoaded) {
            return ListView.builder(
              itemCount: state.data.articles?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    child: ListTile(
                  leading: CachedNetworkImage(
                    imageUrl: state.data.articles![index].urlToImage ?? "",
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  title: Text(
                    state.data.articles![index].title ?? "",
                    style: Styles.headerStyles,
                  ),
                  subtitle: Text(
                    state.data.articles![index].description ?? "\n",
                    style: Styles.headerStyles,
                  ),
                ));
              },
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      )),
    );
  }

  Widget showLoader() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
