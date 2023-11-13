class Material {
  final int id;
  final String title;
  final String description;
  final String cover;
  final String teacherName;
  final String teacherImage;
  final List<dynamic> pdf;

  Material({
    required this.id,
    required this.title,
    required this.description,
    required this.cover,
    required this.teacherName,
    required this.teacherImage,
    required this.pdf,
  });

  factory Material.fromJson(Map<String, dynamic> json) {
    return Material(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      cover: json['cover'],
      teacherName: json['teacherName'],
      teacherImage: json['teacherImage'],
      pdf: json['materials'],
    );
  }
}
