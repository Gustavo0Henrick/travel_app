import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:travel_app/src/cubit/tour.cubit.dart';
import 'package:travel_app/src/themes/app_colors.dart';
import 'package:travel_app/src/themes/app_images.dart';
import 'package:travel_app/src/widgets/card_tour.dart';

class TourPage extends StatefulWidget {
  TourPage({Key? key}) : super(key: key);

  @override
  _TourPageState createState() => _TourPageState();
}

List listCards = [
  CardTour(title: 'Paris', subtitle: 'France', imagePath: AppImagens.paris),
  CardTour(title: 'Amazon', subtitle: 'Brazil', imagePath: AppImagens.forest),
  CardTour(title: 'Fuji', subtitle: 'Japan', imagePath: AppImagens.fuji),
];
late TourCubit tourCubit;

class _TourPageState extends State<TourPage> {
  @override
  void initState() {
    super.initState();
    tourCubit = BlocProvider.of<TourCubit>(context);
    tourCubit.getTour(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<TourCubit, TourState>(
      listener: (context, state) {
        if (state is TourStateError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          color: AppColors.white,
          inAsyncCall: state is TourStateLoading,
          progressIndicator: const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrange),
          ),
          child: Center(
            child: Container(
              height: size.height,
              width: size.width,
              child: state is TourStateLoading
                  ? Container(
                      height: size.height,
                      width: size.width,
                      color: AppColors.white,
                    )
                  : ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: listCards.length,
                      scrollDirection: Axis.horizontal,
                      padding:
                          const EdgeInsets.only(top: 30, left: 30, right: 30),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Center(
                            child: listCards[index],
                          ),
                        );
                      },
                    ),
            ),
          ),
        );
      },
    );
  }
}
