import 'package:flutter/foundation.dart';

class CarrinhoProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _itensCarrinho = [];

  List<Map<String, dynamic>> get itensCarrinho => _itensCarrinho;

  void adicionarItem(Map<String, dynamic> item, int quantidade) {
    // Verifica se o produto já está na lista de carrinho
    int index = _itensCarrinho
        .indexWhere((element) => element['titulo'] == item['titulo']);

    if (index >= 0) {
      // Se o produto já estiver na lista, atualiza apenas a quantidade
      _itensCarrinho[index]['qtd'] += quantidade;
    } else {
      // Caso contrário, adiciona o produto à lista
      _itensCarrinho.add({...item, 'qtd': quantidade});
    }
    print(index);
    notifyListeners();
  }

  void removerItem(int index) {
    _itensCarrinho.removeAt(index);
    notifyListeners();
  }
}
