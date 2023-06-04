import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectoriego/Api/api_rest.dart';
import 'package:proyectoriego/Controller/provider_register.dart';
import 'package:proyectoriego/Util/global_color.dart';

import '../Util/mqttResponse.dart';

class PageHuerto extends StatelessWidget {
  static const routePage = 'viewCuidado';
  ProviderRegister? providerRegister;

  @override
  Widget build(BuildContext context) {
    providerRegister ??= Provider.of<ProviderRegister>(context);

    return Scaffold(
      backgroundColor: GlobalColor.colorWithe,
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(flex: 0, child: containerLogo(context)),
              Expanded(flex: 1, child: containerButtom(context)),
              const Expanded(flex: 0,child: Text('Terminos y condiciones'))
            ],
          )),
    );
  }

  Widget containerLogo(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 20,),
        Image(
          image: AssetImage('assets/image/logounl.jpeg'),
          width: 150,
          /* errorBuilder: (context, _, __) async {
            return Image.asset('assets/image/logo.png')
          },*/
        ),
        Text(
          'Riego UNL',
          style: TextStyle(
              fontSize: 60,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'logo'),
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
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              onPressed: () {
                ///MqttHandler().publishMessage('0');
                MqttHandler().initMqtt('1');
                /*ApiRest().encenderRele(context, (t, data) {

                });*/
              },
              child: const Text(
                'ENCENDER',
                style:
                    TextStyle(color: GlobalColor.colorPrincipal, fontSize: 20),
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
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              onPressed: () {
                MqttHandler().initMqtt('0');
                /* ApiRest().encenderRele(context, (t, data) {

                });*/
              },
              child: const Text(
                'APAGAR',
                style:
                    TextStyle(color: GlobalColor.colorPrincipal, fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
