class EmployeesModel {
  String? deptName;
  String? roleName;
  String? branchName;
  String? companyName;
  String? id;
  String? photo;
  String? code;
  String? name;
  String? status;
  String? gender;
  String? dateOfBirth;
  String? dateOfJoining;
  String? number;
  String? qualification;
  String? role;
  String? emergencyNumber;
  String? panNumber;
  String? fatherName;
  String? currentAddress;
  String? permanentAddress;
  String? formalities;
  String? permanent;
  String? probationPeriod;
  String? dateOfConfirmation;
  String? department;
  String? salary;
  String? accountNumber;
  String? bankName;
  String? ifscCode;
  String? pfAccountNumber;
  String? branchId;
  String? pfStatus;
  String? userId;
  String? casualLeaves;
  String? sickLeaves;
  String? noOfDayLeaves;
  String? shiftStart;
  String? shiftEnd;
  String? isMonday;
  String? isTuesday;
  String? isWednesday;
  String? isThursday;
  String? isFriday;
  String? is2Saturday;
  String? is4Saturday;
  String? isSunday;
  String? isSalary;
  String? companyId;
  String? manager;
  String? createdAt;
  String? updatedAt;

  EmployeesModel(
      {this.deptName,
      this.roleName,
      this.branchName,
      this.companyName,
      this.id,
      this.photo,
      this.code,
      this.name,
      this.status,
      this.gender,
      this.dateOfBirth,
      this.dateOfJoining,
      this.number,
      this.qualification,
      this.role,
      this.emergencyNumber,
      this.panNumber,
      this.fatherName,
      this.currentAddress,
      this.permanentAddress,
      this.formalities,
      this.permanent,
      this.probationPeriod,
      this.dateOfConfirmation,
      this.department,
      this.salary,
      this.accountNumber,
      this.bankName,
      this.ifscCode,
      this.pfAccountNumber,
      this.branchId,
      this.pfStatus,
      this.userId,
      this.casualLeaves,
      this.sickLeaves,
      this.noOfDayLeaves,
      this.shiftStart,
      this.shiftEnd,
      this.isMonday,
      this.isTuesday,
      this.isWednesday,
      this.isThursday,
      this.isFriday,
      this.is2Saturday,
      this.is4Saturday,
      this.isSunday,
      this.isSalary,
      this.companyId,
      this.manager,
      this.createdAt,
      this.updatedAt});

  EmployeesModel.fromJson(Map<String, dynamic> json) {
    deptName = json['dept_name'].toString();
    roleName = json['role_name'].toString();
    branchName = json['branch_name'].toString();
    companyName = json['company_name'].toString();
    id = json['id'].toString();
    photo = json['photo'].toString();
    code = json['code'].toString();
    name = json['name'].toString();
    status = json['status'].toString();
    gender = json['gender'].toString();
    dateOfBirth = json['date_of_birth'].toString();
    dateOfJoining = json['date_of_joining'].toString();
    number = json['number'].toString();
    qualification = json['qualification'].toString();
    role = json['role'].toString();
    emergencyNumber = json['emergency_number'].toString();
    panNumber = json['pan_number'].toString();
    fatherName = json['father_name'].toString();
    currentAddress = json['current_address'].toString();
    permanentAddress = json['permanent_address'].toString();
    formalities = json['formalities'].toString();
    permanent = json['permanent'].toString();
    probationPeriod = json['probation_period'].toString();
    dateOfConfirmation = json['date_of_confirmation'].toString();
    department = json['department'].toString();
    salary = json['salary'].toString();
    accountNumber = json['account_number'].toString();
    bankName = json['bank_name'].toString();
    ifscCode = json['ifsc_code'].toString();
    pfAccountNumber = json['pf_account_number'].toString();
    branchId = json['branch_id'].toString();
    pfStatus = json['pf_status'].toString();
    userId = json['user_id'].toString();
    casualLeaves = json['casual_leaves'].toString();
    sickLeaves = json['sick_leaves'].toString();
    noOfDayLeaves = json['no_of_day_leaves'].toString();
    shiftStart = json['shift_start'].toString();
    shiftEnd = json['shift_end'].toString();
    isMonday = json['isMonday'].toString();
    isTuesday = json['isTuesday'].toString();
    isWednesday = json['isWednesday'].toString();
    isThursday = json['isThursday'].toString();
    isFriday = json['isFriday'].toString();
    is2Saturday = json['is2Saturday'].toString();
    is4Saturday = json['is4Saturday'].toString();
    isSunday = json['isSunday'].toString();
    isSalary = json['is_salary'].toString();
    companyId = json['company_id'].toString();
    manager = json['manager'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dept_name'] = deptName;
    data['role_name'] = roleName;
    data['branch_name'] = branchName;
    data['company_name'] = companyName;
    data['id'] = id;
    data['photo'] = photo;
    data['code'] = code;
    data['name'] = name;
    data['status'] = status;
    data['gender'] = gender;
    data['date_of_birth'] = dateOfBirth;
    data['date_of_joining'] = dateOfJoining;
    data['number'] = number;
    data['qualification'] = qualification;
    data['role'] = role;
    data['emergency_number'] = emergencyNumber;
    data['pan_number'] = panNumber;
    data['father_name'] = fatherName;
    data['current_address'] = currentAddress;
    data['permanent_address'] = permanentAddress;
    data['formalities'] = formalities;
    data['permanent'] = permanent;
    data['probation_period'] = probationPeriod;
    data['date_of_confirmation'] = dateOfConfirmation;
    data['department'] = department;
    data['salary'] = salary;
    data['account_number'] = accountNumber;
    data['bank_name'] = bankName;
    data['ifsc_code'] = ifscCode;
    data['pf_account_number'] = pfAccountNumber;
    data['branch_id'] = branchId;
    data['pf_status'] = pfStatus;
    data['user_id'] = userId;
    data['casual_leaves'] = casualLeaves;
    data['sick_leaves'] = sickLeaves;
    data['no_of_day_leaves'] = noOfDayLeaves;
    data['shift_start'] = shiftStart;
    data['shift_end'] = shiftEnd;
    data['isMonday'] = isMonday;
    data['isTuesday'] = isTuesday;
    data['isWednesday'] = isWednesday;
    data['isThursday'] = isThursday;
    data['isFriday'] = isFriday;
    data['is2Saturday'] = is2Saturday;
    data['is4Saturday'] = is4Saturday;
    data['isSunday'] = isSunday;
    data['is_salary'] = isSalary;
    data['company_id'] = companyId;
    data['manager'] = manager;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
