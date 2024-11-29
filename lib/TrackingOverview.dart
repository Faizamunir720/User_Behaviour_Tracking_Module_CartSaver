import 'package:flutter/material.dart';
class TrackingOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Behaviour Tracking Module')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Page View Tracking'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => Navigator.pushNamed(context, '/page-view-tracking'),
          ),
          ListTile(
            title: const Text('Time Spent on Pages'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => Navigator.pushNamed(context, '/time-spent-page'),
          ),
          ListTile(
            title: const Text('Cart Actions'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => Navigator.pushNamed(context, '/cart-actions'),
          ),
        ],
      ),
    );
  }
}
