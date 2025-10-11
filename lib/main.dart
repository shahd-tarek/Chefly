import 'package:chefly/core/utils/app_router.dart';
import 'package:chefly/features/favourite/data/cubit/favourite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => FavouriteCubit())],
      child: MaterialApp.router(
        title: 'Chefly',
        theme: ThemeData(),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
