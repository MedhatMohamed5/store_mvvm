import 'dart:async';

import 'package:flutter/material.dart';
import 'package:store_mvvm/presentation/resource/assets_manager.dart';
import 'package:store_mvvm/presentation/resource/theme/colors/color_manager.dart';
import 'package:store_mvvm/presentation/routes/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 2), _goNext);
  }

  void _goNext() {
    Navigator.of(context).pushReplacementNamed(Routes.onBoaringRoute);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: const Center(child: Image(image: AssetImage(ImageAssets.splashLogo))),
    );
  }
}
