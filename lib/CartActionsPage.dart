import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CartActionsPage extends StatefulWidget {
  @override
  _CartActionsPageState createState() => _CartActionsPageState();
}

class _CartActionsPageState extends State<CartActionsPage> {
  List<dynamic> cartLogs = [];
  final String apiUrl = 'http://192.168.1.4:3008/api/cart-actions';

  @override
  void initState() {
    super.initState();
    fetchCartActions();
  }

  Future<void> fetchCartActions() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      setState(() {
        cartLogs = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load cart actions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart Actions')),
      body: cartLogs.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: cartLogs.length,
        itemBuilder: (context, index) {
          final log = cartLogs[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: SizedBox(
                width: 40, // Set the desired width for the image
                height: 40, // Set the desired height for the image
                child: Image.network(
                  'http://192.168.1.4:3008${log['image']}',
                  fit: BoxFit.cover, // Optional: Make the image fit properly within the size
                ),
              ),
              title: Text('${log['action']} - ${log['product']}'),
              subtitle: Text('Timestamp: ${log['timestamp']}'),
            ),
          );
        },
      ),
    );
  }
}

