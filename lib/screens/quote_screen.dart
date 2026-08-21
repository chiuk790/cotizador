import 'package:flutter/material.dart';
import '../models/quote_model.dart';
import '../services/local_db.dart';

class QuoteScreen extends StatefulWidget {
  @override
  _QuoteScreenState createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  final TextEditingController _clientController = TextEditingController();
  final TextEditingController _productController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  List<Map<String, dynamic>> quotes = [];

  Future<void> _saveQuote() async {
    if (_clientController.text.isEmpty || _productController.text.isEmpty) return;

    QuoteModel quote = QuoteModel(
      clientName: _clientController.text,
      productName: _productController.text,
      quantity: int.tryParse(_quantityController.text) ?? 0,
      totalAmount: 100.0, // Valor temporal
      createdAt: DateTime.now().toString(),
    );

    DatabaseHelper dbHelper = DatabaseHelper();
    await dbHelper.insertQuote(quote.toMap());

    setState(() {
      quotes.add(quote.toMap());
    });

    _clientController.clear();
    _productController.clear();
    _quantityController.clear();

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Cotización guardada")));
  }

  @override
  void initState() {
    super.initState();
    _loadQuotes();
  }

  Future<void> _loadQuotes() async {
    DatabaseHelper dbHelper = DatabaseHelper();
    List<Map<String, dynamic>> result = await dbHelper.getAllQuotes();
    setState(() {
      quotes = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cotizador")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(controller: _clientController, decoration: InputDecoration(labelText: "Nombre del Cliente")),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(controller: _productController, decoration: InputDecoration(labelText: "Producto")),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(controller: _quantityController, keyboardType: TextInputType.number, decoration: InputDecoration(labelText: "Cantidad")),
          ),
          ElevatedButton(onPressed: _saveQuote, child: Text("Guardar Cotización")),
          Expanded(
            child: ListView.builder(
              itemCount: quotes.length,
              itemBuilder: (context, index) {
                var quote = quotes[index];
                return ListTile(
                  title: Text("${quote['clientName']} - ${quote['productName']}"),
                  subtitle: Text("Cantidad: ${quote['quantity']}, Total: ${quote['totalAmount']}"),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
