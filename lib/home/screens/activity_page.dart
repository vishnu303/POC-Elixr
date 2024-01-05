import 'package:elixr_poc/app_redux/app_state.dart';
import 'package:elixr_poc/home/model/log_model.dart';
import 'package:elixr_poc/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StoreBuilder(builder: (context, Store<AppState> store) {
      List<LogModel> logData = store.state.logState!.logList!.reversed.toList();
      return logData.isEmpty
          ? const Center(
              child: CustomText(
                text: 'No data',
                fontSize: 18,
              ),
            )
          : ListView.builder(
              itemCount: logData.length,
              itemBuilder: (context, index) {
                return Card(
                    child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(20),
                    child: CustomText(
                      textAlign: TextAlign.center,
                      text:
                          '${logData[index].firstname} ${logData[index].lastname} added task#${logData[index].issue} on ${logData[index].date}',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ));
              });
    }));
  }
}
