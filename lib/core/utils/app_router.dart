import 'package:chefly/core/utils/api_service.dart';
import 'package:chefly/features/home/data/cubit/details_cubit.dart';
import 'package:chefly/features/home/presentation/views/home_view.dart';
import 'package:chefly/features/home/presentation/widgets/recipes_details_view_body.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Features/Splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kRecipesDetailsView = '/recipesDetailsView';
  static const kSearchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: '/homeView', builder: (context, state) => const HomeView()),
      GoRoute(
        path: '/recipesDetailsView/:mealId',
        builder: (context, state) {
          final mealId = state.pathParameters['mealId']!;

          return BlocProvider(
            create: (context) => DetailsCubit(ApiService(Dio())),
            child: RecipesDetailsViewBody(mealId: mealId),
          );
        },
      ),
    ],
  );
}
