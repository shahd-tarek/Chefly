import 'package:chefly/features/favourite/data/cubit/favourite_state.dart';
import 'package:chefly/features/home/data/models/recipes_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteInitial());

  final List<Meal> _favoriteMeals = [];

  List<Meal> get favoriteMeals => List.unmodifiable(_favoriteMeals);

  void toggleFavorite(Meal meal) {
    if (_favoriteMeals.contains(meal)) {
      _favoriteMeals.remove(meal);
    } else {
      _favoriteMeals.add(meal);
    }
    emit(FavouriteAdd(List.unmodifiable(_favoriteMeals)));
  }

  bool isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }
}
