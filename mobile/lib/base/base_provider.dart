import 'package:flutter/material.dart';
import 'package:music_roster/base/service_locator.dart';
import 'package:music_roster/helpers/app_helper.dart';
import 'package:music_roster/storage/app_shared_pref.dart';
import 'package:music_roster/widgets/loader.dart';

class BaseProvider extends ChangeNotifier {
  AppSharedPref pref = getIt<AppSharedPref>();
  AppHelper appHelper = getIt<AppHelper>();

  bool _loadingState = false;
  bool _disposed = false;
  bool get loadingState => _loadingState;

  void setLoadingState(bool loadingState) {
    _loadingState = loadingState;
    notify();
  }

  void notify() {
    notifyListeners();
  }

  showLoadingIndicator() {
    showLoader();
  }

  hideLoadingIndicator() {
    hideLoader();
  }

  @override
  void notifyListeners() {
    // to avoid calling listeners after notifier is disposed
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}
