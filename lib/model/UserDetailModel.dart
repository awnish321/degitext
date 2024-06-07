class UserDetailModel {
  UserDetailModel({
    String? status,
    String? message,
    List<UserData>? userData,
  }) {
    _status = status;
    _message = message;
    _userData = userData;
  }

  UserDetailModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['userData'] != null) {
      _userData = [];
      json['userData'].forEach((v) {
        _userData?.add(UserData.fromJson(v));
      });
    }
  }

  String? _status;
  String? _message;
  List<UserData>? _userData;

  String? get status => _status;

  String? get message => _message;

  List<UserData>? get userData => _userData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_userData != null) {
      map['userData'] = _userData?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class UserData {
  userData({
    String? id,
    String? name,
    String? mobile,
    String? address,
    String? city,
    String? state,
    String? country,
    String? zip,
    String? otp,
    String? apiToken,
  }) {
    _id = id;
    _name = name;
    _mobile = mobile;
    _address = address;
    _city = city;
    _state = state;
    _country = country;
    _zip = zip;
    _otp = otp;
    _apiToken = apiToken;
  }

  UserData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _mobile = json['mobile'];
    _address = json['address'];
    _city = json['city'];
    _state = json['state'];
    _country = json['country'];
    _zip = json['zip'];
    _otp = json['otp'];
    _apiToken = json['apiToken'];
  }

  String? _id;
  String? _name;
  String? _mobile;
  String? _address;
  String? _city;
  String? _state;
  String? _country;
  String? _zip;
  String? _otp;
  String? _apiToken;

  String? get id => _id;

  String? get name => _name;

  String? get mobile => _mobile;

  String? get address => _address;

  String? get city => _city;

  String? get state => _state;

  String? get country => _country;

  String? get zip => _zip;

  String? get otp => _otp;

  String? get apiToken => _apiToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['mobile'] = _mobile;
    map['address'] = _address;
    map['city'] = _city;
    map['state'] = _state;
    map['country'] = _country;
    map['zip'] = _zip;
    map['otp'] = _otp;
    map['apiToken'] = _apiToken;
    return map;
  }
}

