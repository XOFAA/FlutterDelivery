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
        title: const Text('Carrinho'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<CarrinhoProvider>(
              builder: (context, carrinhoProvider, child) {
                return ListView.builder(
                  itemCount: carrinhoProvider.itensCarrinho.length,
                  itemBuilder: (context, index) {
                    var item = carrinhoProvider.itensCarrinho[index];
                    var valorTotal = double.parse(item['valor']) * item['qtd'];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.network(
                          item['img'],
                          height: 80,
                          width: 80,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item['titulo'],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'R\$ ' + valorTotal.toStringAsFixed(2),
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            carrinhoProvider.removerItem(item);
                          },
                          icon: Icon(Icons.remove),
                        ),
                        Text(
                          item['qtd'].toString(),
                        ),
                        IconButton(
                          onPressed: () {
                            carrinhoProvider.adicionarItem(item, 1);
                          },
                          icon: Icon(Icons.add),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            margin: EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                // Ação do botão de finalizar compra
              },
              child: Text('Finalizar Compra'),
            ),
          ),
        ],
      ),
    );
  }
}
