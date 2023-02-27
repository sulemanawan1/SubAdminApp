import 'dart:convert';
/// success : true
/// data : [{"id":5,"sid":244,"address":"House no 1","created_at":"2022-12-09T10:00:04.000000Z","updated_at":"2022-12-09T10:00:04.000000Z"},{"id":6,"sid":244,"address":"House no 2","created_at":"2022-12-09T10:00:04.000000Z","updated_at":"2022-12-09T10:00:04.000000Z"},{"id":7,"sid":244,"address":"House no 3","created_at":"2022-12-09T10:00:04.000000Z","updated_at":"2022-12-09T10:00:04.000000Z"},{"id":8,"sid":244,"address":"House no 4","created_at":"2022-12-09T10:00:04.000000Z","updated_at":"2022-12-09T10:00:04.000000Z"}]
/// noofhouses : 4

Houses housesFromJson(String str) => Houses.fromJson(json.decode(str));
String housesToJson(Houses data) => json.encode(data.toJson());
class Houses {
  Houses({
      bool? success, 
      List<Data>? data, 
      int? noofhouses,}){
    _success = success;
    _data = data;
    _noofhouses = noofhouses;
}

  Houses.fromJson(dynamic json) {
    _success = json['success'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _noofhouses = json['noofhouses'];
  }
  bool? _success;
  List<Data>? _data;
  int? _noofhouses;
Houses copyWith({  bool? success,
  List<Data>? data,
  int? noofhouses,
}) => Houses(  success: success ?? _success,
  data: data ?? _data,
  noofhouses: noofhouses ?? _noofhouses,
);
  bool? get success => _success;
  List<Data>? get data => _data;
  int? get noofhouses => _noofhouses;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['noofhouses'] = _noofhouses;
    return map;
  }

}

/// id : 5
/// sid : 244
/// address : "House no 1"
/// created_at : "2022-12-09T10:00:04.000000Z"
/// updated_at : "2022-12-09T10:00:04.000000Z"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      int? id, 
      int? sid, 
      String? address, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _sid = sid;
    _address = address;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _sid = json['sid'];
    _address = json['address'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  int? _sid;
  String? _address;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  int? id,
  int? sid,
  String? address,
  String? createdAt,
  String? updatedAt,
}) => Data(  id: id ?? _id,
  sid: sid ?? _sid,
  address: address ?? _address,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  int? get id => _id;
  int? get sid => _sid;
  String? get address => _address;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['sid'] = _sid;
    map['address'] = _address;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}