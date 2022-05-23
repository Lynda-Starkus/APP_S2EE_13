import 'package:flutter/material.dart';
import 'package:s2ee_new/config/colors.dart';
import 'package:s2ee_new/config/icons.dart';
import 'package:s2ee_new/views/screens/notification/widgets/notification_widget.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            ///App Bar
            SliverAppBar(
              snap: true,
              floating: true,
              backgroundColor: AppColors.blackDeep,
              leading: SizedBox.shrink(),
              bottom: PreferredSize(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: ListTile(
                    leading: IconButton(
                      icon: Icon(AppIcons.back,
                          color: AppColors.white, size: 16.0),
                      onPressed: () => Navigator.maybePop(context),
                    ),
                    title: Text(
                      "Notifications",
                      style: Theme.of(context).textTheme.button,
                    ),
                  ),
                ),
                preferredSize: Size.fromHeight(40.0),
              ),
            ),

            ///Notification List
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const SizedBox(height: 16.0),
                  ...List.generate(
                    6,
                    (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: NotificationWidget(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
