import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petfitproject/Utility/constants.dart';
import 'package:petfitproject/bloc_cubit/bloccubit_cubit.dart';
import 'package:petfitproject/bloc_cubit/bloccubit_state.dart';
import 'package:petfitproject/commonclass/appstyle.dart';
import 'package:petfitproject/commonclass/colors.dart';
import 'package:petfitproject/commonclass/dime.dart';

class NewsHeaderView extends StatelessWidget {
  const NewsHeaderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.vbackground,
      appBar: AppBar(
        backgroundColor: AppColors.vheader,
        title: Center(
          child: Text(
            HOME.appointhistorty,
            style: TextStyle(
                color: AppColors.vheaderfont,
                fontSize: DimensionValue.fontSize16),
          ),
        ),
      ),
      body: Center(child: BlocBuilder<TodocubitCubit, TodocubitState>(
        builder: (context, state) {
          if (state is TodocubitInitial) {
            context.read<TodocubitCubit>().getData();
            return showLoader();
          } else if (state is TodoLoaded) {
            return ListView.builder(
              itemCount: state.data.rows?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    child: ListTile(
                  leading: CachedNetworkImage(
                    imageUrl: state.data.rows![index].imageHref ?? "",
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  title: Text(
                    state.data.rows![index].title ?? "",
                    style: Styles.headerStyles,
                  ),
                  subtitle: Text(
                    state.data.rows![index].description ?? "",
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
