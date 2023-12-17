import 'package:elixr_poc/home/redux/log_time_action.dart';
import 'package:elixr_poc/home/redux/log_time_state.dart';
import 'package:elixr_poc/widgets/custom_snackbar.dart';

LogState logReducer(LogState state, action) {
  if (action is FetchedLogDataAction) {
    return LogState(logList: action.logdata);
  } else if (action is LogDataFailed) {
    SnackBarService.showSnackBar(content: 'something went wrong !');
  }

  return state;
}
