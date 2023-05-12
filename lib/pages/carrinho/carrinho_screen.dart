import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'carrinho_provider.dart';

class CarrinhoScreen extends StatefulWidget {
  const CarrinhoScreen({super.key});

  @override
  _CarrinhoScreenState createState() => _CarrinhoScreenState();
}

class _CarrinhoScreenState extends State<CarrinhoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho'),
      ),
      body: Consumer<CarrinhoProvider>(
        builder: (context, carrinhoProvider, child) {
          return ListView(
            children:
                List.generate(carrinhoProvider.itensCarrinho.length, (index) {
              var item = carrinhoProvider.itensCarrinho[index];
              return ListTile(
                title: Text(item['titulo']),
                subtitle: Text('R\$ ${item['valor']}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(item['qtd'].toString()),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        carrinhoProvider.adicionarItem(item, 1);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        carrinhoProvider.removerItem(index);
                      },
                    ),
                  ],
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
