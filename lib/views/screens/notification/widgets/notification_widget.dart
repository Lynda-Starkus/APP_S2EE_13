import 'package:flutter/material.dart';
import 'package:s2ee_new/config/assets.dart';
import 'package:s2ee_new/config/colors.dart';
import 'package:s2ee_new/config/icons.dart';

class NotificationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
        // height: 180.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(0.0),
              leading: Container(
                height: 60.0,
                width: 60.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.black,
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage(AppAssets.notification),
                  ),
                ),
              ),
              trailing: CircleAvatar(
                radius: 16.0,
                backgroundColor: AppColors.teal,
                child: Icon(AppIcons.close, color: AppColors.white, size: 14.0),
              ),
              title: Text(
                "Liste des Sponsors publiée !",
                style: Theme.of(context).textTheme.bodyText2,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text(
                  'Checkez nos réseaux sociaux pour plus de détails ...',
                  style: Theme.of(context).textTheme.caption!.apply(
                        fontSizeDelta: 3,
                      ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ),
            ),
            // RaisedButton(
            //   onPressed: () {},
            //   padding: const EdgeInsets.all(0.0),
            //   child: Text('data'),
            // ),
          ],
        ),
      ),
    );
  }
}
