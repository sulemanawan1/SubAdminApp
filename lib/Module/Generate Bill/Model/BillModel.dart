/// success : true
/// data : [{"id":109,"charges":3000,"chargesafterduedate":3150,"appcharges":60,"tax":450,"balance":3000,"subadminid":2,"residentid":8,"propertyid":1,"measurementid":13,"duedate":"2023-02-28","billstartdate":"2023-02-21","billenddate":"2023-02-23","month":"February 2023","status":0,"created_at":"2023-02-21T14:19:50.000000Z","updated_at":"2023-02-21T14:19:50.000000Z","firstname":"iqra","lastname":"khan","image":"1676970960.jpg","cnic":"01"},{"id":110,"charges":10000,"chargesafterduedate":10500,"appcharges":200,"tax":1500,"balance":10000,"subadminid":2,"residentid":10,"propertyid":3,"measurementid":15,"duedate":"2023-02-28","billstartdate":"2023-02-21","billenddate":"2023-02-23","month":"February 2023","status":0,"created_at":"2023-02-21T14:19:50.000000Z","updated_at":"2023-02-21T14:19:50.000000Z","firstname":"ahahh","lastname":"hshsh","image":"1676971112.jpg","cnic":"555"}]

class BillModel {
  BillModel({
      bool? success, 
      List<Data>? data,}){
    _success = success;
    _data = data;
}

  BillModel.fromJson(dynamic json) {
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
BillModel copyWith({  bool? success,
  List<Data>? data,
}) => BillModel(  success: success ?? _success,
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

/// id : 109
/// charges : 3000
/// chargesafterduedate : 3150
/// appcharges : 60
/// tax : 450
/// balance : 3000
/// subadminid : 2
/// residentid : 8
/// propertyid : 1
/// measurementid : 13
/// duedate : "2023-02-28"
/// billstartdate : "2023-02-21"
/// billenddate : "2023-02-23"
/// month : "February 2023"
/// status : 0
/// created_at : "2023-02-21T14:19:50.000000Z"
/// updated_at : "2023-02-21T14:19:50.000000Z"
/// firstname : "iqra"
/// lastname : "khan"
/// image : "1676970960.jpg"
/// cnic : "01"

class Data {
  Data({
      num? id, 
      num? charges, 
      num? chargesafterduedate, 
      num? appcharges, 
      num? tax, 
      num? balance, 
      num? subadminid, 
      num? residentid, 
      num? propertyid, 
      num? measurementid, 
      String? duedate, 
      String? billstartdate, 
      String? billenddate, 
      String? month, 
      num? status, 
      String? createdAt, 
      String? updatedAt, 
      String? firstname, 
      String? lastname, 
      String? image, 
      String? cnic,}){
    _id = id;
    _charges = charges;
    _chargesafterduedate = chargesafterduedate;
    _appcharges = appcharges;
    _tax = tax;
    _balance = balance;
    _subadminid = subadminid;
    _residentid = residentid;
    _propertyid = propertyid;
    _measurementid = measurementid;
    _duedate = duedate;
    _billstartdate = billstartdate;
    _billenddate = billenddate;
    _month = month;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _firstname = firstname;
    _lastname = lastname;
    _image = image;
    _cnic = cnic;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _charges = json['charges'];
    _chargesafterduedate = json['chargesafterduedate'];
    _appcharges = json['appcharges'];
    _tax = json['tax'];
    _balance = json['balance'];
    _subadminid = json['subadminid'];
    _residentid = json['residentid'];
    _propertyid = json['propertyid'];
    _measurementid = json['measurementid'];
    _duedate = json['duedate'];
    _billstartdate = json['billstartdate'];
    _billenddate = json['billenddate'];
    _month = json['month'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _image = json['image'];
    _cnic = json['cnic'];
  }
  num? _id;
  num? _charges;
  num? _chargesafterduedate;
  num? _appcharges;
  num? _tax;
  num? _balance;
  num? _subadminid;
  num? _residentid;
  num? _propertyid;
  num? _measurementid;
  String? _duedate;
  String? _billstartdate;
  String? _billenddate;
  String? _month;
  num? _status;
  String? _createdAt;
  String? _updatedAt;
  String? _firstname;
  String? _lastname;
  String? _image;
  String? _cnic;
Data copyWith({  num? id,
  num? charges,
  num? chargesafterduedate,
  num? appcharges,
  num? tax,
  num? balance,
  num? subadminid,
  num? residentid,
  num? propertyid,
  num? measurementid,
  String? duedate,
  String? billstartdate,
  String? billenddate,
  String? month,
  num? status,
  String? createdAt,
  String? updatedAt,
  String? firstname,
  String? lastname,
  String? image,
  String? cnic,
}) => Data(  id: id ?? _id,
  charges: charges ?? _charges,
  chargesafterduedate: chargesafterduedate ?? _chargesafterduedate,
  appcharges: appcharges ?? _appcharges,
  tax: tax ?? _tax,
  balance: balance ?? _balance,
  subadminid: subadminid ?? _subadminid,
  residentid: residentid ?? _residentid,
  propertyid: propertyid ?? _propertyid,
  measurementid: measurementid ?? _measurementid,
  duedate: duedate ?? _duedate,
  billstartdate: billstartdate ?? _billstartdate,
  billenddate: billenddate ?? _billenddate,
  month: month ?? _month,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  firstname: firstname ?? _firstname,
  lastname: lastname ?? _lastname,
  image: image ?? _image,
  cnic: cnic ?? _cnic,
);
  num? get id => _id;
  num? get charges => _charges;
  num? get chargesafterduedate => _chargesafterduedate;
  num? get appcharges => _appcharges;
  num? get tax => _tax;
  num? get balance => _balance;
  num? get subadminid => _subadminid;
  num? get residentid => _residentid;
  num? get propertyid => _propertyid;
  num? get measurementid => _measurementid;
  String? get duedate => _duedate;
  String? get billstartdate => _billstartdate;
  String? get billenddate => _billenddate;
  String? get month => _month;
  num? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get firstname => _firstname;
  String? get lastname => _lastname;
  String? get image => _image;
  String? get cnic => _cnic;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['charges'] = _charges;
    map['chargesafterduedate'] = _chargesafterduedate;
    map['appcharges'] = _appcharges;
    map['tax'] = _tax;
    map['balance'] = _balance;
    map['subadminid'] = _subadminid;
    map['residentid'] = _residentid;
    map['propertyid'] = _propertyid;
    map['measurementid'] = _measurementid;
    map['duedate'] = _duedate;
    map['billstartdate'] = _billstartdate;
    map['billenddate'] = _billenddate;
    map['month'] = _month;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['firstname'] = _firstname;
    map['lastname'] = _lastname;
    map['image'] = _image;
    map['cnic'] = _cnic;
    return map;
  }

}