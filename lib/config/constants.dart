import 'package:flutter/material.dart';
import 'package:s2ee_new/config/colors.dart';

class AppConstats {
  AppConstats._();

  static final List<KeyValue> intershipTypes = [
    KeyValue(
      label: 'Stage ouvrier',
      labelColor: AppColors.black,
      color: AppColors.teal,
      prefixIcon: Icons.dashboard_sharp,
    ),
    KeyValue(
      label: 'Emploi',
      labelColor: AppColors.black,
      color: AppColors.blue,
      prefixIcon: Icons.attach_money,
    ),
    KeyValue(
      label: 'PFE',
      labelColor: AppColors.black,
      color: AppColors.green,
      prefixIcon: Icons.local_taxi_outlined,
    ),
    KeyValue(
      label: 'Stage pratique',
      labelColor: AppColors.black,
      color: AppColors.white,
      prefixIcon: Icons.home_work_outlined,
    ),
  ];

  static final List<KeyValue> companiesType = [
    KeyValue(
      label: 'Consulting',
      color: AppColors.white,
      prefixIcon: Icons.dashboard_sharp,
    ),
    KeyValue(
      label: 'Bank',
      color: AppColors.white,
      prefixIcon: Icons.attach_money,
    ),
    KeyValue(
      label: 'VTCs',
      color: AppColors.white,
      prefixIcon: Icons.local_taxi_outlined,
    ),
    KeyValue(
      label: 'Agence',
      color: AppColors.white,
      prefixIcon: Icons.home_work_outlined,
    ),
  ];

  static final List<KeyValue> offersType = [
    KeyValue(
      label: 'Development',
      color: AppColors.white,
      prefixIcon: Icons.code,
    ),
    KeyValue(
      label: 'Graphic Design',
      color: AppColors.white,
      prefixIcon: Icons.design_services,
    ),
    KeyValue(
      label: 'Data Analysis',
      color: AppColors.white,
      prefixIcon: Icons.data_usage,
    ),
    KeyValue(
      label: 'UI/UX',
      color: AppColors.white,
      prefixIcon: Icons.design_services_outlined,
    ),
  ];
}

class KeyValue {
  final Function? onSpanPressed;
  final Color color;
  final String label;
  final IconData prefixIcon;
  final Color labelColor;

  const KeyValue({
    required this.label,
    required this.color,
    required this.prefixIcon,
    this.labelColor = AppColors.black,
    this.onSpanPressed,
  });
}
