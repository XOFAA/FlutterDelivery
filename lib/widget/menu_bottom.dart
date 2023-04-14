import 'package:flutter/material.dart';

class MenuBottom extends StatelessWidget {
  int indexSelecionado = 0;
  final Function(int) getIndex;

  MenuBottom(
      {super.key, required this.indexSelecionado, required this.getIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: indexSelecionado,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Pesquisar'),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Pedidos'),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_sharp), label: 'Carrinho')
      ],
      onTap: (index) => getIndex(index),
    );
  }
}
