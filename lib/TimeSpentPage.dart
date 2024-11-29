import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TimeSpentPage extends StatefulWidget {
  @override
  _TimeSpentPageState createState() => _TimeSpentPageState();
}

class _TimeSpentPageState extends State<TimeSpentPage> {
  List<dynamic> products = [];
  final String apiUrl = 'http://192.168.1.4:3008/api/time-spent';

  @override
  void initState() {
    super.initState();
    fetchTimeSpentData();
  }

  Future<void> fetchTimeSpentData() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      setState(() {
        products = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load time spent data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Time Spent on Pages')),
      body: products.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            child: ListTile(
              leading: Image.network(
                  'http://192.168.1.4:3008${product['image']}'),
              title: Text(product['product']),
              subtitle: Text('Time Spent: ${product['time']}'),
            ),
          );
        },
      ),
    );
  }
}
