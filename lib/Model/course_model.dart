class Autogenerated {
  int? id;
  String? title;
  String? description;
  String? cover;
  String? teacherName;
  String? teacherImage;
  double? price;
  int? duration;
  int? countOfCourses;
  List<CourseVideos>? courseVideos;
  List<Exam>? exam;

  Autogenerated({
    this.id,
    this.title,
    this.description,
    this.cover,
    this.teacherName,
    this.teacherImage,
    this.price,
    this.duration,
    this.countOfCourses,
    this.courseVideos,
    this.exam,
  });

  Autogenerated.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    cover = json['cover'];
    teacherName = json['teacherName'];
    teacherImage = json['teacherImage'];
    price = json['price'];
    duration = json['duration'];
    countOfCourses = json['countOfCourses'];

    if (json['courseVideos'] != null) {
      courseVideos = <CourseVideos>[];
      json['courseVideos'].forEach((v) {
        courseVideos!.add(CourseVideos.fromJson(v));
      });
    }

    if (json['exam'] != null) {
      exam = <Exam>[];
      json['exam'].forEach((v) {
        exam!.add(Exam.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['cover'] = cover;
    data['teacherName'] = teacherName;
    data['teacherImage'] = teacherImage;
    data['price'] = price;
    data['duration'] = duration;
    data['countOfCourses'] = countOfCourses;

    if (courseVideos != null) {
      data['courseVideos'] = courseVideos!.map((v) => v.toJson()).toList();
    }

    if (exam != null) {
      data['exam'] = exam!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class CourseVideos {
  int? id;
  String? title;
  String? description;
  String? cover;
  String? uriVideo;
  String? uriPDF;

  CourseVideos({
    this.id,
    this.title,
    this.description,
    this.cover,
    this.uriVideo,
    this.uriPDF,
  });

  CourseVideos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    cover = json['cover'];
    uriVideo = json['uriVideo'];
    uriPDF = json['uriPDF'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['cover'] = cover;
    data['uriVideo'] = uriVideo;
    data['uriPDF'] = uriPDF;
    return data;
  }
}

class Exam {
  int? examId;
  int? courseId;
  String? courseName;
  String? courseDescription;
  String? courseTeacher;
  List<ExamInfo>? exams;

  Exam({
    this.examId,
    this.courseId,
    this.courseName,
    this.courseDescription,
    this.courseTeacher,
    this.exams,
  });

  Exam.fromJson(Map<String, dynamic> json) {
    examId = json['examId'];
    courseId = json['courseId'];
    courseName = json['courseName'];
    courseDescription = json['courseDescription'];
    courseTeacher = json['courseTeacher'];

    if (json['exams'] != null) {
      exams = <ExamInfo>[];
      json['exams'].forEach((v) {
        exams!.add(ExamInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['examId'] = examId;
    data['courseId'] = courseId;
    data['courseName'] = courseName;
    data['courseDescription'] = courseDescription;
    data['courseTeacher'] = courseTeacher;

    if (exams != null) {
      data['exams'] = exams!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class ExamInfo {
  int? examsId;
  String? examName;
  String? attachment;
  int? createdAt;
  int? expire;
  int? tagId;

  ExamInfo({
    this.examsId,
    this.examName,
    this.attachment,
    this.createdAt,
    this.expire,
    this.tagId,
  });

  ExamInfo.fromJson(Map<String, dynamic> json) {
    examsId = json['examsId'];
    examName = json['examName'];
    attachment = json['attachment'];
    createdAt = json['createdAt'];
    expire = json['expire'];
    tagId = json['tagId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['examsId'] = examsId;
    data['examName'] = examName;
    data['attachment'] = attachment;
    data['createdAt'] = createdAt;
    data['expire'] = expire;
    data['tagId'] = tagId;
    return data;
  }
}