  import 'dart:async';
  import 'dart:convert';
  import 'package:shared_preferences/shared_preferences.dart';

  import '../models/task.dart';

  /// Titik akses data tugas.
  ///
  /// Starter memakai memori agar aplikasi dapat langsung dijalankan. Lengkapi
  /// TODO 2 dengan SharedPreferences dan JSON; jangan memindahkan akses storage
  /// ke widget.
  class TaskStorage {
    TaskStorage({this.loadDelay = const Duration(milliseconds: 450)});

    static const String keyTask = "task";
    static const String keyVersion = "scheme";
    static const int versiSkema = 1;

    final Duration loadDelay;

    Future<List<Task>> load({bool simulateError = false}) async {
      await Future<void>.delayed(loadDelay);
      if (simulateError) {
        throw const FormatException('Simulasi data tersimpan yang rusak.');
      }
      // TODO 2a: baca String JSON dari SharedPreferences lalu ubah menjadi
      // List<Task> dengan Task.fromJson. JSON rusak dapat menghasilkan
      // FormatException agar UI menampilkan state error.

      // UTS - Oktober 12 2026 23:50 - TODO 2a Selesai
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? mentah = prefs.getString(keyTask);

      if (mentah == null) {
        return <Task>[];
      }

      final List<dynamic> baris;
      try {
        baris = jsonDecode(mentah) as List<dynamic>;
      } on FormatException {
        throw const FormatException(
          "Data tugas tersimpan rusak dan tidak dapat dibaca sebagai JSON.",
        );
      } on TypeError {
        throw const FormatException(
          'Data Tugas tersimpan bukan berbentuk daftar.',
        );
      }

      return List<Task>.generate(
        baris.length,
        (int i) => Task.fromJson(baris[i] as Map<String, dynamic>),
        growable: true,
      );
    }

    Future<void> save(List<Task> tasks) async {
      // TODO 2b: encode seluruh daftar sebagai JSON String dan tulis melalui
      // SharedPreferences. Periksa nilai bool yang dikembalikan setString.

      // UTS Oktober 13 2026 01:10 - TODO 2b Selesai
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String mentah = jsonEncode(
        tasks.map((Task t) => t.toJson()).toList(growable: false),
      );

      final bool berhasil = await prefs.setString(keyTask, mentah);
      if (!berhasil) {
        throw Exception('Penyimpanan perangkat menolak penulisan data tugas.');
      }
      await prefs.setInt(keyVersion, versiSkema);
    }

    Future<void> clear() async {
      // TODO 2c: hapus key daftar tugas dari SharedPreferences.

      // UTS OKtober 13 2026 01:20 - TODO 2c Selesai
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove(TaskStorage.keyTask);
      await prefs.remove(TaskStorage.keyVersion);
    }

    /// Hanya untuk mengisolasi pengujian lokal.
    static Future<void> resetMemoryForTest() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(keyTask, '{ini sengaja bukan JSON yang sah');
    }
  }
