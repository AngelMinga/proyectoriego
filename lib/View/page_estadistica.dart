import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectoriego/Util/mqttResponse.dart';

class PageEstadistica extends StatefulWidget {
  static const routePage = 'viewEstadistica';

  @override
  State<PageEstadistica> createState() => _PageEstadisticaState();
}

class _PageEstadisticaState extends State<PageEstadistica> {
  late MqttHandler mqttHandler;

  @override
  Widget build(BuildContext context) {
    mqttHandler = Provider.of<MqttHandler>(context);

    if(mqttHandler != null){
      log("ERROR   <<<<  MQTT NULLLLLLLL");
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Topic', style: TextStyle(fontFamily: 'semibold'))
      ),
      // backgroundColor: Colors.green,
      body: SafeArea(
        child: Column(
          children: [
            MyWidget()
           /* ListView.builder(
              shrinkWrap: true,
              //controller: mqttHandler!.listScrollController,
              itemCount: mqttHandler.listTopicNew.value.length,
              // itemCount: mqttHandler.listN.length,
              itemBuilder: (_, index) {
                // var topic = mqttHandler.listTopic[index];
                print('ERROR  ${index}');

                return Center(
                  child: Text("YUkas gay   $index"),
                );
*//*
                return Container(
                  color: Colors.black12,
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${topic.topic}',
                        style: const TextStyle(fontSize: 15),
                      ),
                      Text(
                        '${topic.data}',
                        style: const TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                );
*//*
              },
            ),*/
          ],
        ),
      ),
    );
  }
}
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MqttHandler>(
      create: (context) => MqttHandler(),
      builder: (context, child) {
        final mqttHandler = Provider.of<MqttHandler>(context);

        return ListView.builder(
            shrinkWrap: true,
            itemCount: mqttHandler.listTopic.length,
            itemBuilder: (context, index) {
              final topic = mqttHandler.listTopic[index];

              return ListTile(
                title: Text(topic.data.toString()),
                subtitle: Text(topic.data.toString()),
              );
            },
          );
      },
    );
  }
}
