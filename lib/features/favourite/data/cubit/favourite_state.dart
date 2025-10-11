import 'package:chefly/features/home/data/models/recipes_model.dart';
import 'package:equatable/equatable.dart';

abstract class FavouriteState extends Equatable {
  const FavouriteState();

  @override
  List<Object?> get props => [];
}

class FavouriteInitial extends FavouriteState {}

class FavouriteAdd extends FavouriteState {
  final List<Meal> favourite;
  const FavouriteAdd(this.favourite);
}

class FavouriteFailure extends FavouriteState {
  final String errormessage;
  const FavouriteFailure(this.errormessage);
}
