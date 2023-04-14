import 'dart:ffi';

import 'package:flutter/material.dart';

class ModalProduto extends StatelessWidget {
  ModalProduto(
      {super.key,
      required this.titulo,
      required this.subtitulo,
      required this.valor,
      required this.img});
  final String titulo;
  final String subtitulo;
  final String valor;
  final String img;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(titulo),
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
                      img,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Text(
                  titulo,
                  style: const TextStyle(fontSize: 30),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(subtitulo, style: const TextStyle(fontSize: 18)),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  // ignore: prefer_interpolation_to_compose_strings
                  "R\$ " + valor,
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
                                onPressed: () {},
                                icon: const Icon(Icons.remove)),
                            const Text('1'),
                            IconButton(
                                onPressed: () {}, icon: const Icon(Icons.add)),
                          ],
                        )),
                    ElevatedButton(
                        onPressed: () {}, child: const Text('Adicionar'))
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
