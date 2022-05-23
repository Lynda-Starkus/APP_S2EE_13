import 'package:flutter/material.dart';
import 'package:s2ee_new/config/constants.dart';
import 'package:s2ee_new/views/components/components.dart';

class CompaniesListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
        children: List.generate(
          AppConstats.companiesType.length,
          (i) => LabeledKeySpan(
            label: AppConstats.companiesType[i].label,
            color: AppConstats.companiesType[i].color,
            labelColor: AppConstats.companiesType[i].labelColor,
            prefixIcon: AppConstats.companiesType[i].prefixIcon,
            tag: '',
          ),
        ),
      ),
    );
  }
}
