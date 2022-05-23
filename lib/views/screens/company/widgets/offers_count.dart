import 'package:flutter/material.dart';
import 'package:s2ee_new/backend%20architecture/models/Entreprise.dart';
import 'package:s2ee_new/config/config.dart';
import 'package:s2ee_new/views/components/circle.dart';

import 'filled_circle.dart';

class OffersCountWidget extends StatelessWidget {
  final Entreprise? entreprise;
  OffersCountWidget({this.entreprise});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
        child: Column(
          children: [
            /// count stats
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilledCircle(
                  color: AppColors.teal,
                  text: entreprise!.ouvrier.toString(),
                  filled: true,
                ),
                FilledCircle(
                  color: AppColors.blue,
                  text: entreprise!.pfe.toString(),
                  filled: true,
                ),
                FilledCircle(
                  color: AppColors.green,
                  text: entreprise!.pratique.toString(),
                ),
                FilledCircle(
                  color: AppColors.white,
                  text: entreprise!.emploi.toString(),
                ),
              ],
            ),
            const SizedBox(height: 30.0),

            /// stats description
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomCircle(color: AppColors.teal),
                        Text("Stage Ouvrier",
                            style: TextStyle(color: AppColors.teal)),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      children: [
                        CustomCircle(color: AppColors.blue),
                        Text("Stage PFE",
                            style: TextStyle(color: AppColors.blue))
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomCircle(color: AppColors.green),
                        Text("Stage Pratique",
                            style: TextStyle(color: AppColors.green))
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      children: [CustomCircle(), Text("Emploi")],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
