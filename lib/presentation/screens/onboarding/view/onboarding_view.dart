import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store_mvvm/presentation/resource/assets_manager.dart';
import 'package:store_mvvm/presentation/resource/strings_manager.dart';
import 'package:store_mvvm/presentation/resource/theme/colors/color_manager.dart';
import 'package:store_mvvm/presentation/resource/theme/values_manger.dart';
import 'package:store_mvvm/presentation/screens/onboarding/models/slider_object.dart';
import 'package:store_mvvm/presentation/screens/onboarding/view/onboarding_widget.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late final List<SliderObject> _sliders = _getSliderData();
  final PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  List<SliderObject> _getSliderData() {
    return [
      SliderObject(AppStrings.onBoardingTitle, AppStrings.onBoardingSubTitle1, ImageAssets.onboardingLogo1),
      SliderObject(AppStrings.onBoardingTitle, AppStrings.onBoardingSubTitle2, ImageAssets.onboardingLogo2),
      SliderObject(AppStrings.onBoardingTitle, AppStrings.onBoardingSubTitle3, ImageAssets.onboardingLogo3),
      SliderObject(AppStrings.onBoardingTitle, AppStrings.onBoardingSubTitle4, ImageAssets.onboardingLogo4),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          elevation: AppSize.s0,
          backgroundColor: ColorManager.white,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        body: PageView.builder(
          itemBuilder: (context, index) {
            return OnBoardingWidget(_sliders[index]);
          },
          controller: _pageController,
          itemCount: _sliders.length,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        bottomSheet: _getBottomSheetWidget(),
      ),
    );
  }

  Widget _getBottomSheetWidget() {
    return Container(
      color: ColorManager.white,
      height: AppSize.s110,
      child: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  AppStrings.skip.toUpperCase(),
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: ColorManager.primary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
                    child: IconButton(
                      color: ColorManager.white,
                      onPressed: () {
                        _pageController.animateToPage(
                          _getPreviousPage(),
                          duration: const Duration(milliseconds: DurationConstant.d300),
                          curve: Curves.easeInOut,
                        );
                      },
                      icon: const Icon(Icons.arrow_back_ios_new),
                    ),
                  ),
                  Row(
                    children: [
                      for (int i = 0; i < _sliders.length; i++)
                        Padding(
                          padding: const EdgeInsets.all(AppPadding.p8),
                          child: _getProperCircle(i),
                        ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
                    child: IconButton(
                      color: ColorManager.white,
                      onPressed: () {
                        _pageController.animateToPage(
                          _getNextPage(),
                          duration: const Duration(milliseconds: DurationConstant.d300),
                          curve: Curves.easeInOut,
                        );
                      },
                      icon: const Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getProperCircle(int index) {
    return index == _currentIndex
        ? Icon(
            Icons.circle,
            color: ColorManager.white,
            size: AppSize.s16,
          )
        : Icon(
            Icons.circle_outlined,
            color: ColorManager.white,
            size: AppSize.s16,
          );
  }

  int _getPreviousPage() {
    if (_currentIndex > 0) {
      _currentIndex--;
    } else {
      _currentIndex = _sliders.length - 1;
    }
    return _currentIndex;
  }

  int _getNextPage() {
    if (_currentIndex < _sliders.length - 1) {
      _currentIndex++;
    } else {
      _currentIndex = 0;
    }
    return _currentIndex;
  }
}
