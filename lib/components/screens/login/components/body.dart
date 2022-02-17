import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:mbo/components/controllers/auth_controller.dart';
import 'package:mbo/components/screens/login/components/background.dart';
import 'package:mbo/components/widgets/common/common.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: GetBuilder<AuthController>(
      builder: (controller) => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/logo/logo-fit.png",
              width: size.width * 0.5,
              fit: BoxFit.fitWidth,
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            // Text(
            //   "Đăng nhập",
            //   style: TextStyle(fontWeight: FontWeight.bold),
            // ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedInputField(
              hintText: "Tài khoản",
              onChanged: (value) {
                controller.setUser(value);
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                controller.setPassword(value);
              },
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            RoundedButton(
              text: "Đăng nhập",
              press: controller.login,
            ),
          ],
        ),
      ),
    ));
  }
}
