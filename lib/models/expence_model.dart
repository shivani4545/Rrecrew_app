class ExpenceModel {
  String? name;
  int? id;
  int? userId;
  int? categoryTypeId;
  String? item;
  String? purchaseFrom;
  String? dateOfPurchase;
  int? amount;
  int? tlId;
  int? managerId;
  int? status;
  String? remarks;
  String? createdAt;
  String? updatedAt;

  ExpenceModel(
      {this.name,
      this.id,
      this.userId,
      this.categoryTypeId,
      this.item,
      this.purchaseFrom,
      this.dateOfPurchase,
      this.amount,
      this.tlId,
      this.managerId,
      this.status,
      this.remarks,
      this.createdAt,
      this.updatedAt});

  ExpenceModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    userId = json['user_id'];
    categoryTypeId = json['category_type_id'];
    item = json['item'];
    purchaseFrom = json['purchase_from'];
    dateOfPurchase = json['date_of_purchase'];
    amount = json['amount'];
    tlId = json['tl_id'];
    managerId = json['manager_id'];
    status = json['status'];
    remarks = json['remarks'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['user_id'] = userId;
    data['category_type_id'] = categoryTypeId;
    data['item'] = item;
    data['purchase_from'] = purchaseFrom;
    data['date_of_purchase'] = dateOfPurchase;
    data['amount'] = amount;
    data['tl_id'] = tlId;
    data['manager_id'] = managerId;
    data['status'] = status;
    data['remarks'] = remarks;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
