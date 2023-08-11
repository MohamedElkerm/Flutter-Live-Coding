import 'package:flutter/material.dart';
import 'package:gold_app/helper/global_var.dart';
import 'package:gold_app/helper/remote/dio_helper.dart';
import 'package:gold_app/models/gold_model.dart';
import 'package:gold_app/modules/gold_screen.dart';
import 'package:gold_app/modules/silver_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BottomNavigationBarItem> myItems = [
    BottomNavigationBarItem(icon: Icon(Icons.add), label: "Gold"),
    BottomNavigationBarItem(icon: Icon(Icons.add), label: "Silver"),
  ];

  List<Widget> myScreens = [
    GoldScreen(),
    SilverScreen(),
  ];

  late MetalModel goldModel;
  late MetalModel silverModel;

  @override
  void initState() {
    DioHelper.getData(
      path: "XAG/EGP",
    ).then((value) {
      silverModel = MetalModel.fromJson(json: value.data);
      setState(() {
        silverPrice = silverModel.price;
      });
      print(silverModel.price);
    }).catchError((err) {
      print(err.toString());
    });
    DioHelper.getData(
      path: "XAU/EGP",
    ).then((value) {
      goldModel = MetalModel.fromJson(json: value.data);
      setState(() {
        goldPrice = goldModel.price;
      });
      print(goldModel.price);
    }).catchError((err) {
      print(err.toString());
    });
    super.initState();
  }

  int curIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: myScreens[curIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: myItems,
        currentIndex: curIndex,
        onTap: (index) {
          setState(() {
            curIndex = index;
          });
        },
      ),
    );
  }
}
