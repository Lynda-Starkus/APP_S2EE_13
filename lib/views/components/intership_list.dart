import 'package:flutter/material.dart';
import 'package:s2ee_new/config/constants.dart';
import 'package:s2ee_new/views/components/components.dart';

class IntershipListWidget extends StatelessWidget {
  final String? tag;
  IntershipListWidget({this.tag});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        children: List.generate(
          AppConstats.intershipTypes.length,
          (i) => LabeledKeySpan(
            label: AppConstats.intershipTypes[i].label,
            color: AppConstats.intershipTypes[i].color,
            labelColor: AppConstats.intershipTypes[i].labelColor,
            prefixIcon: AppConstats.intershipTypes[i].prefixIcon,
            tag: tag,
          ),
        ),
      ),
    );
  }
}
