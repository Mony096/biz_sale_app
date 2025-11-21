import 'package:flutter/material.dart';


class SyncContent extends StatefulWidget {
  const SyncContent({super.key});

  @override
  State<SyncContent> createState() => _SyncContentState();
}

class _SyncContentState extends State<SyncContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.sync, size: 64, color: Colors.blue.shade600),
          ),
          const SizedBox(height: 24),
          const Text(
            'Sync Data',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          const Text(
            'Last synced: 2 hours ago',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.sync),
            label: const Text('Sync Now'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
          ),
        ],
      ),
    );
  }
}