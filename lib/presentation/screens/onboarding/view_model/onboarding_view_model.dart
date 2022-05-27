import 'dart:async';

import 'package:store_mvvm/domain/onboarding/slider_object_model.dart';
import 'package:store_mvvm/presentation/base/base_view_model.dart';
import 'package:store_mvvm/presentation/resource/assets_manager.dart';
import 'package:store_mvvm/presentation/resource/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  // Stream Controller
  final StreamController<SliderViewObject> _streamController = StreamController<SliderViewObject>();

  late final List<SliderObject> _sliders;
  int _currentIndex = 0;

  // Inputs
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _sliders = _getSliderData();

    _postDataToView();
  }

  @override
  int goNext() {
    if (_currentIndex < _sliders.length - 1) {
      _currentIndex++;
    } else {
      _currentIndex = 0;
    }
    // _postDataToView();
    return _currentIndex;
  }

  @override
  int goPrevious() {
    if (_currentIndex > 0) {
      _currentIndex--;
    } else {
      _currentIndex = _sliders.length - 1;
    }
    // _postDataToView();
    return _currentIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  Stream<SliderViewObject> get outputSliderStreamObject => _streamController.stream.map((sliderViewObject) => sliderViewObject);

  List<SliderObject> _getSliderData() {
    return [
      SliderObject(
        AppStrings.onBoardingTitle,
        AppStrings.onBoardingSubTitle1,
        ImageAssets.onboardingLogo1,
      ),
      SliderObject(
        AppStrings.onBoardingTitle,
        AppStrings.onBoardingSubTitle2,
        ImageAssets.onboardingLogo2,
      ),
      SliderObject(
        AppStrings.onBoardingTitle,
        AppStrings.onBoardingSubTitle3,
        ImageAssets.onboardingLogo3,
      ),
      SliderObject(
        AppStrings.onBoardingTitle,
        AppStrings.onBoardingSubTitle4,
        ImageAssets.onboardingLogo4,
      ),
    ];
  }

  void _postDataToView() {
    inputSliderViewObject.add(
      SliderViewObject(
        _sliders,
        _sliders.length,
        _currentIndex,
      ),
    );
  }
}

abstract class OnBoardingViewModelInputs {
  int goNext();
  int goPrevious();
  void onPageChanged(int index);

  Sink get inputSliderViewObject; // Stream input ... to add data to the stream
}

abstract class OnBoardingViewModelOutputs {
  Stream<SliderViewObject> get outputSliderStreamObject;
}

class SliderViewObject {
  List<SliderObject> sliders;
  int numberOfSlides;
  int currentIndex;
  SliderViewObject(
    this.sliders,
    this.numberOfSlides,
    this.currentIndex,
  );
}
