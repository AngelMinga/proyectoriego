import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectoriego/Api/api_rest.dart';
import 'package:proyectoriego/Controller/provider_register.dart';
import 'package:proyectoriego/Util/global_color.dart';

import '../Util/global_widget.dart';
import '../Util/mqttResponse.dart';

class PageHuerto extends StatefulWidget {
  static const routePage = 'viewCuidado';

  @override
  State<PageHuerto> createState() => _PageHuertoState();
}

class _PageHuertoState extends State<PageHuerto> {
  ProviderRegister? providerRegister;

  MqttHandler? mqttHandler;
  GlobalKey<ScaffoldState>? scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    //mqttHandler ??= Provider.of<MqttHandler>(context,listen: false);
    MqttHandler().initMqtt('0');
  }

  @override
  Widget build(BuildContext context) {
    providerRegister ??= Provider.of<ProviderRegister>(context);
    mqttHandler ??= Provider.of<MqttHandler>(context);


    return Scaffold(
      backgroundColor: GlobalColor.colorWithe,
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text("Riego UNL",style: TextStyle(color: Colors.white),),
        backgroundColor: GlobalColor.colorPrincipal,
        shape: const Border(bottom: BorderSide(color: Colors.white, width:1)),
        elevation: 4,
        leading: IconButton(
          icon: const Icon(Icons.menu,color: Colors.white,),
          onPressed: (){
            scaffoldKey!.currentState!.openDrawer();
          },
        ),
      ),
      drawer: GlobalWidget().drawerPrincipal(context),

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
          //if(mqttHandler!.statusButtonEncender)
          SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
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
          //if(mqttHandler!.statusButtonCancel)
          SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
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
