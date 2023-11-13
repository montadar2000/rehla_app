class ProgressModel {
  List<ExamData> data;
  String progress;

  ProgressModel({
    required this.data,
    required this.progress,
  });

  factory ProgressModel.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List;
    List<ExamData> examDataList = dataList.map((item) => ExamData.fromJson(item)).toList();

    return ProgressModel(
      data: examDataList,
      progress: json['progress'].toString(),
    );
  }
}

class ExamData {
  int tagId;
  int examsId;
  int progressId;
  String attachment;
  int createdAt;
  String examName;
  int expire;
  double degree;
  String note;
  String studentAttachment;
  int userId;

  ExamData({
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

  factory ExamData.fromJson(Map<String, dynamic> json) {
    return ExamData(
      tagId: json['tag_id'],
      examsId: json['exams_id'],
      progressId: json['progress_id'],
      attachment: json['attachment'],
      createdAt: json['created_at'],
      examName: json['exam_name'],
      expire: json['expire'],
      degree: json['degree'],
      note: json['note'],
      studentAttachment: json['student_attachment'],
      userId: json['user_id'],
    );
  }
}
