import 'package:flutter/cupertino.dart';

abstract class TourRepository {
  Future getTour({BuildContext context});
}

class TourRepositoryImplementation implements TourRepository {
  final BuildContext context;

  TourRepositoryImplementation({required this.context});

  @override
  Future getTour({BuildContext? context}) async {
    await Future.delayed(const Duration(seconds: 1));
    return 'teste';
  }
}
