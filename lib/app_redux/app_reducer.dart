import 'package:elixr_poc/app_redux/app_state.dart';
import 'package:elixr_poc/authentication/redux/authentication_reducer.dart';
import 'package:elixr_poc/home/redux/log_time_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
      authState: authReducer(state.authState!, action),
      logState: logReducer(state.logState!, action));
}
