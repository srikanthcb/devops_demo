import 'package:flutter/material.dart';
import 'package:devops_demo/database/dao/services.dart';
import 'package:devops_demo/resources/texts/strings.dart';
import 'package:devops_demo/ui/views/detail_page.dart';

class Sports extends StatefulWidget {
  @override
  SportsState createState() => SportsState();
}

class SportsState extends State<Sports> {
  late List services;

  @override
  void initState() {
    services = getServices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(Services services) => ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.white24))),
            child: Icon(Icons.auto_awesome, color: Colors.white),
          ),
          title: Text(
            services.title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),


          subtitle: Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Container(
                    child: LinearProgressIndicator(
                        backgroundColor: Color.fromRGBO(0,225, 0, 0.3),
                        value: services.indicatorValue,
                        valueColor: AlwaysStoppedAnimation(Colors.green)),
                  )),
            ],
          ),
          trailing:
              Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(services: services)));
          },
        );

    Card makeCard(Services services) => Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
            child: makeListTile(services),
          ),
        );

    final makeBody = Container(
      // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: services.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(services[index]);
        },
      ),
    );

    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 225, 0, 0.3),
      body: makeBody,
    );
  }
}

List getServices() {
  return [
    Services(
      title: Strings.TITLE_DPSR_MNN,
      indicatorValue: 0.20,
    ),
    Services(
      title: Strings.TITLE_DPSR_JHY,
      indicatorValue: 0.40,
    ),
    Services(
      title: Strings.TITLE_DPSR_JH,
      indicatorValue: 0.60,
    ),
    Services(
      title: Strings.TITLE_DPSR_NHJ,
      indicatorValue: 0.80,
    ),
    Services(
      title: Strings.TITLE_DPSR_GGG,
      indicatorValue: 1.0,
    ),
  ];
}
