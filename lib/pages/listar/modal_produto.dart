import 'package:delivery/pages/carrinho/carrinho_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ModalProduto extends StatefulWidget {
  const ModalProduto(
      {super.key,
      required this.id,
      required this.titulo,
      required this.subtitulo,
      required this.valor,
      required this.img});
  final String titulo;
  final String subtitulo;
  final String valor;
  final String img;
  final int id;

  @override
  State<ModalProduto> createState() => _ModalProdutoState();
}

class _ModalProdutoState extends State<ModalProduto> {
  int qtd = 1;

  List<Map<String, dynamic>> carrinho = [];
  void AdicionarQtd() {
    setState(() {
      qtd++;
    });
  }

  void DiminuiQtd() {
    setState(() {
      if (qtd > 1) {
        qtd--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final carrinhoProvider = Provider.of<CarrinhoProvider>(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.titulo),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 280,
                  child: Center(
                    child: Image.network(
                      widget.img,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Text(
                  widget.titulo,
                  style: const TextStyle(fontSize: 30),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                    height: 40,
                    child: Text(widget.subtitulo,
                        style: const TextStyle(fontSize: 18))),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  // ignore: prefer_interpolation_to_compose_strings
                  "R\$ " + widget.valor,
                  style: TextStyle(fontSize: 25, color: Colors.green[500]),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: const [
                    Icon(Icons.speaker_notes),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Alguma Observacao ?',
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const TextField(
                  maxLength: 50,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'ex: Tirar cebola, maiose a parte, etc.'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 1),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: DiminuiQtd,
                                icon: const Icon(Icons.remove)),
                            Text('$qtd'),
                            IconButton(
                                onPressed: AdicionarQtd,
                                icon: const Icon(Icons.add)),
                          ],
                        )),
                    ElevatedButton(
                        onPressed: () {
                          carrinhoProvider.adicionarItem({
                            'titulo': widget.titulo,
                            'valor': widget.valor,
                            'img': widget.img,
                            'subtitulo': widget.subtitulo
                          }, qtd);
                        },
                        child: const Text('Adicionar'))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
