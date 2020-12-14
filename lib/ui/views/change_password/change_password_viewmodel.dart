import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:traffic_light/app/locator.dart';
import 'package:traffic_light/app/router.gr.dart';
import 'package:traffic_light/services/authentication_service.dart';

class ChangePasswordViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  final _authenticationService = locator<AuthenticationService>();

  final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;
  DialogService _dialogService = locator<DialogService>();
  Future<int> updatePassword(
      {@required String oldPassword, @required String newPassword}) async {
    if (_formKey.currentState.validate()) {
      setBusy(true);
      if (_authenticationService.currentUser != null) {
        var result = await _authenticationService.loginWithEmail(
            email: _authenticationService.currentUser.email,
            password: oldPassword);
        if (result is bool) {
          print(result);
          if (result) {
            try {
              await _authenticationService.currentUser
                  .updatePassword(newPassword);
              setBusy(false);
              this.back();
              return 0;
            } catch (error) {
              setBusy(false);
              await _dialogService.showDialog(
                title: 'Change password faild!',
                description: 'Something went wrong',
              );
              return -1;
            }
          } else {
            setBusy(false);
            await _dialogService.showDialog(
              title: 'Change password faild!',
              description: 'Old password not correct',
            );
            return -1;
          }
        } else {
          setBusy(false);
          await _dialogService.showDialog(
            title: 'Change password faild!',
            description: 'Old password not correct',
          );
          return -1;
        }
      }
    } else {
      setBusy(false);
      await _dialogService.showDialog(
        title: 'Change password faild!',
        description: 'Not login yet.',
      );
      return -1;
    }
  }

  void back() {
    _navigationService.back();
  }

  void gotoHomePage() {
    _navigationService.clearStackAndShow(Routes.homeView);
  }
}
