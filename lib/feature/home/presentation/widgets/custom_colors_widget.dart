import 'package:flutter/material.dart';

class CustomColorsWidget extends StatelessWidget {
  const CustomColorsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = [
      Color(0xffF5E3DF),
      Color(0xffECECEC),
      Color(0xffE4F2DF),
      Color(0xffD5E0ED),
      Color(0xff3E3D40),
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        5,
        (index) => Container(
          width: 61,
          height: 41,
          margin: EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            color: colors[index],
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
