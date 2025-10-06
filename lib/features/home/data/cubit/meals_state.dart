import 'package:chefly/features/home/data/models/recipes_model.dart';
import 'package:equatable/equatable.dart';


abstract class MealsState extends Equatable {
  const MealsState();

  @override
  List<Object?> get props => [];
}

class MealsInitial extends MealsState {}

class MealsLoading extends MealsState {}

class MealsSuccess extends MealsState {
  final List<Meal> meals;
  const MealsSuccess(this.meals);
}

class MealsFailure extends MealsState {
  final String errormessage;
  const MealsFailure(this.errormessage);
}

