/// success : true
/// data : [{"id":24,"residentid":24,"subadminid":2,"country":"🇵🇰    Pakistan","state":"Azad Kashmir","city":"Kotli District","houseaddress":"Apartment 1","vechileno":"","residenttype":"Rental","propertytype":"apartment","committeemember":0,"status":0,"created_at":"2023-02-26T10:11:20.000000Z","updated_at":"2023-02-26T10:12:06.000000Z","societyid":1,"pid":4,"buildingid":3,"societybuildingfloorid":14,"societybuildingapartmentid":63,"measurementid":5,"firstname":"noman","lastname":"khan","cnic":"12345","address":"---","mobileno":"03007901355","password":"$2y$10$o4C8zTDD0pXj.T2Zvg6ENOgzc5zPTr2y8QSbhD.gu0Q7/k2iAJufW","roleid":3,"rolename":"resident","image":"1677406280.jpg","fcmtoken":"cAvL8GMfQ_qxGu7zcutJHb:APA91bEDbAF3zML2p_Ud-9bEx9fRX9L9jbXCWN-Lr9J4CnHXyNLPGWY-IWZPcsKPw_v5sEKjN8fI2L_0K3eHe6GIH_FFVqFH0fgHUEvz6e_FAgcEFy6E74k1HLz-lXsv6iioiysfi6ai","society":[{"id":1,"country":"🇵🇰    Pakistan","state":"Azad Kashmir","city":"Mirpur District","area":"Rawat","type":"society","name":"Rawat Enclave","address":"Kallar","superadminid":1,"created_at":"2023-02-24T10:02:28.000000Z","updated_at":"2023-02-24T10:02:28.000000Z"}],"phase":[{"id":4,"name":"Phase 1","subadminid":2,"societyid":1,"created_at":"2023-02-25T13:43:41.000000Z","updated_at":"2023-02-25T13:43:41.000000Z"}],"building":[{"id":3,"pid":4,"societybuildingname":"civic center","created_at":"2023-02-25T13:47:38.000000Z","updated_at":"2023-02-25T13:47:38.000000Z"}],"floor":[{"id":14,"name":"Floor 1","buildingid":3,"created_at":"2023-02-25T13:47:45.000000Z","updated_at":"2023-02-25T13:47:45.000000Z"}],"apartment":[{"id":63,"societybuildingfloorid":14,"name":"Apartment 1","typeid":1,"type":"apartment","created_at":"2023-02-25T13:47:54.000000Z","updated_at":"2023-02-25T13:47:54.000000Z"}],"measurement":[{"id":5,"subadminid":2,"type":"apartment","unit":"sqft","charges":5000,"chargesafterduedate":5250,"appcharges":100,"tax":750,"area":500,"bedrooms":3,"status":0,"created_at":"2023-02-25T13:43:17.000000Z","updated_at":"2023-02-25T13:43:17.000000Z"}],"owner":[{"id":5,"residentid":24,"ownername":"iqra","owneraddress":"NA","ownermobileno":"naaz","created_at":"2023-02-26T10:12:06.000000Z","updated_at":"2023-02-26T10:12:06.000000Z"}]}]

class ApartmentResident {
  ApartmentResident({
      bool? success, 
      List<Data>? data,}){
    _success = success;
    _data = data;
}

