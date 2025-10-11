import 'package:chefly/core/utils/api_service.dart';
import 'package:chefly/features/home/data/cubit/details_state.dart';
import 'package:chefly/features/home/data/models/recipes_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsCubit extends Cubit<DetailsState> {
  final ApiService apiService;

  DetailsCubit(this.apiService) : super(DetailsInitial());

  Future<void> fetchDetails(String mealId) async {
    emit(DetailsLoading());
    try {
      final data = await apiService.get(endPoint: 'lookup.php?i=$mealId');
      final mealResponse = MealResponse.fromJson(data);
      final meal = mealResponse.meals.first;
      emit(DetailsSuccess(meal));
    } catch (e) {
      emit(DetailsFailure(e.toString()));
    }
  }
}
