import '../model/user_model.dart';

class SignUpAction {
  final User user;
  SignUpAction(this.user);
}

class SignUpSuccessAction {}

class SignUpFaliedAction {
  final String errorMsg;
  SignUpFaliedAction({
    required this.errorMsg,
  });
}

class MovedToNextPage {}

class SignInAction {
  final String email;
  final String password;
  SignInAction({
    required this.email,
    required this.password,
  });
}

class SignInSuccessAction {
  final User user;
  SignInSuccessAction({required this.user});
}

class SignInFailedAction {}
