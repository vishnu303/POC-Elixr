import '../model/user_model.dart';

class AuthState {
  final User? user;
  final String? authError;
  final bool? signUpSuccess;
  final bool? isFetching;
  final bool? signInSuccess;

  AuthState({
    this.signInSuccess,
    this.user,
    this.authError,
    this.signUpSuccess,
    this.isFetching,
  });
  AuthState copyWith({
    User? user,
    String? authError,
    bool? signUpSuccess,
    bool? signInSuccess,
    bool? isFetching,
  }) {
    return AuthState(
      user: user ?? this.user,
      authError: authError ?? this.authError,
      signUpSuccess: signUpSuccess ?? this.signUpSuccess,
      signInSuccess: signInSuccess ?? this.signInSuccess,
      isFetching: isFetching ?? this.isFetching,
    );
  }

  factory AuthState.initial() {
    return AuthState(
        authError: '',
        signUpSuccess: false,
        signInSuccess: false,
        isFetching: false,
        user: User(
          firstName: '',
          lastName: '',
          email: '',
          password: '',
        ));
  }
}
