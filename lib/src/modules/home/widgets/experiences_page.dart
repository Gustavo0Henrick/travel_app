import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:travel_app/src/cubit/experiences.cubit.dart';
import 'package:travel_app/src/themes/app_colors.dart';
import 'package:travel_app/src/themes/app_images.dart';
import 'package:travel_app/src/widgets/card_experience.dart';

class ExperiencesPage extends StatefulWidget {
  ExperiencesPage({Key? key}) : super(key: key);

  @override
  _ExperiencesPageState createState() => _ExperiencesPageState();
}

List listCards = [
  CardExperience(imagePath: AppImagens.indiaPng),
  CardExperience(imagePath: AppImagens.hawaiiPng),
];
late ExperiencesCubit experiencesCubit;

class _ExperiencesPageState extends State<ExperiencesPage> {
  @override
  void initState() {
    super.initState();
    experiencesCubit = BlocProvider.of<ExperiencesCubit>(context);
    experiencesCubit.getExperiences(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<ExperiencesCubit, ExperiencesState>(
      listener: (context, state) {
        if (state is ExperiencesStateError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          color: AppColors.white,
          inAsyncCall: state is ExperiencesStateLoading,
          progressIndicator: const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrange),
          ),
          child: Center(
            child: Container(
              height: size.height,
              width: size.width,
              child: state is ExperiencesStateLoading
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
