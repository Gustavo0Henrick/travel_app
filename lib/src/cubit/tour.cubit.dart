import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_app/src/cubit/repository/tour.repository.dart';

part './tour.state.dart';

class TourCubit extends Cubit<TourState> {
  final TourRepositoryImplementation tourRepositoryImplementation;

  TourCubit(this.tourRepositoryImplementation) : super(TourStateInitial());

  Future<void> getTour(BuildContext context) async {
    emit(TourStateLoading());
    try {
      await tourRepositoryImplementation.getTour(context: context);

      emit(TourStateLoaded());
    } catch (e) {
      emit(TourStateError(message: e.toString()));
    }
  }
}
