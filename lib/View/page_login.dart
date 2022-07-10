import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectoriego/Controller/provider_login.dart';
import 'package:proyectoriego/View/page_register.dart';
import '../Util/global_color.dart';

class PageLogin extends StatelessWidget {
  static String routePage = 'viewLogin';

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
            containerPhone(),
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
          'Riego App',
          style: TextStyle(fontSize: 60, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'logo'),
        ),
      ],
    );
  }

  Widget containerPhone() {
    return Container(
      margin: const EdgeInsets.all(20),
      child: TextField(
          controller: providerLogin!.ediCell,
          keyboardType: TextInputType.number,
          style: const TextStyle(),
          decoration: const InputDecoration(
            hintText: 'Celular',
            contentPadding: EdgeInsets.all(10),
            prefixIcon: Icon(Icons.phone_android),
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
/*                ApiRest().loginUser(
                    context, providerLogin!.ediCell.text.trim(), (t, data) {
                      if(t == 1){
                        providerLogin!.ediCell.clear();
                        GlobalWidget().messageAlert(context, data);
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            PageChat.routePage,
                            (Route<dynamic> route) => route.isFirst);
                      }
                });*/
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
          SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
              onPressed: () {
                Navigator.of(context).pushNamed(PageRegister.routePage);
              },
              child: const Text(
                'REGISTRATE',
                style: TextStyle(color: GlobalColor.colorPrincipal, fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
