part of 'experiences.cubit.dart';

abstract class ExperiencesState {}

class ExperiencesStateInitial implements ExperiencesState {}

class ExperiencesStateError implements ExperiencesState {
  final String message;

  ExperiencesStateError({required this.message});
}

class ExperiencesStateLoading implements ExperiencesState {}

class ExperiencesStateLoaded implements ExperiencesState {}
