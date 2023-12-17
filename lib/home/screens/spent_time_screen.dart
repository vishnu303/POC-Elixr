import 'package:elixr_poc/app_redux/app_state.dart';
import 'package:elixr_poc/home/model/log_model.dart';
import 'package:elixr_poc/home/redux/log_time_action.dart';
import 'package:elixr_poc/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class SpendTimeScreen extends StatelessWidget {
  const SpendTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var sWidth = MediaQuery.of(context).size.width;
    return StoreBuilder(builder: (context, Store<AppState> store) {
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
                bool deleteVisible =
                    logData[index].email == store.state.authState!.user!.email;
                return Card(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    height: 220,
                    width: sWidth,
                    color: Colors.brown[50],
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Chip(
                                  label: CustomText(
                                text: 'Task ${logData[index].issue}',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                textColor: Colors.black54,
                              )),
                              const Spacer(),
                              Chip(
                                label: CustomText(
                                  text: 'Hours: ${logData[index].hours}',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  textColor: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.work_history,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              CustomText(
                                text: logData[index].activity!,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                textColor: Colors.black54,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomText(
                            text: logData[index].comments!,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            textColor: Colors.black54,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              const Icon(
                                Icons.person,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              CustomText(
                                text:
                                    '${logData[index].firstname} ${logData[index].lastname}',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                textColor: Colors.black54,
                              ),
                              const Spacer(),
                              Visibility(
                                visible: deleteVisible,
                                child: IconButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const CustomText(
                                                text: 'Delete',
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              content: const CustomText(
                                                text: 'Do you want to delete ?',
                                                fontSize: 18,
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const CustomText(
                                                    text: 'Cancel',
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                    store.dispatch(
                                                        DeleteLogDataAction(
                                                            logData: logData[
                                                                index]));
                                                  },
                                                  child: CustomText(
                                                    text: 'Delete',
                                                    textColor: Colors.red[300],
                                                    fontSize: 18,
                                                  ),
                                                )
                                              ],
                                            );
                                          });
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    )),
                              )
                            ],
                          )
                        ]),
                  ),
                );
              });
    });
  }
}
