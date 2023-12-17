import 'package:elixr_poc/home/model/log_model.dart';

class SetLogDataAction {
  final LogModel logdata;
  SetLogDataAction({required this.logdata});
}

class LogAddedSuccess {}

class GetLogDataAction {}

class FetchedLogDataAction {
  final List<LogModel> logdata;
  FetchedLogDataAction({required this.logdata});
}

class DeleteLogDataAction {
  final LogModel logData;
  DeleteLogDataAction({required this.logData});
}

class DeleteLogDataSuccessAction {}

class LogDataFailed {}
