import 'package:chefly/features/home/data/models/recipes_model.dart';
import 'package:equatable/equatable.dart';


abstract class DetailsState extends Equatable {
  const DetailsState();

  @override
  List<Object?> get props => [];
}

class DetailsInitial extends DetailsState {}

class DetailsLoading extends DetailsState {}

class DetailsSuccess extends DetailsState {
   final Meal meal;
  const DetailsSuccess(this.meal);
}

class DetailsFailure extends DetailsState {
  final String errormessage;
  const DetailsFailure(this.errormessage);
}