  ApartmentResident.fromJson(dynamic json) {
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
ApartmentResident copyWith({  bool? success,
  List<Data>? data,
}) => ApartmentResident(  success: success ?? _success,
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

/// id : 24
/// residentid : 24
/// subadminid : 2
/// country : "🇵🇰    Pakistan"
/// state : "Azad Kashmir"
/// city : "Kotli District"
/// houseaddress : "Apartment 1"
/// vechileno : ""
/// residenttype : "Rental"
/// propertytype : "apartment"
/// committeemember : 0
/// status : 0
/// created_at : "2023-02-26T10:11:20.000000Z"
/// updated_at : "2023-02-26T10:12:06.000000Z"
/// societyid : 1
/// pid : 4
/// buildingid : 3
/// societybuildingfloorid : 14
/// societybuildingapartmentid : 63
/// measurementid : 5
/// firstname : "noman"
/// lastname : "khan"
/// cnic : "12345"
/// address : "---"
/// mobileno : "03007901355"
/// password : "$2y$10$o4C8zTDD0pXj.T2Zvg6ENOgzc5zPTr2y8QSbhD.gu0Q7/k2iAJufW"
/// roleid : 3
/// rolename : "resident"
/// image : "1677406280.jpg"
/// fcmtoken : "cAvL8GMfQ_qxGu7zcutJHb:APA91bEDbAF3zML2p_Ud-9bEx9fRX9L9jbXCWN-Lr9J4CnHXyNLPGWY-IWZPcsKPw_v5sEKjN8fI2L_0K3eHe6GIH_FFVqFH0fgHUEvz6e_FAgcEFy6E74k1HLz-lXsv6iioiysfi6ai"
/// society : [{"id":1,"country":"🇵🇰    Pakistan","state":"Azad Kashmir","city":"Mirpur District","area":"Rawat","type":"society","name":"Rawat Enclave","address":"Kallar","superadminid":1,"created_at":"2023-02-24T10:02:28.000000Z","updated_at":"2023-02-24T10:02:28.000000Z"}]
/// phase : [{"id":4,"name":"Phase 1","subadminid":2,"societyid":1,"created_at":"2023-02-25T13:43:41.000000Z","updated_at":"2023-02-25T13:43:41.000000Z"}]
/// building : [{"id":3,"pid":4,"societybuildingname":"civic center","created_at":"2023-02-25T13:47:38.000000Z","updated_at":"2023-02-25T13:47:38.000000Z"}]
/// floor : [{"id":14,"name":"Floor 1","buildingid":3,"created_at":"2023-02-25T13:47:45.000000Z","updated_at":"2023-02-25T13:47:45.000000Z"}]
/// apartment : [{"id":63,"societybuildingfloorid":14,"name":"Apartment 1","typeid":1,"type":"apartment","created_at":"2023-02-25T13:47:54.000000Z","updated_at":"2023-02-25T13:47:54.000000Z"}]
/// measurement : [{"id":5,"subadminid":2,"type":"apartment","unit":"sqft","charges":5000,"chargesafterduedate":5250,"appcharges":100,"tax":750,"area":500,"bedrooms":3,"status":0,"created_at":"2023-02-25T13:43:17.000000Z","updated_at":"2023-02-25T13:43:17.000000Z"}]
/// owner : [{"id":5,"residentid":24,"ownername":"iqra","owneraddress":"NA","ownermobileno":"naaz","created_at":"2023-02-26T10:12:06.000000Z","updated_at":"2023-02-26T10:12:06.000000Z"}]

class Data {
  Data({
      num? id, 
      num? residentid, 
      num? subadminid, 
      String? country, 
      String? state, 
      String? city, 
      String? houseaddress, 
      String? vechileno, 
      String? residenttype, 
      String? propertytype, 
      num? committeemember, 
      num? status, 
      String? createdAt, 
      String? updatedAt, 
      num? societyid, 
      num? pid, 
      num? buildingid, 
      num? societybuildingfloorid, 
      num? societybuildingapartmentid, 
      num? measurementid, 
      String? firstname, 
      String? lastname, 
      String? cnic, 
      String? address, 
      String? mobileno, 
      String? password, 
      num? roleid, 
      String? rolename, 
      String? image, 
      String? fcmtoken, 
      List<Society>? society, 
      List<Phase>? phase, 
      List<Building>? building, 
      List<Floor>? floor, 
      List<Apartment>? apartment, 
      List<Measurement>? measurement, 
      List<Owner>? owner,}){
    _id = id;
    _residentid = residentid;
    _subadminid = subadminid;
    _country = country;
    _state = state;
    _city = city;
    _houseaddress = houseaddress;
    _vechileno = vechileno;
    _residenttype = residenttype;
    _propertytype = propertytype;
    _committeemember = committeemember;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _societyid = societyid;
    _pid = pid;
    _buildingid = buildingid;
    _societybuildingfloorid = societybuildingfloorid;
    _societybuildingapartmentid = societybuildingapartmentid;
    _measurementid = measurementid;
    _firstname = firstname;
    _lastname = lastname;
    _cnic = cnic;
    _address = address;
    _mobileno = mobileno;
    _password = password;
    _roleid = roleid;
    _rolename = rolename;
    _image = image;
    _fcmtoken = fcmtoken;
    _society = society;
    _phase = phase;
    _building = building;
    _floor = floor;
    _apartment = apartment;
    _measurement = measurement;
    _owner = owner;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _residentid = json['residentid'];
    _subadminid = json['subadminid'];
    _country = json['country'];
    _state = json['state'];
    _city = json['city'];
    _houseaddress = json['houseaddress'];
    _vechileno = json['vechileno'];
    _residenttype = json['residenttype'];
    _propertytype = json['propertytype'];
    _committeemember = json['committeemember'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _societyid = json['societyid'];
    _pid = json['pid'];
    _buildingid = json['buildingid'];
    _societybuildingfloorid = json['societybuildingfloorid'];
    _societybuildingapartmentid = json['societybuildingapartmentid'];
    _measurementid = json['measurementid'];
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _cnic = json['cnic'];
    _address = json['address'];
    _mobileno = json['mobileno'];
    _password = json['password'];
    _roleid = json['roleid'];
    _rolename = json['rolename'];
    _image = json['image'];
    _fcmtoken = json['fcmtoken'];
    if (json['society'] != null) {
      _society = [];
      json['society'].forEach((v) {
        _society?.add(Society.fromJson(v));
      });
    }
    if (json['phase'] != null) {
      _phase = [];
      json['phase'].forEach((v) {
        _phase?.add(Phase.fromJson(v));
      });
    }
    if (json['building'] != null) {
      _building = [];
      json['building'].forEach((v) {
        _building?.add(Building.fromJson(v));
      });
    }
    if (json['floor'] != null) {
      _floor = [];
      json['floor'].forEach((v) {
        _floor?.add(Floor.fromJson(v));
      });
    }
    if (json['apartment'] != null) {
      _apartment = [];
      json['apartment'].forEach((v) {
        _apartment?.add(Apartment.fromJson(v));
      });
    }
    if (json['measurement'] != null) {
      _measurement = [];
      json['measurement'].forEach((v) {
        _measurement?.add(Measurement.fromJson(v));
      });
    }
    if (json['owner'] != null) {
      _owner = [];
      json['owner'].forEach((v) {
        _owner?.add(Owner.fromJson(v));
      });
    }
  }
  num? _id;
  num? _residentid;
  num? _subadminid;
  String? _country;
  String? _state;
  String? _city;
  String? _houseaddress;
  String? _vechileno;
  String? _residenttype;
  String? _propertytype;
  num? _committeemember;
  num? _status;
  String? _createdAt;
  String? _updatedAt;
  num? _societyid;
  num? _pid;
  num? _buildingid;
  num? _societybuildingfloorid;
  num? _societybuildingapartmentid;
  num? _measurementid;
  String? _firstname;
  String? _lastname;
  String? _cnic;
  String? _address;
  String? _mobileno;
  String? _password;
  num? _roleid;
  String? _rolename;
  String? _image;
  String? _fcmtoken;
  List<Society>? _society;
  List<Phase>? _phase;
  List<Building>? _building;
  List<Floor>? _floor;
  List<Apartment>? _apartment;
  List<Measurement>? _measurement;
  List<Owner>? _owner;
Data copyWith({  num? id,
  num? residentid,
  num? subadminid,
  String? country,
  String? state,
  String? city,
  String? houseaddress,
  String? vechileno,
  String? residenttype,
  String? propertytype,
  num? committeemember,
  num? status,
  String? createdAt,
  String? updatedAt,
  num? societyid,
  num? pid,
  num? buildingid,
  num? societybuildingfloorid,
  num? societybuildingapartmentid,
  num? measurementid,
  String? firstname,
  String? lastname,
  String? cnic,
  String? address,
  String? mobileno,
  String? password,
  num? roleid,
  String? rolename,
  String? image,
  String? fcmtoken,
  List<Society>? society,
  List<Phase>? phase,
  List<Building>? building,
  List<Floor>? floor,
  List<Apartment>? apartment,
  List<Measurement>? measurement,
  List<Owner>? owner,
}) => Data(  id: id ?? _id,
  residentid: residentid ?? _residentid,
  subadminid: subadminid ?? _subadminid,
  country: country ?? _country,
  state: state ?? _state,
  city: city ?? _city,
  houseaddress: houseaddress ?? _houseaddress,
  vechileno: vechileno ?? _vechileno,
  residenttype: residenttype ?? _residenttype,
  propertytype: propertytype ?? _propertytype,
  committeemember: committeemember ?? _committeemember,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  societyid: societyid ?? _societyid,
  pid: pid ?? _pid,
  buildingid: buildingid ?? _buildingid,
  societybuildingfloorid: societybuildingfloorid ?? _societybuildingfloorid,
  societybuildingapartmentid: societybuildingapartmentid ?? _societybuildingapartmentid,
  measurementid: measurementid ?? _measurementid,
  firstname: firstname ?? _firstname,
  lastname: lastname ?? _lastname,
  cnic: cnic ?? _cnic,
  address: address ?? _address,
  mobileno: mobileno ?? _mobileno,
  password: password ?? _password,
  roleid: roleid ?? _roleid,
  rolename: rolename ?? _rolename,
  image: image ?? _image,
  fcmtoken: fcmtoken ?? _fcmtoken,
  society: society ?? _society,
  phase: phase ?? _phase,
  building: building ?? _building,
  floor: floor ?? _floor,
  apartment: apartment ?? _apartment,
  measurement: measurement ?? _measurement,
  owner: owner ?? _owner,
);
  num? get id => _id;
  num? get residentid => _residentid;
  num? get subadminid => _subadminid;
  String? get country => _country;
  String? get state => _state;
  String? get city => _city;
  String? get houseaddress => _houseaddress;
  String? get vechileno => _vechileno;
  String? get residenttype => _residenttype;
  String? get propertytype => _propertytype;
  num? get committeemember => _committeemember;
  num? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get societyid => _societyid;
  num? get pid => _pid;
  num? get buildingid => _buildingid;
  num? get societybuildingfloorid => _societybuildingfloorid;
  num? get societybuildingapartmentid => _societybuildingapartmentid;
  num? get measurementid => _measurementid;
  String? get firstname => _firstname;
  String? get lastname => _lastname;
  String? get cnic => _cnic;
  String? get address => _address;
  String? get mobileno => _mobileno;
  String? get password => _password;
  num? get roleid => _roleid;
  String? get rolename => _rolename;
  String? get image => _image;
  String? get fcmtoken => _fcmtoken;
  List<Society>? get society => _society;
  List<Phase>? get phase => _phase;
  List<Building>? get building => _building;
  List<Floor>? get floor => _floor;
  List<Apartment>? get apartment => _apartment;
  List<Measurement>? get measurement => _measurement;
  List<Owner>? get owner => _owner;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['residentid'] = _residentid;
    map['subadminid'] = _subadminid;
    map['country'] = _country;
    map['state'] = _state;
    map['city'] = _city;
    map['houseaddress'] = _houseaddress;
    map['vechileno'] = _vechileno;
    map['residenttype'] = _residenttype;
    map['propertytype'] = _propertytype;
    map['committeemember'] = _committeemember;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['societyid'] = _societyid;
    map['pid'] = _pid;
    map['buildingid'] = _buildingid;
    map['societybuildingfloorid'] = _societybuildingfloorid;
    map['societybuildingapartmentid'] = _societybuildingapartmentid;
    map['measurementid'] = _measurementid;
    map['firstname'] = _firstname;
    map['lastname'] = _lastname;
    map['cnic'] = _cnic;
    map['address'] = _address;
    map['mobileno'] = _mobileno;
    map['password'] = _password;
    map['roleid'] = _roleid;
    map['rolename'] = _rolename;
    map['image'] = _image;
    map['fcmtoken'] = _fcmtoken;
    if (_society != null) {
      map['society'] = _society?.map((v) => v.toJson()).toList();
    }
    if (_phase != null) {
      map['phase'] = _phase?.map((v) => v.toJson()).toList();
    }
    if (_building != null) {
      map['building'] = _building?.map((v) => v.toJson()).toList();
    }
    if (_floor != null) {
      map['floor'] = _floor?.map((v) => v.toJson()).toList();
    }
    if (_apartment != null) {
      map['apartment'] = _apartment?.map((v) => v.toJson()).toList();
    }
    if (_measurement != null) {
      map['measurement'] = _measurement?.map((v) => v.toJson()).toList();
    }
    if (_owner != null) {
      map['owner'] = _owner?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 5
/// residentid : 24
/// ownername : "iqra"
/// owneraddress : "NA"
/// ownermobileno : "naaz"
/// created_at : "2023-02-26T10:12:06.000000Z"
/// updated_at : "2023-02-26T10:12:06.000000Z"

class Owner {
  Owner({
      num? id, 
      num? residentid, 
      String? ownername, 
      String? owneraddress, 
      String? ownermobileno, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _residentid = residentid;
    _ownername = ownername;
    _owneraddress = owneraddress;
    _ownermobileno = ownermobileno;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Owner.fromJson(dynamic json) {
    _id = json['id'];
    _residentid = json['residentid'];
    _ownername = json['ownername'];
    _owneraddress = json['owneraddress'];
    _ownermobileno = json['ownermobileno'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _residentid;
  String? _ownername;
  String? _owneraddress;
  String? _ownermobileno;
  String? _createdAt;
  String? _updatedAt;
Owner copyWith({  num? id,
  num? residentid,
  String? ownername,
  String? owneraddress,
  String? ownermobileno,
  String? createdAt,
  String? updatedAt,
}) => Owner(  id: id ?? _id,
  residentid: residentid ?? _residentid,
  ownername: ownername ?? _ownername,
  owneraddress: owneraddress ?? _owneraddress,
  ownermobileno: ownermobileno ?? _ownermobileno,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get residentid => _residentid;
  String? get ownername => _ownername;
  String? get owneraddress => _owneraddress;
  String? get ownermobileno => _ownermobileno;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['residentid'] = _residentid;
    map['ownername'] = _ownername;
    map['owneraddress'] = _owneraddress;
    map['ownermobileno'] = _ownermobileno;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// id : 5
/// subadminid : 2
/// type : "apartment"
/// unit : "sqft"
/// charges : 5000
/// chargesafterduedate : 5250
/// appcharges : 100
/// tax : 750
/// area : 500
/// bedrooms : 3
/// status : 0
/// created_at : "2023-02-25T13:43:17.000000Z"
/// updated_at : "2023-02-25T13:43:17.000000Z"

class Measurement {
  Measurement({
      num? id, 
      num? subadminid, 
      String? type, 
      String? unit, 
      num? charges, 
      num? chargesafterduedate, 
      num? appcharges, 
      num? tax, 
      num? area, 
      num? bedrooms, 
      num? status, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _subadminid = subadminid;
    _type = type;
    _unit = unit;
    _charges = charges;
    _chargesafterduedate = chargesafterduedate;
    _appcharges = appcharges;
    _tax = tax;
    _area = area;
    _bedrooms = bedrooms;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Measurement.fromJson(dynamic json) {
    _id = json['id'];
    _subadminid = json['subadminid'];
    _type = json['type'];
    _unit = json['unit'];
    _charges = json['charges'];
    _chargesafterduedate = json['chargesafterduedate'];
    _appcharges = json['appcharges'];
    _tax = json['tax'];
    _area = json['area'];
    _bedrooms = json['bedrooms'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _subadminid;
  String? _type;
  String? _unit;
  num? _charges;
  num? _chargesafterduedate;
  num? _appcharges;
  num? _tax;
  num? _area;
  num? _bedrooms;
  num? _status;
  String? _createdAt;
  String? _updatedAt;
Measurement copyWith({  num? id,
  num? subadminid,
  String? type,
  String? unit,
  num? charges,
  num? chargesafterduedate,
  num? appcharges,
  num? tax,
  num? area,
  num? bedrooms,
  num? status,
  String? createdAt,
  String? updatedAt,
}) => Measurement(  id: id ?? _id,
  subadminid: subadminid ?? _subadminid,
  type: type ?? _type,
  unit: unit ?? _unit,
  charges: charges ?? _charges,
  chargesafterduedate: chargesafterduedate ?? _chargesafterduedate,
  appcharges: appcharges ?? _appcharges,
  tax: tax ?? _tax,
  area: area ?? _area,
  bedrooms: bedrooms ?? _bedrooms,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get subadminid => _subadminid;
  String? get type => _type;
  String? get unit => _unit;
  num? get charges => _charges;
  num? get chargesafterduedate => _chargesafterduedate;
  num? get appcharges => _appcharges;
  num? get tax => _tax;
  num? get area => _area;
  num? get bedrooms => _bedrooms;
  num? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['subadminid'] = _subadminid;
    map['type'] = _type;
    map['unit'] = _unit;
    map['charges'] = _charges;
    map['chargesafterduedate'] = _chargesafterduedate;
    map['appcharges'] = _appcharges;
    map['tax'] = _tax;
    map['area'] = _area;
    map['bedrooms'] = _bedrooms;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// id : 63
/// societybuildingfloorid : 14
/// name : "Apartment 1"
/// typeid : 1
/// type : "apartment"
/// created_at : "2023-02-25T13:47:54.000000Z"
/// updated_at : "2023-02-25T13:47:54.000000Z"

class Apartment {
  Apartment({
      num? id, 
      num? societybuildingfloorid, 
      String? name, 
      num? typeid, 
      String? type, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _societybuildingfloorid = societybuildingfloorid;
    _name = name;
    _typeid = typeid;
    _type = type;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Apartment.fromJson(dynamic json) {
    _id = json['id'];
    _societybuildingfloorid = json['societybuildingfloorid'];
    _name = json['name'];
    _typeid = json['typeid'];
    _type = json['type'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _societybuildingfloorid;
  String? _name;
  num? _typeid;
  String? _type;
  String? _createdAt;
  String? _updatedAt;
Apartment copyWith({  num? id,
  num? societybuildingfloorid,
  String? name,
  num? typeid,
  String? type,
  String? createdAt,
  String? updatedAt,
}) => Apartment(  id: id ?? _id,
  societybuildingfloorid: societybuildingfloorid ?? _societybuildingfloorid,
  name: name ?? _name,
  typeid: typeid ?? _typeid,
  type: type ?? _type,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get societybuildingfloorid => _societybuildingfloorid;
  String? get name => _name;
  num? get typeid => _typeid;
  String? get type => _type;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['societybuildingfloorid'] = _societybuildingfloorid;
    map['name'] = _name;
    map['typeid'] = _typeid;
    map['type'] = _type;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// id : 14
/// name : "Floor 1"
/// buildingid : 3
/// created_at : "2023-02-25T13:47:45.000000Z"
/// updated_at : "2023-02-25T13:47:45.000000Z"

class Floor {
  Floor({
      num? id, 
      String? name, 
      num? buildingid, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _buildingid = buildingid;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Floor.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _buildingid = json['buildingid'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  num? _buildingid;
  String? _createdAt;
  String? _updatedAt;
Floor copyWith({  num? id,
  String? name,
  num? buildingid,
  String? createdAt,
  String? updatedAt,
}) => Floor(  id: id ?? _id,
  name: name ?? _name,
  buildingid: buildingid ?? _buildingid,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get name => _name;
  num? get buildingid => _buildingid;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['buildingid'] = _buildingid;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// id : 3
/// pid : 4
/// societybuildingname : "civic center"
/// created_at : "2023-02-25T13:47:38.000000Z"
/// updated_at : "2023-02-25T13:47:38.000000Z"

class Building {
  Building({
      num? id, 
      num? pid, 
      String? societybuildingname, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _pid = pid;
    _societybuildingname = societybuildingname;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Building.fromJson(dynamic json) {
    _id = json['id'];
    _pid = json['pid'];
    _societybuildingname = json['societybuildingname'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _pid;
  String? _societybuildingname;
  String? _createdAt;
  String? _updatedAt;
Building copyWith({  num? id,
  num? pid,
  String? societybuildingname,
  String? createdAt,
  String? updatedAt,
}) => Building(  id: id ?? _id,
  pid: pid ?? _pid,
  societybuildingname: societybuildingname ?? _societybuildingname,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get pid => _pid;
  String? get societybuildingname => _societybuildingname;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['pid'] = _pid;
    map['societybuildingname'] = _societybuildingname;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// id : 4
/// name : "Phase 1"
/// subadminid : 2
/// societyid : 1
/// created_at : "2023-02-25T13:43:41.000000Z"
/// updated_at : "2023-02-25T13:43:41.000000Z"

class Phase {
  Phase({
      num? id, 
      String? name, 
      num? subadminid, 
      num? societyid, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _subadminid = subadminid;
    _societyid = societyid;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Phase.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _subadminid = json['subadminid'];
    _societyid = json['societyid'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  num? _subadminid;
  num? _societyid;
  String? _createdAt;
  String? _updatedAt;
Phase copyWith({  num? id,
  String? name,
  num? subadminid,
  num? societyid,
  String? createdAt,
  String? updatedAt,
}) => Phase(  id: id ?? _id,
  name: name ?? _name,
  subadminid: subadminid ?? _subadminid,
  societyid: societyid ?? _societyid,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get name => _name;
  num? get subadminid => _subadminid;
  num? get societyid => _societyid;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['subadminid'] = _subadminid;
    map['societyid'] = _societyid;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// id : 1
/// country : "🇵🇰    Pakistan"
/// state : "Azad Kashmir"
/// city : "Mirpur District"
/// area : "Rawat"
/// type : "society"
/// name : "Rawat Enclave"
/// address : "Kallar"
/// superadminid : 1
/// created_at : "2023-02-24T10:02:28.000000Z"
/// updated_at : "2023-02-24T10:02:28.000000Z"

class Society {
  Society({
      num? id, 
      String? country, 
      String? state, 
      String? city, 
      String? area, 
      String? type, 
      String? name, 
      String? address, 
      num? superadminid, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _country = country;
    _state = state;
    _city = city;
    _area = area;
    _type = type;
    _name = name;
    _address = address;
    _superadminid = superadminid;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Society.fromJson(dynamic json) {
    _id = json['id'];
    _country = json['country'];
    _state = json['state'];
    _city = json['city'];
    _area = json['area'];
    _type = json['type'];
    _name = json['name'];
    _address = json['address'];
    _superadminid = json['superadminid'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _country;
  String? _state;
  String? _city;
  String? _area;
  String? _type;
  String? _name;
  String? _address;
  num? _superadminid;
  String? _createdAt;
  String? _updatedAt;
Society copyWith({  num? id,
  String? country,
  String? state,
  String? city,
  String? area,
  String? type,
  String? name,
  String? address,
  num? superadminid,
  String? createdAt,
  String? updatedAt,
}) => Society(  id: id ?? _id,
  country: country ?? _country,
  state: state ?? _state,
  city: city ?? _city,
  area: area ?? _area,
  type: type ?? _type,
  name: name ?? _name,
  address: address ?? _address,
  superadminid: superadminid ?? _superadminid,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get country => _country;
  String? get state => _state;
  String? get city => _city;
  String? get area => _area;
  String? get type => _type;
  String? get name => _name;
  String? get address => _address;
  num? get superadminid => _superadminid;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['country'] = _country;
    map['state'] = _state;
    map['city'] = _city;
    map['area'] = _area;
    map['type'] = _type;
    map['name'] = _name;
    map['address'] = _address;
    map['superadminid'] = _superadminid;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}