

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DisplayRecord extends StatefulWidget {
  const DisplayRecord({super.key, required this.colName});

  final String colName;

  @override
  State<DisplayRecord> createState() => _DisplayRecordState();
}

class _DisplayRecordState extends State<DisplayRecord> {
  @override
Widget build(BuildContext context) {
  if (widget.colName.trim().isEmpty) {
    return Scaffold(
      appBar: AppBar(title: const Text('Records')),
      body: const Center(child: Text('Invalid Collection Name')),
    );
  }

  return Scaffold(
    appBar: AppBar(
      title: const Text('Records'),
      centerTitle: true,
      elevation: 5.0,
    ),
    body: Container(
      margin: const EdgeInsets.all(10.0),
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection(widget.colName.trim()).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No records found in this collection'));
          }
          final docs = snapshot.data!.docs;
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final doc = docs[index];
              return Card(
                child: ListTile(
                  title: Text(doc['name'] ?? 'No Name'),
                  subtitle: Text(doc['qualification'] ?? 'No Qualification'),
                ),
              );
            },
          );
        },
      ),
    ),
  );
}

}

