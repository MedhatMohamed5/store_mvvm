abstract class BaseViewModel extends BaseViewModelInputs with BaseViewModelOutputs {}

abstract class BaseViewModelInputs {
  void start(); // will be called while initializing view model
  void dispose(); // will be called while disposing the view model
}

abstract class BaseViewModelOutputs {
  void start();
}
