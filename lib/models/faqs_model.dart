class FaqsModel {
  int? id;
  String? que;
  String? ans;
  String? createdAt;
  String? updatedAt;

  FaqsModel({this.id, this.que, this.ans, this.createdAt, this.updatedAt});

  FaqsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    que = json['que'];
    ans = json['ans'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['que'] = que;
    data['ans'] = ans;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
