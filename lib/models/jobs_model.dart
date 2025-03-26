class JobsModel {
  bool? success;
  int? statusCode;
  List<Jobs>? jobs;

  JobsModel({this.success, this.statusCode, this.jobs});

  JobsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    if (json['jobs'] != null) {
      jobs = <Jobs>[];
      json['jobs'].forEach((v) {
        jobs!.add(Jobs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['status_code'] = statusCode;
    if (jobs != null) {
      data['jobs'] = jobs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Jobs {
  int? id;
  String? title;
  int? designation;
  String? location;
  int? noOfVacancies;
  int? experience;
  int? salaryFrom;
  int? salaryTo;
  String? jobType;
  String? skills;
  String? status;
  String? description;
  int? company;
  String? createdAt;
  String? updatedAt;
  String? roleName;
  String? companyName;

  Jobs(
      {this.id,
      this.title,
      this.designation,
      this.location,
      this.noOfVacancies,
      this.experience,
      this.salaryFrom,
      this.salaryTo,
      this.jobType,
      this.skills,
      this.status,
      this.description,
      this.company,
      this.createdAt,
      this.updatedAt,
      this.roleName,
      this.companyName});

  Jobs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    designation = json['designation'];
    location = json['location'];
    noOfVacancies = json['no_of_vacancies'];
    experience = json['experience'];
    salaryFrom = json['salary_from'];
    salaryTo = json['salary_to'];
    jobType = json['job_type'];
    skills = json['skills'];
    status = json['status'];
    description = json['description'];
    company = json['company'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    roleName = json['role_name'];
    companyName = json['company_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['designation'] = designation;
    data['location'] = location;
    data['no_of_vacancies'] = noOfVacancies;
    data['experience'] = experience;
    data['salary_from'] = salaryFrom;
    data['salary_to'] = salaryTo;
    data['job_type'] = jobType;
    data['skills'] = skills;
    data['status'] = status;
    data['description'] = description;
    data['company'] = company;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['role_name'] = roleName;
    data['company_name'] = companyName;
    return data;
  }
}
