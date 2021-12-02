import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_app/src/cubit/repository/adventure.respository.dart';

part './adventure.state.dart';

class AdventureCubit extends Cubit<AdventureState> {
  final AdventureRepositoryImplementation adventureRepositoryImplementation;

  AdventureCubit(this.adventureRepositoryImplementation)
      : super(AdventureStateInitial());

  Future<void> getAdventures(BuildContext context) async {
    emit(AdventureStateLoading());
    try {
      await adventureRepositoryImplementation.getAdventures(context: context);

      emit(AdventureStateLoaded());
    } catch (e) {
      emit(AdventureStateError(message: e.toString()));
    }
  }
}
