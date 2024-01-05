import 'package:elixr_poc/app_redux/app_state.dart';
import 'package:elixr_poc/authentication/redux/authentication_actions.dart';
import 'package:elixr_poc/authentication/repo/api_services.dart';
import 'package:elixr_poc/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import '../model/user_model.dart';

Middleware<AppState> signUpMiddleWare() {
  return (Store<AppState> store, action, NextDispatcher next) async {
    String errorMsg = '';

    if (action is SignUpAction) {
      User user = action.user;
      try {
        final int statusCode = await ApiService.signUp(user);
        debugPrint(statusCode.toString());
        if (statusCode == 200) {
          store.dispatch(SignUpSuccessAction());
          SnackBarService.showSnackBar(
              content: 'Sign Up successful .Sign in with your credentials');
        } else {
          switch (statusCode) {
            case 400:
              errorMsg = "User already exist";
              break;
            case 401:
              errorMsg = "UnAuthorized access";
              break;
            case 403:
              errorMsg = "Resource access forbidden";
              break;
            case 404:
              errorMsg = "Resource not Found";
              break;
            case 500:
              errorMsg = "Internal server error";
              break;
            default:
              errorMsg = "Unknown";
              break;
          }
          store.dispatch(SignUpFaliedAction(errorMsg: errorMsg));
        }
      } catch (e) {
        store.dispatch(SignUpFaliedAction(errorMsg: e.toString()));
      }
    }
    next(action);
  };
}

Middleware<AppState> signInMiddleware() {
  return (Store<AppState> store, action, NextDispatcher next) async {
    if (action is SignInAction) {
      try {
        User response = await ApiService.signIn(
            email: action.email, password: action.password);

        if (response.email.isNotEmpty) {
          store.dispatch(SignInSuccessAction(user: response));
        } else {
          store.dispatch(SignInFailedAction());
        }
      } catch (e) {
        store.dispatch(SignInFailedAction());
      }
    }
    next(action);
  };
}
