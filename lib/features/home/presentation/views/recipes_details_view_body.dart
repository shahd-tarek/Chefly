import 'package:chefly/constants.dart';
import 'package:chefly/core/utils/styles.dart';
import 'package:chefly/features/home/data/cubit/details_cubit.dart';
import 'package:chefly/features/home/data/cubit/details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipesDetailsViewBody extends StatefulWidget {
  final String mealId;

  const RecipesDetailsViewBody({super.key, required this.mealId});

  @override
  State<RecipesDetailsViewBody> createState() => _RecipesDetailsViewBodyState();
}

class _RecipesDetailsViewBodyState extends State<RecipesDetailsViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<DetailsCubit>().fetchDetails(widget.mealId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        if (state is DetailsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is DetailsFailure) {
          return Center(child: Text('Error: ${state.errormessage}'));
        } else if (state is DetailsSuccess) {
          final meal = state.meal;
          return Scaffold(
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      meal.strMealThumb,
                      width: double.infinity,
                      height: 450,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    meal.strMeal,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${meal.strCategory} | ${meal.strArea}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Instructions:",
                    style: Styles.textStyle18.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(meal.strInstructions),
                  const SizedBox(height: 16),
                  Text(
                    "Ingredients:",
                    style: Styles.textStyle18.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...List.generate(meal.ingredients.length, (index) {
                    final ingredient = meal.ingredients[index];
                    final measure = meal.measures[index];
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(
                        Icons.check_circle_outline,
                        color: kPrimaryColor,
                      ),
                      title: Text(ingredient),
                      subtitle: Text(measure.isNotEmpty ? measure : ''),
                    );
                  }),
                ],
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
