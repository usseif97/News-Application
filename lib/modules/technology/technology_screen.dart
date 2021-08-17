import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class TechnologyScreen extends StatelessWidget {
  const TechnologyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = NewsCubit.get(context).technologyNews;
          return state is AppGetTechnologyLoadingState
              ? Center(child: CircularProgressIndicator())
              : ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      buildArticleItem(list[index], context),
                  separatorBuilder: (context, index) => defaultSeperator(),
                  itemCount: list.length,
                );
        });
  }
}
