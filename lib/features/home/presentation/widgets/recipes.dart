import 'package:chefly/constants.dart';
import 'package:chefly/features/favourite/data/cubit/favourite_cubit.dart';
import 'package:chefly/features/favourite/data/cubit/favourite_state.dart';
import 'package:chefly/features/home/data/cubit/meals_cubit.dart';
import 'package:chefly/features/home/data/cubit/meals_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Recipes extends StatelessWidget {
  const Recipes({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<MealsCubit, MealsState>(
        builder: (context, mealState) {
          if (mealState is MealsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (mealState is MealsSuccess) {
            final meals = mealState.meals;

            return BlocBuilder<FavouriteCubit, FavouriteState>(
              builder: (context, favState) {
                return GridView.builder(
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 5 / 4,
                  ),
                  itemCount: meals.length,
                  itemBuilder: (context, index) {
                    final meal = meals[index];
                    final isFavorite = context
                        .watch<FavouriteCubit>()
                        .isFavorite(meal);

                    return GestureDetector(
                      onTap: () {
                        GoRouter.of(
                          context,
                        ).push('/recipesDetailsView/${meal.idMeal}');
                      },
                      child: Card(
                        color: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(12),
                                ),
                                child: Image.network(
                                  meal.strMealThumb,
                                  fit: BoxFit.cover,
                                  errorBuilder:
                                      (context, error, stackTrace) =>
                                          const Icon(Icons.error),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      meal.strMeal,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      isFavorite
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color:
                                          isFavorite
                                              ? Colors.red
                                              : Colors.white,
                                    ),
                                    onPressed: () {
                                      context
                                          .read<FavouriteCubit>()
                                          .toggleFavorite(meal);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else if (mealState is MealsFailure) {
            return Center(child: Text('Error: ${mealState.errormessage}'));
          } else {
            return const Center(child: Text('No data loaded yet'));
          }
        },
      ),
    );
  }
}
