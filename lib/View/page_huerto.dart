import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectoriego/Controller/provider_register.dart';

class PageHureto extends StatelessWidget {
  static const routePage = 'viewCuidado';
  ProviderRegister? providerRegister;

  @override
  Widget build(BuildContext context) {
    providerRegister ??= Provider.of<ProviderRegister>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: const [
                Center(
                  child: Text("Huerto"),
                )
              ],
            ),
          )),
    );
  }
}