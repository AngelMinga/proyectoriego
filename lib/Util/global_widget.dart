import 'package:flutter/material.dart';

class GlobalWidget {
  Widget textTitle(String text) {
    return Text(
      text,
      style: const TextStyle(fontFamily: 'semibold', fontWeight: FontWeight.bold, fontSize: 28),
    );
  }

  messageAlert(BuildContext context, String message) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.fixed,
      duration: const Duration(seconds: 3),
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.black,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> AlertSimpleMessage(BuildContext context, String title, String msj, VoidCallback callBack, {bool dismissible = false}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: WillPopScope(
            onWillPop: () => Future.value(dismissible),
            child: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                    msj,
                    style: NormalStyle(size: 18.0),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('ACEPTAR'),
              onPressed: () {
                Navigator.of(context).pop();
                callBack();
              },
            ),
          ],
        );
      },
    );
  }

  Widget drawerPrincipal() {
    return Drawer(
      // Agrega un ListView al drawer. Esto asegura que el usuario pueda desplazarse
      // a través de las opciones en el Drawer si no hay suficiente espacio vertical
      // para adaptarse a todo.
      child: ListView(
        // Importante: elimine cualquier padding del ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              // Actualiza el estado de la aplicación
              // ...
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              // Actualiza el estado de la aplicación
              // ...
            },
          ),
        ],
      ),
    );
  }
}

class NormalStyle extends TextStyle {
  final double size;
  final Color color;
  final bool bold;

  const NormalStyle({this.color = Colors.black, this.size = 16, this.bold = false})
      : super(
          color: color,
          fontSize: size,
          fontFamily: 'visby',
          fontWeight: bold ? FontWeight.bold : null,
        );
}
