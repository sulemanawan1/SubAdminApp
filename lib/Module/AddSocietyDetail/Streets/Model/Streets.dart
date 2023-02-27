import 'dart:convert';
/// success : true
/// data : [{"id":59,"bid":342,"name":"Street 1","created_at":"2022-12-08T11:29:20.000000Z","updated_at":"2022-12-08T11:29:20.000000Z"},{"id":60,"bid":342,"name":"Street 2","created_at":"2022-12-08T11:29:20.000000Z","updated_at":"2022-12-08T11:29:20.000000Z"},{"id":61,"bid":342,"name":"Street 3","created_at":"2022-12-08T11:29:20.000000Z","updated_at":"2022-12-08T11:29:20.000000Z"},{"id":62,"bid":342,"name":"Street 4","created_at":"2022-12-08T11:29:20.000000Z","updated_at":"2022-12-08T11:29:20.000000Z"},{"id":63,"bid":342,"name":"Street 5","created_at":"2022-12-08T11:29:20.000000Z","updated_at":"2022-12-08T11:29:20.000000Z"}]

Streets streetsFromJson(String str) => Streets.fromJson(json.decode(str));
String streetsToJson(Streets data) => json.encode(data.toJson());
class Streets {
  Streets({
      bool? success, 
      List<Data>? data,}){
    _success = success;
    _data = data;
}

  Streets.fromJson(dynamic json) {
    _success = json['success'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _success;
  List<Data>? _data;
Streets copyWith({  bool? success,
  List<Data>? data,
}) => Streets(  success: success ?? _success,
  data: data ?? _data,
);
  bool? get success => _success;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 59
/// bid : 342
/// name : "Street 1"
/// created_at : "2022-12-08T11:29:20.000000Z"
/// updated_at : "2022-12-08T11:29:20.000000Z"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      int? id, 
      int? bid, 
      String? name, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _bid = bid;
    _name = name;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _bid = json['bid'];
    _name = json['name'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  int? _bid;
  String? _name;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  int? id,
  int? bid,
  String? name,
  String? createdAt,
  String? updatedAt,
}) => Data(  id: id ?? _id,
  bid: bid ?? _bid,
  name: name ?? _name,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  int? get id => _id;
  int? get bid => _bid;
  String? get name => _name;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['bid'] = _bid;
    map['name'] = _name;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}