import 'package:elixr_poc/app_redux/app_state.dart';
import 'package:elixr_poc/authentication/model/user_model.dart';
import 'package:elixr_poc/home/model/log_model.dart';
import 'package:elixr_poc/home/redux/log_time_action.dart';
import 'package:elixr_poc/widgets/custom_elevated_button.dart';
import 'package:elixr_poc/widgets/custom_text.dart';
import 'package:elixr_poc/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:redux/redux.dart';

class LogTimeBottomSheet extends StatefulWidget {
  const LogTimeBottomSheet({super.key});

  @override
  State<LogTimeBottomSheet> createState() => _LogTimeBottomSheetState();
}

class _LogTimeBottomSheetState extends State<LogTimeBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _activityController = TextEditingController();
  final TextEditingController _issueController = TextEditingController();
  final TextEditingController _hourController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var sHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: sHeight * 0.75,
        margin: EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const CustomText(
                  text: 'Log Time',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  controller: _issueController,
                  labelText: 'Issue',
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'field can\'t be empty';
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                  controller: _activityController,
                  labelText: 'Activity',
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'field can\'t be empty';
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                  controller: _dateController,
                  labelText: 'Date',
                  readOnly: true,
                  enableInteractiveSelection: false,
                  textInputAction: TextInputAction.next,
                  suffixIcon: IconButton(
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2050));
                      if (pickedDate != null) {
                        String formatDate =
                            DateFormat("dd-MM-yyyy").format(pickedDate);
                        _dateController.text = formatDate.toString();
                      }
                    },
                    icon: const Icon(Icons.calendar_month),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'field can\'t be empty';
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                  controller: _hourController,
                  labelText: 'Hours',
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'field can\'t be empty';
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                  controller: _commentController,
                  labelText: 'Comment',
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'field can\'t be empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                StoreBuilder(builder: (context, Store<AppState> store) {
                  return CustomElevatedButton(
                    onPressed: () {
                      User userData = store.state.authState!.user!;
                      LogModel logData = LogModel(
                        firstname: userData.firstName,
                        lastname: userData.lastName,
                        email: userData.email,
                        issue: int.parse(_issueController.text),
                        date: _dateController.text,
                        hours: int.parse(_hourController.text),
                        activity: _activityController.text,
                        comments: _commentController.text,
                      );
                      if (formKey.currentState!.validate()) {
                        store.dispatch(SetLogDataAction(logdata: logData));
                        store.dispatch(GetLogDataAction());
                      }
                      Navigator.of(context).pop();
                    },
                    child: const CustomText(
                      text: 'Save',
                      fontSize: 18,
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
