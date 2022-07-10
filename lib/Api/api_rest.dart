import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:proyectoriego/Util/global_text.dart';
import 'package:proyectoriego/Util/global_widget.dart';

class ApiRest {
  Dio dio = Dio();

  Future encenderRele(BuildContext? context, VoidCallback? Function(int? t, dynamic data) callback) async {
    const url = '${GlobalText.urlServerIot}on';
    try {
      final response = await dio.get(url);
      print('respuesta registro >>>> $response');
      if (response.data != null) {
        GlobalWidget().messageAlert(context!,"Prendido");
      }
    } catch (e) {
      print('ERROR REGISTRO');
    }
  }
  Future apagarRele(BuildContext? context, VoidCallback? Function(int? t, dynamic data) callback) async {
    const url = '${GlobalText.urlServerIot}off';
    try {
      final response = await dio.get(url);
      print('respuesta registro >>>> $response');
      if (response.data != null) {
        GlobalWidget().messageAlert(context!,"Apagado");
      }
    } catch (e) {
      print('ERROR REGISTRO');
    }
  }
}
