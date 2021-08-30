import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mitane_frontend/presentation/pages/custome_widgets/drawer.dart';

class Home extends StatefulWidget {
  @override
  _Dashboard createState() {
    return _Dashboard();
  }
}

class _Dashboard extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: NavDrawer(),
      body: Container(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Card(
                color: Colors.green[200],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.thermostat,
                          color: Colors.grey[800],
                          size: 50.0,
                        ),
                        Container(
                          child: VerticalDivider(
                            color: Colors.black,
                            thickness: 1,
                            indent: 20,
                            endIndent: 20,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.cloud,
                                      color: Colors.white,
                                      size: 35,
                                    ),
                                    Column(
                                      children: [
                                        Text('Cloud',
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold)),
                                        Text('25' + " \u2103")
                                      ],
                                    ),
                                  ],
                                ),
                                Text(
                                  '25, June',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            ),
            Center(
                child: Wrap(spacing: 20, runSpacing: 20.0, children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 160.0,
                    height: 160.0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/inputs');
                      },
                      child: Card(
                          color: Colors.green[300],
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                FaIcon(
                                  FontAwesomeIcons.home,
                                  color: Colors.white,
                                  size: 50,
                                ),
                                Text(
                                  "Agricultural Inputs",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 160.0,
                    height: 160.0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/product');
                      },
                      child: Card(
                          color: Colors.green[300],
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                FaIcon(
                                  FontAwesomeIcons.home,
                                  color: Colors.white,
                                  size: 50,
                                ),
                                Text(
                                  "Agricultural Product",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 160.0,
                    height: 160.0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/machinery');
                      },
                      child: Card(
                          color: Colors.green[300],
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                FaIcon(
                                  FontAwesomeIcons.home,
                                  color: Colors.white,
                                  size: 50,
                                ),
                                Text(
                                  "Machinery",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                ],
              )
            ])),
          ],
        ),
      ),
    );
  }
}
