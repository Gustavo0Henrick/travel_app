import 'package:flutter/cupertino.dart';

abstract class ExperiencesRepository {
  Future getExperiences({BuildContext context});
}

class ExperiencesRepositoryImplementation implements ExperiencesRepository {
  final BuildContext context;

  ExperiencesRepositoryImplementation({required this.context});

  @override
  Future getExperiences({BuildContext? context}) async {
    await Future.delayed(const Duration(seconds: 1));
    return 'teste';
  }
}
