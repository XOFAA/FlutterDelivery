import 'package:delivery/pages/carrinho/carrinho_provider.dart';
import 'package:delivery/pages/inicio/inicio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CarrinhoProvider()),
      ],
      child: const MaterialApp(
        home: Inicio(),
      ),
    );
  }
}
