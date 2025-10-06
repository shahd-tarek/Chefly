import 'package:chefly/core/utils/api_service.dart';
import 'package:chefly/features/home/data/cubit/meals_state.dart';
import 'package:chefly/features/home/data/models/recipes_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealsCubit extends Cubit<MealsState> {
  final ApiService apiService;

  MealsCubit(this.apiService) : super(MealsInitial());

  Future<void> fetchMeals() async {
    emit(MealsLoading());
    try {
      final data = await apiService.get(endPoint: 'search.php?f=b');
      final mealsResponse = MealResponse.fromJson(data);
      emit(MealsSuccess(mealsResponse.meals));
    } catch (e) {
      emit(MealsFailure(e.toString()));
    }
  }
}