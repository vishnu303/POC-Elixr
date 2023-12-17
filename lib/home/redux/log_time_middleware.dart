import 'package:elixr_poc/app_redux/app_state.dart';
import 'package:elixr_poc/home/model/log_model.dart';
import 'package:elixr_poc/home/redux/log_time_action.dart';
import 'package:elixr_poc/home/repo/log_time_sharedpref.dart';
import 'package:redux/redux.dart';

Middleware<AppState> setLogTimeMiddleware() {
  return (Store<AppState> store, action, NextDispatcher next) async {
    if (action is SetLogDataAction) {
      try {
        await LogTimeSharedPref.setLog(action.logdata);
        store.dispatch(LogAddedSuccess());
      } catch (e) {
        store.dispatch(LogDataFailed());
      }
    }
    next(action);
  };
}

Middleware<AppState> getLogTimeMiddleware() {
  return (Store<AppState> store, action, NextDispatcher next) async {
    if (action is GetLogDataAction) {
      try {
        List<LogModel> logdata = await LogTimeSharedPref.getLog();
        store.dispatch(FetchedLogDataAction(logdata: logdata));
      } catch (e) {
        store.dispatch(LogDataFailed());
      }
    }
    next(action);
  };
}

Middleware<AppState> deleteLogTimeMiddleware() {
  return (Store<AppState> store, action, NextDispatcher next) async {
    if (action is DeleteLogDataAction) {
      try {
        await LogTimeSharedPref.deleteLogData(action.logData);
        store.dispatch(DeleteLogDataSuccessAction());
        store.dispatch(GetLogDataAction());
      } catch (e) {
        store.dispatch(LogDataFailed());
      }
    }
    next(action);
  };
}
