import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectoriego/Api/api_rest.dart';
import 'package:proyectoriego/Controller/provider_register.dart';
import 'package:proyectoriego/Util/global_color.dart';

class PageHureto extends StatelessWidget {
  static const routePage = 'viewCuidado';
  ProviderRegister? providerRegister;

  @override
  Widget build(BuildContext context) {
    providerRegister ??= Provider.of<ProviderRegister>(context);

    return Scaffold(
      backgroundColor: GlobalColor.colorPrincipal,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            containerLogo(context), containerButtom(context)
          ],
        ),
      )),
    );
  }

  Widget containerLogo(BuildContext context) {
    return Column(
      children: const [
        Image(
          image: AssetImage('assets/image/riego1.png'),
          width: 150,
          /* errorBuilder: (context, _, __) async {
            return Image.asset('assets/image/logo.png')
          },*/
        ),
        Text(
          'Demeter',
          style: TextStyle(fontSize: 60, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'logo'),
        ),
      ],
    );
  }

  Widget containerButtom(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
              onPressed: () {
                ApiRest().encenderRele(context, (t, data) {

                });
              },
              child: const Text(
                'ENCENDER',
                style: TextStyle(color: GlobalColor.colorPrincipal, fontSize: 20),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
              onPressed: () {
                ApiRest().encenderRele(context, (t, data) {

                });
              },
              child: const Text(
                'APAGAR',
                style: TextStyle(color: GlobalColor.colorPrincipal, fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
