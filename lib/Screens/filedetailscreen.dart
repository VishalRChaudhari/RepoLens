import 'package:flutter/material.dart';

class FilesScreen extends StatelessWidget {
  final Map<String, dynamic> file;

  const FilesScreen({super.key, required this.file});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(file['filename'] ?? 'File Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Filename: ${file['filename']}',
                style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text('Type: ${file['type']}'),
            const SizedBox(height: 10),
            Text('Language: ${file['language'] ?? 'No data'}'),
            const SizedBox(height: 20),
            const Text('Content Preview:'),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child:
                    Text(file['content'] ?? 'No content available to display'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
