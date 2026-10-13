/// Data satu tugas praktikum.
///
/// Lengkapi serialisasi JSON pada TODO 1 agar model dapat disimpan dan dibaca
/// kembali menggunakan SharedPreferences.
class Task {
  const Task({
    required this.id,
    required this.title,
    required this.course,
    this.isDone = false,
  });

  final String id;
  final String title;
  final String course;
  final bool isDone;

  Task copyWith({bool? isDone}) =>
      Task(id: id, title: title, course: course, isDone: isDone ?? this.isDone);

  // UTS - Oktober 12 2026 22:29 - TODO 1a Selesai
  Map<String, Object?> toJson() {
    return <String, Object?>{
      'id': id,
      'title': title,
      'course': course,
      'isDone': isDone,
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    // TODO 1b: bangun Task dari Map hasil jsonDecode.
    // Gunakan nilai aman bila data lama tidak memiliki sebuah key.

    //UTS - Oktober 13 2026 22:40 - TODO 1b Selesai
    return Task(
      id: json['id'] as String? ?? 'tanpa-id',
      title: json['title'] as String? ?? 'tanpa-judul',
      course: json['course'] as String? ?? 'Umum',
      isDone: json['isDone'] is bool ? json['isDone'] as bool : false,
    );
  }

}
