import 'package:elixr_poc/app_redux/app_state.dart';
import 'package:elixr_poc/home/redux/log_time_action.dart';
import 'package:elixr_poc/home/widgets/log_time_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:elixr_poc/home/screens/activity_page.dart';
import 'package:elixr_poc/home/screens/overview_page.dart';
import 'package:elixr_poc/home/screens/spent_time_screen.dart';
import 'package:flutter_redux/flutter_redux.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      StoreProvider.of<AppState>(context).dispatch(GetLogDataAction());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          backgroundColor: Colors.brown[400],
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                text: 'Overview',
              ),
              Tab(
                text: 'Activity',
              ),
              Tab(
                text: 'Spent time',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            OverviewPage(),
            ActivityPage(),
            SpendTimeScreen(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                useSafeArea: true,
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                backgroundColor: Colors.brown[50],
                builder: (BuildContext context) {
                  return const LogTimeBottomSheet();
                });
          },
          tooltip: 'Log time',
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
