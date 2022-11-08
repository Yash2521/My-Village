import 'package:flutter/material.dart';
import 'package:practice/setting.dart';
import 'expense.dart';
import 'contacts.dart';
import 'dashboard.dart';
import 'events.dart';
import 'news.dart';
import 'voting.dart';
import 'complain.dart';
import 'update.dart';
import 'drawer.dart';

void main() {
  runApp(MyHome());
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.dashboard;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.dashboard) {
      container = DashboardPage();
    } else if (currentPage == DrawerSections.contacts) {
      container = ContactPage();
    } else if (currentPage == DrawerSections.events) {
      container = EventsPage();
    }else if (currentPage == DrawerSections.news) {
      container = NewsPage();
    }else if (currentPage == DrawerSections.voting) {
      container = VotingPage();
    }else if (currentPage == DrawerSections.expense) {
      container = ExpensePage();
    }else if (currentPage == DrawerSections.complain) {
      container = ComplainPage();
    }else if (currentPage == DrawerSections.update) {
      container = UpdatePage();
    }else if (currentPage == DrawerSections.setting) {
      container = SettingsPage();
    }


    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Color(0xff3957ed),
        title: Text("Village Management System"),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 0,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Dashboard", Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Emergency Contact", Icons.people_alt_outlined,
              currentPage == DrawerSections.contacts ? true : false),
          menuItem(3, "Events", Icons.event,
              currentPage == DrawerSections.events ? true : false),
          menuItem(4, "Latest News", Icons.newspaper,
              currentPage == DrawerSections.news ? true : false),
          menuItem(5, "Online Voting", Icons.how_to_vote,
              currentPage == DrawerSections.voting ? true : false),
          menuItem(6, "Village Expense", Icons.money_rounded,
              currentPage == DrawerSections.expense ? true : false),
          menuItem(7, "Online Complain", Icons.headset_mic,
              currentPage == DrawerSections.complain ? true : false),
          menuItem(8, "Update Details", Icons.update,
              currentPage == DrawerSections.update ? true : false),
          menuItem(9, "Settings", Icons.settings,
              currentPage == DrawerSections.setting ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.contacts;
            } else if (id == 3) {
              currentPage = DrawerSections.events;
            } else if (id == 4) {
              currentPage = DrawerSections.news;
            } else if (id == 5) {
              currentPage = DrawerSections.voting;
            } else if (id == 6) {
              currentPage = DrawerSections.expense;
            }else if (id == 7) {
              currentPage = DrawerSections.complain;
            }else if (id == 8) {
              currentPage = DrawerSections.update;
            }else if (id == 9) {
              currentPage = DrawerSections.setting;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashboard,
  contacts,
  events,
  news,
  voting,
  expense,
  complain,
  update,
  setting,
}

