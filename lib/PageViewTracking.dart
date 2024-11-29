import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PageViewTracking extends StatefulWidget {
  @override
  _PageViewTrackingState createState() => _PageViewTrackingState();
}

class _PageViewTrackingState extends State<PageViewTracking> {
  List<dynamic> pageLogs = [];
  final String apiUrl = 'http://192.168.1.4:3008/api/page-views';

  @override
  void initState() {
    super.initState();
    fetchPageLogs();
  }

  Future<void> fetchPageLogs() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      setState(() {
        pageLogs = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load page views');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page View Tracking')),
      body: pageLogs.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: pageLogs.length,
        itemBuilder: (context, index) {
          final log = pageLogs[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: Image.network(
                  'http://192.168.1.4:3008${log['image']}'),
              title: Text('Visited ${log['page'] ?? 'Unknown Page'}'),
              subtitle: Text('Time: ${log['time'] ?? 'Unknown Time'}'),
            ),
          );
        },
      ),
    );
  }
}
