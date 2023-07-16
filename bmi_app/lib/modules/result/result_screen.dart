import 'package:bmi_app/helper/constants.dart';
import 'package:bmi_app/res/colors.dart';
import 'package:bmi_app/res/fontsize.dart';
import 'package:bmi_app/res/strings.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  List<String> resStrings = [
    'low',
    'Normal',
    'high',
  ];

  List<String> resStrings2 = [
    'You have normal body weight',
    'You don\'t have normal body weight',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          AppStrings.appBarTextResult,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              AppStrings.res,
              style: TextStyle(
                  color: AppColors.myWhit,
                  fontSize: AppFontSize.fSize40,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: double.infinity,
                height: 500,
                decoration: BoxDecoration(
                  color: AppColors.cardColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Text(
                        firstText(),
                        style: const TextStyle(
                          color: AppColors.myGreen,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      finalRes.toString(),
                      style: const TextStyle(
                          fontSize: 100,
                          color: AppColors.myWhit,
                          fontWeight: FontWeight.bold),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(25.0),
                      child: Text(
                        AppStrings.normalRange,
                        style: TextStyle(
                          color: AppColors.myWhit,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Text(
                      AppStrings.normalRange2,
                      style: TextStyle(
                        color: AppColors.myWhit,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text(
                        secondText(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppColors.myWhit,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: resButton(),
    );
  }

  String firstText() {
    if (finalRes >= 18 && finalRes < 25) {
      return resStrings[1];
    }
    if (finalRes < 18) {
      return resStrings[0];
    }
    if (finalRes > 25) {
      return resStrings[2];
    }
    return '';
  }

  String secondText() {
    if (finalRes >= 18 && finalRes < 25) {
      return resStrings2[0];
    }
    if (finalRes < 18) {
      return resStrings[1];
    }
    if (finalRes > 25) {
      return resStrings[2];
    }
    return '';
  }

  Widget resButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          finalRes = 0;
          finalResForAge = 0;
          finalResForHeight = 0;
          finalResForWeight = 0;
        });
        Navigator.pop(context);
      },
      child: Container(
        height: 60,
        color: AppColors.myRed,
        child: const Center(
          child: Text(
            AppStrings.recalculate,
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
}
