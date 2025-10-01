import 'package:chefly/core/utils/styles.dart';
import 'package:chefly/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:chefly/features/home/presentation/widgets/custom_search_text_field.dart';
import 'package:chefly/features/home/presentation/widgets/recipes.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Column(
          children: [
            CustomAppBar(),
            SizedBox(height: 8),
            CustomSearchTextField(),
            SizedBox(height: 20),
            Text("Popular Recipes", style: Styles.textStyle20),
            SizedBox(height: 10),
            Recipes(),
          ],
        ),
      ),
    );
  }
}
