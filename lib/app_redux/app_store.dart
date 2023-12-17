import 'package:elixr_poc/app_redux/app_reducer.dart';
import 'package:elixr_poc/app_redux/app_state.dart';
import 'package:elixr_poc/authentication/redux/auth_middleware.dart';
import 'package:elixr_poc/authentication/redux/authentication_state.dart';
import 'package:elixr_poc/home/redux/log_time_middleware.dart';
import 'package:elixr_poc/home/redux/log_time_state.dart';

import 'package:redux/redux.dart';

final store = Store<AppState>(
  appReducer,
  initialState:
      AppState(authState: AuthState.initial(), logState: LogState.initial()),
  middleware: [
    signUpMiddleWare(),
    signInMiddleware(),
    setLogTimeMiddleware(),
    getLogTimeMiddleware(),
    deleteLogTimeMiddleware(),
  ],
);
