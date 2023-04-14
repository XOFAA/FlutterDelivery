import 'package:delivery/pages/listar/lista_produto.dart';
import 'package:delivery/widget/menu_bottom.dart';
import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> with TickerProviderStateMixin {
  int indexAtual = 0;

  void mudaIndex(index) {
    setState(() {
      indexAtual = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
          controller:
              TabController(length: 4, vsync: this, initialIndex: indexAtual),
          children: const [
            ListarProduto(),
            Center(child: Text('2')),
            Center(child: Text('3')),
            Center(child: Text('4'))
          ]),
      bottomNavigationBar: MenuBottom(
        indexSelecionado: indexAtual,
        getIndex: mudaIndex,
      ),
    );
  }
}
