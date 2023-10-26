class ProgressModel {
  final List<ProgressItem> data;
  final double progress;

  ProgressModel({
    required this.data,
    required this.progress,
  });

  factory ProgressModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as List<dynamic>;
    final progress = json['progress'] as double;

    List<ProgressItem> progressList = data.map((item) {
      return ProgressItem.fromJson(item);
    }).toList();

    return ProgressModel(
      data: progressList,
      progress: progress,
    );
  }
}

class ProgressItem {
  final int tagId;
  final int examsId;
  final int progressId;
  final String attachment;
  final int createdAt;
  final String examName;
  final int expire;
  final double degree;
  final String note;
  final String studentAttachment;
  final int userId;

  ProgressItem({
    required this.tagId,
    required this.examsId,
    required this.progressId,
    required this.attachment,
    required this.createdAt,
    required this.examName,
    required this.expire,
    required this.degree,
    required this.note,
    required this.studentAttachment,
    required this.userId,
  });

  factory ProgressItem.fromJson(Map<String, dynamic> json) {
    return ProgressItem(
      tagId: json['tag_id'] as int,
      examsId: json['exams_id'] as int,
      progressId: json['progress_id'] as int,
      attachment: json['attachment'] as String,
      createdAt: json['created_at'] as int,
      examName: json['exam_name'] as String,
      expire: json['expire'] as int,
      degree: json['degree'] as double,
      note: json['note'] as String,
      studentAttachment: json['student_attachment'] as String,
      userId: json['user_id'] as int,
    );
  }
}
