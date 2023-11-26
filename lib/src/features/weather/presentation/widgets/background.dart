import 'package:flutter/material.dart';
import 'package:weather_app/src/core/constants/constants.dart';

class PageBackground extends StatelessWidget {
  const PageBackground({super.key, required this.children});
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(decoration: AppDecoration.background),
          // todo:
          // const UITestFrame(),
          ...children
        ],
      ),
    );
  }
}

class UITestFrame extends StatelessWidget {
  const UITestFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(child: Container(color: AppColor.card)),
              Expanded(child: Container(color: AppColor.black)),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(child: Container(color: AppColor.black)),
              Expanded(child: Container(color: AppColor.card)),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(child: Container(color: AppColor.card)),
              Expanded(child: Container(color: AppColor.black)),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(child: Container(color: AppColor.black)),
              Expanded(child: Container(color: AppColor.card)),
            ],
          ),
        ),
      ],
    );
  }
}
