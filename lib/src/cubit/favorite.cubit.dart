import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_app/src/cubit/repository/favorite.repository.dart';

part './favorite.state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepositoryImplementation favoriteRepositoryImplementation;

  FavoriteCubit(this.favoriteRepositoryImplementation)
      : super(FavoriteStateInitial());

  Future<void> getFavorite(BuildContext context) async {
    emit(FavoriteStateLoading());
    try {
      await favoriteRepositoryImplementation.getFavorites(context: context);

      emit(FavoriteStateLoaded());
    } catch (e) {
      emit(FavoriteStateError(message: e.toString()));
    }
  }
}
