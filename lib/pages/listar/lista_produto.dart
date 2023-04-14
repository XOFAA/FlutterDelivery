import 'dart:convert';
import 'package:delivery/pages/listar/modal_produto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vertical_scrollable_tabview/vertical_scrollable_tabview.dart';

class ListarProduto extends StatefulWidget {
  const ListarProduto({super.key});

  @override
  State<ListarProduto> createState() => _ListarProdutoState();
}

class _ListarProdutoState extends State<ListarProduto>
    with SingleTickerProviderStateMixin {
  var url = Uri.parse('https://api.gdelivery.app.br/cliente/Cardapio');
  List produto = [];
  List data = [];
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    consomeApi();
  }

  void consomeApi() async {
    var response = await http.get(url);

    if (response.statusCode == 200) {
      produto = jsonDecode(response.body)['data'];
      data = [
        {
          'titulo': 'Sanduiche',
          'foods': produto.where((p) => p['categoria'] == 'Sanduiche').toList()
        },
        {
          'titulo': 'Sobremesa',
          'foods': produto.where((p) => p['categoria'] == 'Sobremesa').toList()
        },
        {
          'titulo': 'Pizza',
          'foods': produto.where((p) => p['categoria'] == 'Pizza').toList()
        }
      ];
      tabController = TabController(length: data.length, vsync: this);
      setState(() {}); // rebuild the widget tree with new tabController
    } else {
      print('falha ao consumir api');
    }
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: data.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : VerticalScrollableTabView(
              tabController: tabController,
              listItemData: data,
              eachItemChild: (object, index) => Column(
                children: List.generate(object['foods'].length, (index) {
                  return GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return SizedBox(
                              height: MediaQuery.of(context).size.height * 0.9,
                              child: ModalProduto(
                                subtitulo: object['foods'][index]['subtitulo'],
                                valor: object['foods'][index]['valor'],
                                img: "https://api.gdelivery.app.br/files/" +
                                    object['foods'][index]['img'],
                                titulo: object['foods'][index]['titulo'],
                              ),
                            );
                          });
                    },
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                object['foods'][index]['titulo'],
                                style: const TextStyle(fontSize: 25),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                  width: 200,
                                  child: Text(
                                    object['foods'][index]['subtitulo'],
                                    style: const TextStyle(fontSize: 15),
                                  )),
                              const SizedBox(height: 10),
                              Text(
                                'R\$ ' + object['foods'][index]['valor'],
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[500]),
                              )
                            ],
                          ),
                          SizedBox(
                            child: Image.network(
                              // ignore: prefer_interpolation_to_compose_strings
                              "https://api.gdelivery.app.br/files/" +
                                  object['foods'][index]['img'],
                              width: 100,
                              height: 100,
                            ),
                          )
                        ],
                      ),
                    )),
                  );
                }),
              ),
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 200.0,
                  flexibleSpace: const FlexibleSpaceBar(
                    title: Center(child: Text("Gdelivery")),
                    centerTitle: true,
                    collapseMode: CollapseMode.pin,
                  ),
                  bottom: TabBar(
                    isScrollable: true,
                    controller: tabController,
                    indicatorPadding:
                        const EdgeInsets.symmetric(horizontal: 15.0),
                    indicatorColor: Colors.cyan,
                    labelColor: Colors.cyan,
                    unselectedLabelColor: Colors.white,
                    indicatorWeight: 5.0,
                    tabs: data.map((e) {
                      print(e);
                      return Tab(
                          child: Text(
                        e['titulo'],
                        style: const TextStyle(fontSize: 18),
                      ));
                    }).toList(),
                    onTap: (index) {
                      VerticalScrollableTabBarStatus.setIndex(index);
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
