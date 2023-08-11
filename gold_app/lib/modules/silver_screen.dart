import 'package:flutter/material.dart';
import 'package:gold_app/helper/global_var.dart';

class SilverScreen extends StatefulWidget {
  const SilverScreen({super.key});

  @override
  State<SilverScreen> createState() => _SilverScreenState();
}

class _SilverScreenState extends State<SilverScreen> {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Silver"
          ),
          Text(
            silverPrice.toString()
          ),
        ],
      ),
    );
  }
}