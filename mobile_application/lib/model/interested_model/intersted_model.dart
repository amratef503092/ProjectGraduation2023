class InterstedModel {
  InterstedModel({
      this.message, 
      this.statusCode, 
      this.data,});

  InterstedModel.fromJson(dynamic json) {
    message = json['message'];
    statusCode = json['statusCode'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  String? message;
  num? statusCode;
  List<Data>? data;
InterstedModel copyWith({  String? message,
  num? statusCode,
  List<Data>? data,
}) => InterstedModel(  message: message ?? this.message,
  statusCode: statusCode ?? this.statusCode,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusCode'] = statusCode;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.name,
    this.select = false
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    select = false;
  }
  num? id;
  String? name;
  bool ?select ;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}