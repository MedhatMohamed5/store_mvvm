import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store_mvvm/presentation/resource/strings_manager.dart';
import 'package:store_mvvm/presentation/resource/theme/colors/color_manager.dart';
import 'package:store_mvvm/presentation/resource/theme/values_manger.dart';
import 'package:store_mvvm/presentation/screens/onboarding/view/onboarding_widget.dart';
import 'package:store_mvvm/presentation/screens/onboarding/view_model/onboarding_view_model.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController(initialPage: 0);

  final OnBoardingViewModel _onBoardingViewModel = OnBoardingViewModel();

  _bind() {
    _onBoardingViewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _onBoardingViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: _onBoardingViewModel.outputSliderStreamObject,
      builder: (context, snapShot) {
        return _getContentWidget(snapShot.data);
      },
    );
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject) {
    return sliderViewObject == null
        ? Container()
        : Center(
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
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return OnBoardingWidget(sliderViewObject.sliders[index]);
                },
                controller: _pageController,
                itemCount: sliderViewObject.numberOfSlides,
                onPageChanged: (index) {
                  _onBoardingViewModel.onPageChanged(index);
                },
                // scrollDirection: Axis.vertical,
              ),
              bottomSheet: _getBottomSheetWidget(sliderViewObject),
            ),
          );
  }

  Widget _getBottomSheetWidget(SliderViewObject sliderViewObject) {
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
              color: ColorManager.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
                    child: IconButton(
                      color: ColorManager.primary,
                      onPressed: () {
                        _pageController.animateToPage(
                          _onBoardingViewModel.goPrevious(),
                          duration: const Duration(milliseconds: DurationConstant.d300),
                          curve: Curves.easeInOut,
                        );
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: ColorManager.primary,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      for (int i = 0; i < sliderViewObject.numberOfSlides; i++)
                        Padding(
                          padding: const EdgeInsets.all(AppPadding.p8),
                          child: _getProperCircle(i == sliderViewObject.currentIndex),
                        ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
                    child: IconButton(
                      color: ColorManager.white,
                      onPressed: () {
                        _pageController.animateToPage(
                          _onBoardingViewModel.goNext(),
                          duration: const Duration(milliseconds: DurationConstant.d300),
                          curve: Curves.easeInOut,
                        );
                      },
                      icon: Icon(Icons.arrow_forward_ios, color: ColorManager.primary),
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

  Widget _getProperCircle(bool filled) {
    return filled
        ? Icon(
            Icons.circle,
            color: ColorManager.primary,
            size: AppSize.s16,
          )
        : Icon(
            Icons.circle_outlined,
            color: ColorManager.primary,
            size: AppSize.s16,
          );
  }
}
