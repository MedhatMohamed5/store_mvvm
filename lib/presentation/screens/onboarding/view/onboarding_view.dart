import 'package:flutter/material.dart';
import 'package:store_mvvm/presentation/resource/theme/colors/color_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: ColorManager.white,
        body: const Center(child: Text('Welcome on boarding')),
      ),
    );
  }
}
