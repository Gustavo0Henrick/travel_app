import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/src/cubit/adventure.cubit.dart';
import 'package:travel_app/src/cubit/auth.cubit.dart';
import 'package:travel_app/src/cubit/experiences.cubit.dart';
import 'package:travel_app/src/cubit/favorite.cubit.dart';
import 'package:travel_app/src/cubit/repository/adventure.respository.dart';
import 'package:travel_app/src/cubit/repository/auth.respository.dart';
import 'package:travel_app/src/cubit/repository/experiences.repository.dart';
import 'package:travel_app/src/cubit/repository/favorite.repository.dart';
import 'package:travel_app/src/cubit/repository/tour.repository.dart';
import 'package:travel_app/src/cubit/tour.cubit.dart';
import 'package:travel_app/src/modules/auth/auth_page.dart';
import 'package:travel_app/src/modules/home/dashboard_page.dart';
import 'package:travel_app/src/modules/onboarding/onboarding_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              FavoriteCubit(FavoriteRepositoryImplementation(context: context)),
        ),
        BlocProvider(
          create: (_) => ExperiencesCubit(
              ExperiencesRepositoryImplementation(context: context)),
        ),
        BlocProvider(
          create: (_) => AdventureCubit(
              AdventureRepositoryImplementation(context: context)),
        ),
        BlocProvider(
          create: (_) => TourCubit(
              TourRepositoryImplementation(context: context)),
        ),
        BlocProvider(
          create: (_) => AuthCubit(
              AuthRepositoryImplementation(context: context)),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Travel App Demo',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        initialRoute: '/onboarding',
        routes: {
          '/onboarding': (context) => OnBoardingPage(),
          '/auth': (context) => AuthPage(),
          '/home': (context) => DashboardPage(),
        },
      ),
    );
  }
}
