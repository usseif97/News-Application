import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;

        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: defaultFormField(
                    controller: searchController,
                    type: TextInputType.text,
                    validate: (String value) {
                      if (value.isEmpty) return 'search must not be empty !!';
                      return null;
                    },
                    label: 'Search',
                    prefix: Icons.search,
                    onChange: (value) {
                      NewsCubit.get(context).getSearch(value);
                    },
                    context: context,
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        buildArticleItem(list[index], context),
                    separatorBuilder: (context, index) => defaultSeperator(),
                    itemCount: list.length,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
