part of 'adventure.cubit.dart';

abstract class AdventureState {}

class AdventureStateInitial implements AdventureState {}

class AdventureStateError implements AdventureState {
  final String message;

  AdventureStateError({required this.message});
}

class AdventureStateLoading implements AdventureState {}

class AdventureStateLoaded implements AdventureState {}
