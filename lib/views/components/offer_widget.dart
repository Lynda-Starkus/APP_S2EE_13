import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:s2ee_new/backend%20architecture/models/Offre.dart';
import 'package:s2ee_new/config/colors.dart';
import 'package:s2ee_new/config/config.dart';
import 'package:s2ee_new/views/components/components.dart';

class OfferWidget extends StatelessWidget {
  @override
  final Offre? offer;
  OfferWidget({this.offer});
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
      child: Container(
        height: 180.0,
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(0.0),
              leading: CachedNetworkImage(
                fit: BoxFit.contain,
                height: 45,
                width: 45,
                imageUrl: offer!.logo!,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              title: Text(
                offer!.poste!,
                style: _textTheme.bodyText2!.apply(
                    fontWeightDelta: -2,
                    color: AppTheme.chooseColor(offer!.poste)),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4.0),
                  Text(
                    offer!.profile!,
                    style: _textTheme.subtitle1!.apply(fontWeightDelta: 3),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    offer!.nom!,
                    style: _textTheme.subtitle2!.apply(fontWeightDelta: 1),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Spacer(),
            Row(
              children: [
                CustomCircle(color: AppColors.teal, filled: false),
                CustomCircle(color: AppColors.blue),
                CustomCircle(color: AppColors.green, filled: false),
                CustomCircle(color: AppColors.white, filled: false),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: AppColors.teal,
                  ),
                  width: 120.0,
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "LOCATION",
                        style:
                            TextStyle(color: AppColors.white, fontSize: 14.0),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: AppColors.white,
                        size: 16.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
