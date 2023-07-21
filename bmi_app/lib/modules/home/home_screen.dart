import 'dart:math';

import 'package:bmi_app/helper/constants.dart';
import 'package:bmi_app/modules/result/result_screen.dart';
import 'package:bmi_app/res/colors.dart';
import 'package:bmi_app/res/fontsize.dart';
import 'package:bmi_app/res/images.dart';
import 'package:bmi_app/res/strings.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double sliderRes = 173.0;
  int weight = 71;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: const Text(AppStrings.appBarText),
      ),
      body: Column(
        children: [
          maleAndFemale(),
          mySlider(),
          weightAndAge(),
        ],
      ),
      bottomNavigationBar: calcButton(),
    );
  }

  int equ() {
    var res = weight.toInt() / pow(sliderRes.toInt() / 100, 2);
    return res.toInt();
  }

  Widget calcButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          finalRes = equ();
          finalResForAge = age;
          finalResForHeight = sliderRes;
          finalResForWeight = weight;
        });
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ResultScreen(),
          ),
        );
      },
      child: Container(
        height: 60,
        color: AppColors.myRed,
        child: const Center(
          child: Text(
            AppStrings.calculate,
            style: TextStyle(
              color: AppColors.myWhit,
              fontSize: AppFontSize.fSize24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget weightAndAge() => Row(
        children: [
          myCardWithLogicForWeight(),
          myCardWithLogicForAge(),
        ],
      );
  Widget maleAndFemale() => Row(
        children: [
          myCard(
            AppImages.maleImage,
            AppStrings.male,
          ),
          myCard(
            AppImages.femaleImage,
            AppStrings.female,
          ),
        ],
      );
  Widget mySlider() => Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.cardColor,
            borderRadius: BorderRadius.circular(5),
          ),
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                AppStrings.height,
                style: TextStyle(
                  color: AppColors.myWhit,
                  fontSize: AppFontSize.fSize12,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    sliderRes.toStringAsFixed(2),
                    style: const TextStyle(
                      color: AppColors.myWhit,
                      fontSize: AppFontSize.fSize40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    AppStrings.cm,
                    style: TextStyle(
                      color: AppColors.myWhit,
                      fontSize: AppFontSize.fSize12,
                    ),
                  ),
                ],
              ),
              Slider(
                thumbColor: AppColors.myRed,
                activeColor: AppColors.myWhit,
                inactiveColor: AppColors.myGrey,
                min: 100,
                max: 220,
                value: sliderRes,
                onChanged: (val) {
                  setState(() {
                    sliderRes = val;
                  });
                },
              ),
            ],
          ),
        ),
      );

  Widget myCard(String myImage, String myText) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColors.cardColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                myImage,
                width: 50,
                height: 50,
                color: AppColors.myWhit,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                myText,
                style: const TextStyle(
                  fontSize: AppFontSize.fSize24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.myWhit,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget myCardWithLogicForWeight() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColors.cardColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Weight",
                style: TextStyle(
                  fontSize: AppFontSize.fSize24,
                  color: AppColors.myGrey,
                ),
              ),
              Text(
                weight.toString(),
                style: const TextStyle(
                  fontSize: AppFontSize.fSize40,
                  fontWeight: FontWeight.bold,
                  color: AppColors.myWhit,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    heroTag: "IncreaseWeight",
                    mini: true,
                    backgroundColor: AppColors.myGrey,
                    foregroundColor: AppColors.myWhit,
                    child: const Icon(
                      Icons.add,
                    ),
                    onPressed: () {
                      setState(() {
                        weight = ++weight;
                      });
                    },
                  ),
                  FloatingActionButton(
                    heroTag: "DecreaseWeight",
                    mini: true,
                    backgroundColor: AppColors.myGrey,
                    foregroundColor: AppColors.myWhit,
                    child: const Icon(
                      Icons.remove,
                    ),
                    onPressed: () {
                      setState(() {
                        weight = --weight;
                      });
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget myCardWithLogicForAge() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColors.cardColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Age",
                style: TextStyle(
                  fontSize: AppFontSize.fSize24,
                  color: AppColors.myGrey,
                ),
              ),
              Text(
                age.toString(),
                style: const TextStyle(
                  fontSize: AppFontSize.fSize40,
                  fontWeight: FontWeight.bold,
                  color: AppColors.myWhit,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    heroTag: "IncreaseAge",
                    mini: true,
                    backgroundColor: AppColors.myGrey,
                    foregroundColor: AppColors.myWhit,
                    child: const Icon(
                      Icons.add,
                    ),
                    onPressed: () {
                      setState(() {
                        age = ++age;
                      });
                    },
                  ),
                  FloatingActionButton(
                    heroTag: "DecreaseAge",
                    mini: true,
                    backgroundColor: AppColors.myGrey,
                    foregroundColor: AppColors.myWhit,
                    child: const Icon(
                      Icons.remove,
                    ),
                    onPressed: () {
                      setState(() {
                        age = --age;
                      });
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
