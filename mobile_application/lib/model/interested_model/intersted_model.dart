class InterstedModel {
  InterstedModel({
      this.status, 
      this.message, 
      this.data,});

  InterstedModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  String? status;
  String? message;
  List<Data>? data;
InterstedModel copyWith({  String? status,
  String? message,
  List<Data>? data,
}) => InterstedModel(  status: status ?? this.status,
  message: message ?? this.message,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.name,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    select = false;
  }
  num? id;
  String? name;
  bool ? select;
Data copyWith({  num? id,
  String? name,
}) => Data(  id: id ?? this.id,
  name: name ?? this.name,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}