import 'package:flutter/material.dart';

import '../models/task.dart';

class TaskDetailScreen extends StatelessWidget {
  const TaskDetailScreen({required this.task, super.key});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Detail Tugas',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color.fromARGB(255, 28, 49, 126),
          foregroundColor: Colors.white,
        ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Judul tugas',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    task.title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Mata kuliah',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    task.course,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 20),
                  // UTS 14 Oktober 2026 - Menambahkan detail Deskripsi
                  Text('Deskripsi', style: Theme.of(context).textTheme.labelLarge),
                  const SizedBox(height: 6),
                  Text(
                    task.description.isEmpty ? 'Tidak ada deskripsi.' : task.description,
                  ),
                  const SizedBox(height: 20),
                  Text('Status', style: Theme.of(context).textTheme.labelLarge),
                  const SizedBox(height: 6),
                  Text(task.isDone ? 'Selesai' : 'Belum selesai'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
