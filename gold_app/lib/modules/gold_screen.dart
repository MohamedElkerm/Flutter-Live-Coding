import 'package:flutter/material.dart';
import 'package:gold_app/helper/global_var.dart';
import 'package:gold_app/helper/remote/dio_helper.dart';

import '../models/gold_model.dart';

class GoldScreen extends StatefulWidget {
  const GoldScreen({super.key});

  @override
  State<GoldScreen> createState() => _GoldScreenState();
}

class _GoldScreenState extends State<GoldScreen> {

 MetalModel? goldModel;
  @override
  void initState() {
 DioHelper.getData(
      path: "XAU/EGP",
    ).then((value) {
      goldModel = MetalModel.fromJson(json: value.data);
      setState(() {
        goldPrice = goldModel!.price;
      });
    }).catchError((err) {
      print(err.toString());
    });    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      goldPrice;
    });
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Gold"
          ),
          Text(
            goldPrice.toString()
          ),
        ],
      ),
    );
  }
}