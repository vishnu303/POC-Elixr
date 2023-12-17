import 'package:elixr_poc/authentication/redux/authentication_state.dart';
import 'package:elixr_poc/home/redux/log_time_state.dart';

class AppState {
  final AuthState? authState;
  final LogState? logState;
  AppState({this.authState, this.logState});
}
