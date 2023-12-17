import 'package:elixr_poc/app_redux/app_state.dart';
import 'package:elixr_poc/home/model/log_model.dart';
import 'package:elixr_poc/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    var sWidth = MediaQuery.of(context).size.width;
    return StoreBuilder(builder: (context, Store<AppState> store) {
      List<LogModel> logData = store.state.logState!.logList!.reversed.toList();
      int spentTime = logData.fold(0, (int total, LogModel element) {
        return total + (element.hours ?? 0);
      });

      return logData.isEmpty
          ? const Center(
              child: CustomText(
                text: 'No data',
                fontSize: 18,
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: CustomText(
                    text: 'Overview',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  child: Container(
                    height: 200,
                    width: sWidth,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(15),
                    color: Colors.brown[50],
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(
                          text: 'Issue Tracking',
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                            child: CustomText(
                                text: 'Total tasks :  ${logData.length}',
                                fontSize: 19)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  child: Container(
                    height: 200,
                    width: sWidth,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(15),
                    color: Colors.brown[50],
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(
                          text: 'Spend Time',
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                            child: CustomText(
                                text: 'Total spend time :  $spentTime',
                                fontSize: 19)),
                      ],
                    ),
                  ),
                )
              ],
            );
    });
  }
}
