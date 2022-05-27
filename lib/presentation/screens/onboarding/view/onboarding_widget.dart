import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_mvvm/domain/onboarding/slider_object_model.dart';
import 'package:store_mvvm/presentation/resource/theme/values_manger.dart';

class OnBoardingWidget extends StatelessWidget {
  final SliderObject _object;

  const OnBoardingWidget(this._object, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppSize.s28,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _object.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _object.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        const SizedBox(height: AppSize.s40),
        SvgPicture.asset(_object.image),
      ],
    );
  }
}
