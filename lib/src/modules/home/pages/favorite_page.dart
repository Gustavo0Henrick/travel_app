import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:travel_app/src/cubit/favorite.cubit.dart';
import 'package:travel_app/src/themes/app_colors.dart';
import 'package:travel_app/src/themes/app_images.dart';
import 'package:travel_app/src/widgets/card_tour.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  late FavoriteCubit favoriteCubit;

  @override
  void initState() {
    super.initState();
    favoriteCubit = BlocProvider.of<FavoriteCubit>(context);
    favoriteCubit.getFavorite(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List listFavorites = [
      CardTour(
        title: 'New York',
        subtitle: 'United States of America',
        imagePath: AppImagens.newYork,
      ),
      CardTour(
        title: 'Sydney',
        subtitle: 'Australia',
        imagePath: AppImagens.sydney,
      ),
      CardTour(
        title: 'Paris',
        subtitle: 'France',
        imagePath: AppImagens.paris,
      ),
    ];
    return BlocConsumer<FavoriteCubit, FavoriteState>(
      listener: (context, state) {
        if (state is FavoriteStateError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          color: AppColors.white,
          inAsyncCall: state is FavoriteStateLoading,
          progressIndicator: const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrange),
          ),
          child: Container(
            height: size.height,
            width: size.width,
            child: state is FavoriteStateLoading
                ? Container(
                    height: size.height,
                    width: size.width,
                    color: AppColors.white,
                  )
                : Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Text(
                          "Favorite",
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 34,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: size.width,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: listFavorites.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 40, right: 10, top: 50),
                                  child: listFavorites[index],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
