import 'package:elixr_poc/home/model/log_model.dart';

class LogState {
  final List<LogModel>? logList;
  LogState({this.logList});

  factory LogState.initial() {
    return LogState(logList: []);
  }
}
