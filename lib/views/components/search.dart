import 'package:flutter/material.dart';
import 'package:s2ee_new/config/colors.dart';
import 'package:s2ee_new/config/icons.dart';
import 'package:s2ee_new/views/routes/routes_name.dart';
import 'package:s2ee_new/views/screens/Search/search_screen.dart';

/// Search Widget with onChanged function instead of using TextEditingController
/// Note : the fill color must be from the class [AppColors]
class SearchWidget extends StatelessWidget {
  final String? hint;
  final Color fillColor;
  final bool hasSuffixIcon;
  final String? tage;
  const SearchWidget({
    this.hint,
    this.fillColor = AppColors.black,
    this.hasSuffixIcon = true,
    this.tage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Stack(
        children: [
          TextField(
            readOnly: true,
            onTap: () =>
                showSearch(context: context, delegate: Search(tag: tage)),
            style: TextStyle(
              color: fillColor == AppColors.black
                  ? AppColors.white
                  : AppColors.black,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: fillColor,
              hintText: hint,
              prefixIcon:
                  Icon(Icons.search, color: AppColors.white, size: 30.0),
            ),
          ),
          hasSuffixIcon
              ? Positioned(
                  top: 4.0,
                  right: 2.0,
                  child: IconButton(
                    icon: Icon(AppIcons.notification, color: AppColors.white),
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.notifications),
                  ),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
