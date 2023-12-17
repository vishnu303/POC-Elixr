import 'package:elixr_poc/authentication/model/user_model.dart';
import 'package:elixr_poc/authentication/redux/authentication_actions.dart';
import 'package:elixr_poc/authentication/redux/authentication_state.dart';
import 'package:elixr_poc/widgets/custom_snackbar.dart';

AuthState authReducer(AuthState state, action) {
  if (action is SignUpAction) {
    return state.copyWith(user: action.user, isFetching: true);
  } else if (action is SignUpSuccessAction) {
    return state.copyWith(signUpSuccess: true, isFetching: false);
  } else if (action is MovedToNextPage) {
    return state.copyWith(
        signUpSuccess: false, isFetching: false, signInSuccess: false);
  } else if (action is SignUpFaliedAction) {
    SnackBarService.showSnackBar(content: action.errorMsg);

    return state.copyWith(
        authError: action.errorMsg, isFetching: false, signUpSuccess: false);
  } else if (action is SignInAction) {
    return state.copyWith(
      isFetching: true,
      signUpSuccess: false,
    );
  } else if (action is SignInSuccessAction) {
    User signInUser = User(
        firstName: action.user.firstName,
        lastName: action.user.lastName,
        email: action.user.email,
        password: 'password');
    return state.copyWith(
      user: signInUser,
      signInSuccess: true,
      isFetching: false,
    );
  } else if (action is SignInFailedAction) {
    SnackBarService.showSnackBar(content: 'Invalid email or password');
    return state.copyWith(signInSuccess: false, isFetching: false);
  }
  return state;
}
