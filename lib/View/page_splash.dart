import 'package:flutter/material.dart';
import 'package:proyectoriego/Util/global_color.dart';
import 'package:proyectoriego/Util/global_preference.dart';
import 'package:proyectoriego/View/page_navigation.dart';
import 'package:proyectoriego/View/page_login.dart';

class PageSplash extends StatelessWidget {
  static String routePage = 'viewSplash';

  const PageSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 2000), () {
      GlobalPreference.getStateLogin().then((value) {
        value ? Navigator.of(context).pushNamedAndRemoveUntil(PageLogin.routePage, (Route<dynamic> route) => route.isFirst) : Navigator.of(context).pushNamedAndRemoveUntil(PageNavigation.routePage, (Route<dynamic> route) => route.isFirst);
      });
    });

    return Scaffold(
      backgroundColor: GlobalColor.colorPrincipal,
      body: SafeArea(
        child: containerLogo(context),
      ),
    );
  }

  Widget containerLogo(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Image(
          image: AssetImage('assets/image/riego1.png'),
          width: 150,
        ),
        Center(
            child: Text(
          'Riego App',
          style: TextStyle(fontSize: 60, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'logo'),
        )),
      ],
    );
  }
}
