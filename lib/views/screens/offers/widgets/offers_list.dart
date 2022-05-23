import 'package:flutter/material.dart';
import 'package:s2ee_new/config/constants.dart';
import 'package:s2ee_new/views/components/components.dart';

class OffersListWidget extends StatelessWidget {
  final String? tag;
  OffersListWidget({this.tag});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
        children: List.generate(
          AppConstats.offersType.length,
          (i) => LabeledKeySpan(
            label: AppConstats.offersType[i].label,
            color: AppConstats.offersType[i].color,
            labelColor: AppConstats.offersType[i].labelColor,
            prefixIcon: AppConstats.offersType[i].prefixIcon,
            tag: tag,
          ),
        ),
      ),
    );
  }
}
