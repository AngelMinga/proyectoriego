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
