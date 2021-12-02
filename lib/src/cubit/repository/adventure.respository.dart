import 'package:flutter/cupertino.dart';

abstract class AdventureRepository {
  Future getAdventures({BuildContext context});
}

class AdventureRepositoryImplementation implements AdventureRepository {
  final BuildContext context;

  AdventureRepositoryImplementation({required this.context});

  @override
  Future getAdventures({BuildContext? context}) async {
    await Future.delayed(const Duration(seconds: 1));
    return 'teste';
  }
}
