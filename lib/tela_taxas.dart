import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TelaTaxas extends StatefulWidget {
  const TelaTaxas({Key? key}) : super(key: key);

  @override
  _TelaTaxasState createState() => _TelaTaxasState();
}

class _TelaTaxasState extends State<TelaTaxas> {
  Map<String, double>? taxas;
  bool isLoading = true;
  List<String> taxasFiltradas = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getTaxas();
  }

  Future<void> _getTaxas() async {
    const apiUrl = 'https://api.exchangerate-api.com/v4/latest/USD'; // Substitua pela URL da sua API
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      setState(() {
        taxas = Map<String, double>.from(json.decode(response.body)['rates']);
        taxasFiltradas = taxas!.keys.toList();
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      throw Exception('Não foi possível carregar as taxas de câmbio');
    }
  }

  void _filtrarTaxas(String query) {
    setState(() {
      taxasFiltradas = taxas!.keys
          .where((key) => key.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consulta de Taxas de Câmbio'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 182, 180, 180),  // Cor do app bar em tom neutro
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : taxas == null || taxas!.isEmpty
              ? const Center(child: Text('Nenhuma taxa disponível'))
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          labelText: 'Pesquisar',
                          labelStyle: TextStyle(color: Colors.grey[600]),  // Cor da label
                          hintText: 'Digite o nome da moeda',
                          hintStyle: TextStyle(color: Colors.grey[400]),  // Cor do hint
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors.grey[400]!,  // Cor da borda
                            ),
                          ),
                          prefixIcon: Icon(Icons.search, color: Colors.grey[600]),  // Cor do ícone de pesquisa
                        ),
                        onChanged: _filtrarTaxas,
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: DataTable(
                          columns: const <DataColumn>[
                            DataColumn(label: Text('Moeda')),
                            DataColumn(label: Text('Taxa')),
                          ],
                          rows: taxasFiltradas.map<DataRow>((String key) {
                            double valor = taxas![key]!;
                            return DataRow(
                              cells: <DataCell>[
                                DataCell(Text(key, style: TextStyle(color: Colors.grey[800]))),
                                DataCell(Text(valor.toString(), style: TextStyle(color: Colors.grey[800]))),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
    );
  }
}
