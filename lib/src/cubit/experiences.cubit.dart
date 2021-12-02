import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_app/src/cubit/repository/experiences.repository.dart';

part './experiences.state.dart';

class ExperiencesCubit extends Cubit<ExperiencesState> {
  final ExperiencesRepositoryImplementation experiencesRepositoryImplementation;

  ExperiencesCubit(this.experiencesRepositoryImplementation)
      : super(ExperiencesStateInitial());

  Future<void> getExperiences(BuildContext context) async {
    emit(ExperiencesStateLoading());
    try {
      await experiencesRepositoryImplementation.getExperiences(
          context: context);

      emit(ExperiencesStateLoaded());
    } catch (e) {
      emit(ExperiencesStateError(message: e.toString()));
    }
  }
}
