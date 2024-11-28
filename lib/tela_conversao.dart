import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'tela_taxas.dart'; // Importe a tela de consulta de taxas

class TelaConversao extends StatefulWidget {
  const TelaConversao({Key? key}) : super(key: key);

  @override
  _TelaConversaoState createState() => _TelaConversaoState();
}

class _TelaConversaoState extends State<TelaConversao> {
  TextEditingController _valorController = TextEditingController();
  String _resultado = '';
  String _moedaOrigem = 'USD';
  String _moedaDestino = 'BRL';
  List<String> moedas = ['USD', 'BRL', 'EUR', 'GBP', 'JPY'];

  // Função para buscar a taxa de câmbio da API
  Future<void> _conversao() async {
    String valor = _valorController.text.replaceAll(',', '.'); // Corrige o formato da vírgula para ponto.
    if (valor.isEmpty) {
      setState(() {
        _resultado = 'Digite um valor';
      });
      return;
    }

    try {
      String url = 'https://api.exchangerate-api.com/v4/latest/$_moedaOrigem'; // URL da API com taxa de câmbio
      var response = await http.get(Uri.parse(url));
      var data = jsonDecode(response.body);
      var taxa = data['rates'][_moedaDestino];

      if (taxa != null) {
        double resultado = double.parse(valor) * taxa;
        setState(() {
          _resultado = '$valor $_moedaOrigem = ${resultado.toStringAsFixed(2)} $_moedaDestino';
        });
      } else {
        setState(() {
          _resultado = 'Erro ao obter taxa de câmbio';
        });
      }
    } catch (e) {
      setState(() {
        _resultado = 'Erro ao fazer a requisição';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversor de Moeda'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Campo de valor de conversão
            TextField(
              controller: _valorController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Valor',
                border: OutlineInputBorder(),
                hintText: 'Digite o valor a ser convertido',
              ),
            ),
            const SizedBox(height: 20),
            // Dropdown para seleção de moedas
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: _moedaOrigem,
                  items: moedas.map((String moeda) {
                    return DropdownMenuItem<String>(
                      value: moeda,
                      child: Text(moeda),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _moedaOrigem = newValue!;
                    });
                  },
                ),
                const Icon(Icons.arrow_forward, size: 30),
                DropdownButton<String>(
                  value: _moedaDestino,
                  items: moedas.map((String moeda) {
                    return DropdownMenuItem<String>(
                      value: moeda,
                      child: Text(moeda),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _moedaDestino = newValue!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Botão para realizar a conversão
            ElevatedButton(
              onPressed: _conversao,
              child: const Text('Converter'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
                backgroundColor: const Color.fromARGB(255, 156, 160, 161),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Resultado da conversão
            if (_resultado.isNotEmpty)
              Text(
                _resultado,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 20),
            // Botão para navegar para a tela de consulta de taxas
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TelaTaxas()),
                );
              },
              child: const Text('Consultar Taxas de Câmbio'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
                backgroundColor: const Color.fromARGB(255, 186, 190, 186),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
