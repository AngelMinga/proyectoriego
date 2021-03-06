import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectoriego/Controller/provider_principal.dart';
import 'package:proyectoriego/View/page_cuidado.dart';
import 'package:proyectoriego/View/page_estadistica.dart';
import 'package:proyectoriego/View/page_huerto.dart';

import '../Util/global_color.dart';
import '../Util/global_widget.dart';

class PageNavigation extends StatelessWidget {
  static String routePage = 'viewHome';

  ProviderPrincipal? providerPrincipal;

  @override
  Widget build(BuildContext context) {
    providerPrincipal ??= Provider.of<ProviderPrincipal>(context);

    return Scaffold(
      backgroundColor: GlobalColor.colorPrincipal,
      appBar: AppBar(
        title: const Text(""),
        //backgroundColor: Colors.blue,
        shape: const Border(bottom: BorderSide(color: Colors.orange, width:1)),
        elevation: 4,
      ),
      drawer: GlobalWidget().drawerPrincipal(),
      body: SafeArea(
        child: PageView(
          controller: providerPrincipal!.pageController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            PageCuidado(),
            PageHureto(),
            PageEstadistica(),
          ],
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.reactCircle,
        color: Colors.black,
        activeColor: Colors.amber,
        items: const [
          TabItem(icon: Icons.flash_on_outlined, title: 'Cuidado'),
          TabItem(icon: Icons.night_shelter, title: 'Huerto'),
          TabItem(icon: Icons.balance, title: 'Estadisticas'),
        ],
        initialActiveIndex: providerPrincipal!.paginaActual,
        onTap: (int i) {
          print('indexItem $i');
          providerPrincipal!.paginaActual = i;
        },
      ),
    );
  }
}
