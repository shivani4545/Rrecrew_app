class PayRollModel {
  int? id;
  int? userId;
  int? basic;
  int? hra;
  int? conveyance;
  int? allowance;
  int? miscellaneous;
  int? tax;
  int? esi;
  int? pf;
  int? leave;
  int? loan;
  int? healthEdu;
  int? bonus;
  int? salary;
  int? month;
  int? year;
  String? date;
  int? companyId;
  String? createdAt;
  String? salaryslip;
  String? updatedAt;
  String? cdate;
  String? name;
  String? dateOfJoining;
  int? number;
  String? email;
  String? companyName;

  PayRollModel(
      {this.id,
      this.userId,
      this.basic,
      this.hra,
      this.conveyance,
      this.allowance,
      this.miscellaneous,
      this.tax,
      this.esi,
      this.pf,
      this.leave,
      this.loan,
      this.healthEdu,
      this.bonus,
      this.salaryslip,
      this.salary,
      this.month,
      this.year,
      this.date,
      this.companyId,
      this.createdAt,
      this.updatedAt,
      this.cdate,
      this.name,
      this.dateOfJoining,
      this.number,
      this.email,
      this.companyName});

  PayRollModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    basic = json['basic'];
    hra = json['hra'];
    conveyance = json['conveyance'];
    allowance = json['allowance'];
    salaryslip = json['salary_slip'];
    miscellaneous = json['miscellaneous'];
    tax = json['tax'];
    esi = json['esi'];
    pf = json['pf'];
    leave = json['leave'];
    loan = json['loan'];
    healthEdu = json['health_edu'];
    bonus = json['bonus'];
    salary = json['salary'];
    month = json['month'];
    year = json['year'];
    date = json['date'];
    companyId = json['company_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    cdate = json['cdate'];
    name = json['name'];
    dateOfJoining = json['date_of_joining'];
    number = json['number'];
    email = json['email'];
    companyName = json['company_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['basic'] = basic;
    data['hra'] = hra;
    data['conveyance'] = conveyance;
    data['allowance'] = allowance;
    data['miscellaneous'] = miscellaneous;
    data['tax'] = tax;
    data['salary_slip'] = salaryslip;
    data['esi'] = esi;
    data['pf'] = pf;
    data['leave'] = leave;
    data['loan'] = loan;
    data['health_edu'] = healthEdu;
    data['bonus'] = bonus;
    data['salary'] = salary;
    data['month'] = month;
    data['year'] = year;
    data['date'] = date;
    data['company_id'] = companyId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['cdate'] = cdate;
    data['name'] = name;
    data['date_of_joining'] = dateOfJoining;
    data['number'] = number;
    data['email'] = email;
    data['company_name'] = companyName;
    return data;
  }
}
