class Material {
  final int id;
  final String title;
  final String image;
  final String teacherName;
  final String description;
  final List<String> pdf;

  Material({
    required this.id,
    required this.title,
    required this.image,
    required this.teacherName,
    required this.description,
    required this.pdf,
  });

  factory Material.fromJson(Map<String, dynamic> json) {
    List<String> pdfList = [];
    if (json['pdf'] != null) {
      for (var pdfUrl in json['pdf']) {
        pdfList.add(pdfUrl);
      }
    }

    return Material(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      teacherName: json['teacherName']??"",
      description: json['description'],
      pdf: pdfList,
    );
  }
}
