import 'package:flutter/material.dart';
import 'package:mitane_frontend/agri_inputs/inputs.dart';
import 'package:mitane_frontend/agri_product/product.dart';
import 'package:mitane_frontend/machinery/screens/machinery_screen.dart';
import 'package:mitane_frontend/trending/screens/trending_screen.dart';
import 'package:mitane_frontend/models/price-model.dart';
import 'package:mitane_frontend/models/store-model.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/bottom_nav.dart';

import 'package:mitane_frontend/presentation/pages/farmer/home_page.dart';
import 'package:mitane_frontend/presentation/pages/custom_widgets/drawer.dart';
import 'package:mitane_frontend/priceHub/priceHub.dart';
import 'package:mitane_frontend/presentation/pages/common/splash/splash.dart';
import 'package:mitane_frontend/presentation/pages/farmer/store_screen.dart';
import 'package:mitane_frontend/models/price-model.dart';
import 'package:mitane_frontend/models/store-model.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  List<Widget> pages = [Home(), PriceHub(), StoreDisplay(items: [new Store("Banana", 80, 25), new Store("Banana", 80, 25), new Store("Banana", 80, 25), ],)];
  // List<Widget> pages = [Home(), PriceHub(), MachineryScreen()];
  int selectedPage = 0;
  @override
  void initState() {
    super.initState();
    selectedPage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            selectedPage = index;
          });
        },
        currentIndex: selectedPage,
        selectedItemColor: Colors.green,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.bar_chart,
              ),
              label: "Price Hub"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: "Service"),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}