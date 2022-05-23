import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:s2ee_new/backend%20architecture/database_managment.dart';

import 'package:s2ee_new/config/assets.dart';
import 'package:s2ee_new/config/config.dart';
import 'package:s2ee_new/views/routes/routes_name.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController _textcontroller = TextEditingController();
  @override
  Data _data = new Data();
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Image.asset(
                AppAssets.background_login,
                fit: BoxFit.cover,
                height: _size.height,
                width: _size.width,
              ),
            ),

            /// Body
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 16.0),
              child: SizedBox(
                height: _size.height - 100.0,
                width: _size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    /// s2ee logo
                    SvgPicture.asset(AppAssets.s2ee),

                    ///email input
                    Column(
                      children: [
                        buildEmail(context),
                        const SizedBox(height: 60.0),

                        ///login button
                        SizedBox(
                          width: double.maxFinite,
                          child: RaisedButton(
                              child: Text("SE CONNECTER"),
                              textColor: Colors.white,
                              onPressed: () async {
                                dynamic result =
                                    _data.signInwithEmail(_textcontroller.text);
                                if (result != null) {
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      AppRoutes.home, (route) => false);
                                }
                              }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildEmail(BuildContext context) {
    final _border = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 1.0),
    );
    return TextFormField(
      controller: _textcontroller,
      decoration: InputDecoration(
        hintText: "Email",
        hintStyle: TextStyle(color: Colors.white),
        filled: false,
        prefixIcon: Icon(AppIcons.email, color: Colors.white),
        contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
        enabledBorder: _border,
        border: _border,
        focusedBorder: _border,
        disabledBorder: _border,
      ),
    );
  }
}
