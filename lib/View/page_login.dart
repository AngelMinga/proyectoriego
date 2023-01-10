import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:proyectoriego/Api/api_rest.dart';
import 'package:proyectoriego/Controller/provider_login.dart';
import 'package:proyectoriego/Util/global_preference.dart';
import 'package:proyectoriego/View/page_register.dart';

import '../Util/global_color.dart';

class PageLogin extends StatefulWidget {
  static String routePage = 'viewLogin';

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  ProviderLogin? providerLogin;

  @override
  Widget build(BuildContext context) {
    providerLogin ??= Provider.of<ProviderLogin>(context);

    return Scaffold(
      backgroundColor: GlobalColor.colorPrincipal,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            containerLogo(context),
            containerEmail(),
            containerPassword(),
            containerButtom(context),
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

  Widget containerEmail() {
    return Container(
      margin: const EdgeInsets.all(20),
      child: TextField(
          controller: providerLogin!.ediEmail,
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(),
          decoration: const InputDecoration(
            hintText: 'Correo',
            contentPadding: EdgeInsets.all(10),
            prefixIcon: Icon(Icons.email_outlined),
            fillColor: Colors.white,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
          )),
    );
  }

  Widget containerPassword() {
    return Container(
      margin: const EdgeInsets.all(20),
      child: TextField(
          controller: providerLogin!.ediPassword,
          keyboardType: TextInputType.visiblePassword,
          style: const TextStyle(),
          decoration: const InputDecoration(
            hintText: 'Clave',
            contentPadding: EdgeInsets.all(10),
            prefixIcon: Icon(Icons.password),
            fillColor: Colors.white,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
          )),
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
                ApiRest().login(
                    context,  providerLogin!.ediEmail.text.trim(),providerLogin!.ediPassword.text.trim(), (t, data) {
                      if(t == 1){

                      }
                });
              },
              child: const Text(
                'INICIAR SESIÓN',
                style: TextStyle(color: GlobalColor.colorPrincipal, fontSize: 20),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
/*          SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
              onPressed: () {
                Navigator.of(context).pushNamed(PageRegister.routePage);
*//*                ApiRest().getUser(
                    context, (t, data) {
                  if(t == 1){

                  }
                });*//*
              },
              child: const Text(
                'REGISTRATE',
                style: TextStyle(color: GlobalColor.colorPrincipal, fontSize: 20),
              ),
            ),
          )*/
        ],
      ),
    );
  }
}
