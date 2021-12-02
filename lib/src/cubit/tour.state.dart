part of 'tour.cubit.dart';

abstract class TourState {}

class TourStateInitial implements TourState {}

class TourStateError implements TourState {
  final String message;

  TourStateError({required this.message});
}

class TourStateLoading implements TourState {}

class TourStateLoaded implements TourState {}
