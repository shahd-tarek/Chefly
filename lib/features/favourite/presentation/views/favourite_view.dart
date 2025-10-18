import 'package:chefly/constants.dart';
import 'package:chefly/core/utils/styles.dart';
import 'package:chefly/features/favourite/data/cubit/favourite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Favourites',
         style: Styles.textStyle20.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: BlocBuilder<FavouriteCubit, dynamic>(
        builder: (context, state) {
          final favouriteMeals = context.watch<FavouriteCubit>().favoriteMeals;

          if (favouriteMeals.isEmpty) {
            return const Center(
              child: Text(
                'No favourite meals yet',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: favouriteMeals.length,
            itemBuilder: (context, index) {
              final meal = favouriteMeals[index];
              return Card(
                // color: kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      meal.strMealThumb,
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                      errorBuilder:
                          (context, error, stackTrace) =>
                              const Icon(Icons.error),
                    ),
                  ),
                  title: Text(
                    meal.strMeal,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      // color: Colors.white,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      context.read<FavouriteCubit>().toggleFavorite(meal);
                    },
                  ),
                  onTap: () {
                    GoRouter.of(
                      context,
                    ).push('/recipesDetailsView/${meal.idMeal}');
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
