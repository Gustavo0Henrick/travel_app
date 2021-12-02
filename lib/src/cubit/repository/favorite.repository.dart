import 'package:flutter/cupertino.dart';

abstract class FavoriteRepository {
  Future getFavorites({BuildContext context});
}

class FavoriteRepositoryImplementation implements FavoriteRepository {
  final BuildContext context;

  FavoriteRepositoryImplementation({required this.context});

  @override
  Future getFavorites({BuildContext? context}) async {
    await Future.delayed(const Duration(seconds: 2));
    return 'teste';
  }
}
