import 'package:devops_demo/ui/views/College.dart';
import 'package:devops_demo/ui/views/Ice.dart';
import 'package:devops_demo/ui/views/Student.dart';
import 'package:devops_demo/ui/views/Subject.dart';
import 'package:devops_demo/ui/views/sports.dart';
import 'package:flutter/material.dart';
import 'package:devops_demo/resources/texts/strings.dart';
import 'package:devops_demo/ui/views/aboutus.dart';
import 'package:devops_demo/ui/views/charity.dart';
import 'package:devops_demo/ui/views/education.dart';
import 'package:devops_demo/ui/views/family.dart';
import 'package:devops_demo/ui/views/food.dart';
import 'package:devops_demo/ui/views/health.dart';
import 'package:devops_demo/ui/views/housing.dart';
import 'package:devops_demo/ui/views/knowledge.dart';
import 'package:devops_demo/ui/views/work.dart';
import 'package:devops_demo/ui/widgets/showalertdialog.dart';

class MainMenuTabUser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainMenuTabUserState();
}

class MainMenuTabUserState extends State<MainMenuTabUser>
    with TickerProviderStateMixin {
  late TabController _controller;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
    _controller.addListener(() {
      setState(() {
        selectedIndex = _controller.index;
      });
    });
  }

  Future<bool> onBackPressed() async {
    return (await showAlertDialogDouble(
        context, Strings.ALERT_HDR_ARE_YOU_SURE, Strings.ALERT_BDY_ARE_YOU_SURE)) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 13,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorWeight: 6,
            isScrollable: true,
            tabs: [
              Tab(icon: Icon(Icons.family_restroom), child: Text(Strings.TITLE_MM_TB_MM)),
              Tab(icon: Icon(Icons.work), child: Text(Strings.TITLE_MM_TB_VEDKAR)),
              Tab(
                  icon: Icon(Icons.local_hospital),
                  child: Text(Strings.TITLE_MM_TB_OUS)),
              Tab(
                  icon: Icon(Icons.school),
                  child: Text(Strings.TITLE_MM_TB_VID)),
              Tab(icon: Icon(Icons.food_bank), child: Text(Strings.TITLE_MM_TB_BOJ)),
              Tab(icon: Icon(Icons.home), child: Text(Strings.TITLE_MM_TB_VAT)),
              Tab(icon: Icon(Icons.book), child: Text(Strings.TITLE_MM_TB_SAS)),
              Tab(icon: Icon(Icons.local_atm), child: Text(Strings.TITLE_MM_TB_KAI)),
              Tab(
                  icon: Icon(Icons.contact_support),
                  child: Text(Strings.TITLE_MM_TB_DPSR)),
              Tab(icon: Icon(Icons.ac_unit_outlined), child: Text(Strings.TITLE_MM_TB_FIRE)),
              Tab(icon: Icon(Icons.account_circle_sharp), child: Text(Strings.TITLE_MM_TB_STUDENT)),
              Tab(icon: Icon(Icons.account_balance_rounded),child: Text(Strings.TITLE_MM_TB_COLLEGE)),
              Tab(icon: Icon(Icons.account_balance_wallet_sharp),child: Text(Strings.TITLE_MM_TB_SUBJECT)),
            ],
          ),
          title: Center(
            child: Column(
              children: [
                Text(
                  Strings.DET_MM_TB_WEL + "KRCE User",
                ),
                Text(
                    greeting()
                ),
              ],
            ),
          ),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
             // Navigator.of(context).pop();
              onBackPressed();
            },
          ),
        ),
        body: TabBarView(
          children: [
            Family(),
            Work(),
            Health(),
            Education(),
            Food(),
            Housing(),
            Knowledge(),
            Charity(),
            AboutUs(),
            Ice(),
            Student(),
            College(),
            Subject(),
          ],
        ),
      ),
    );
  }

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return Strings.DET_MM_TB_GREET_MOR;
    }
    if (hour < 16) {
      return Strings.DET_MM_TB_GREET_NOON;
    }
    return Strings.DET_MM_TB_GREET_EVE;
  }
}
