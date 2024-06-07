class BookShopModel {
  BookShopModel({
    String? status,
    String? message,
    List<ShopList>? shopList,
  }) {
    _status = status;
    _message = message;
    _shopList = shopList;
  }

  BookShopModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['shopList'] != null) {
      _shopList = [];
      json['shopList'].forEach((v) {
        _shopList?.add(ShopList.fromJson(v));
      });
    }
  }

  String? _status;
  String? _message;
  List<ShopList>? _shopList;

  String? get status => _status;

  String? get message => _message;

  List<ShopList>? get shopList => _shopList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_shopList != null) {
      map['shopList'] = _shopList?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class ShopList {
  shopList({
    String? shopName,
    String? shopAddress,
    String? shopPincode,
    String? shopMobile,
    String? shopEmailId,
    String? shopCity,
    String? shopCityId,
    String? shopState,
    String? shopStateId,
  }) {
    _shopName = shopName;
    _shopAddress = shopAddress;
    _shopPincode = shopPincode;
    _shopMobile = shopMobile;
    _shopEmailId = shopEmailId;
    _shopCity = shopCity;
    _shopCityId = shopCityId;
    _shopState = shopState;
    _shopStateId = shopStateId;
  }

  ShopList.fromJson(dynamic json) {
    _shopName = json['shopName'];
    _shopAddress = json['shopAddress'];
    _shopPincode = json['shopPincode'];
    _shopMobile = json['shopMobile'];
    _shopEmailId = json['shopEmailId'];
    _shopCity = json['shopCity'];
    _shopCityId = json['shopCityId'];
    _shopState = json['shopState'];
    _shopStateId = json['shopStateId'];
  }

  String? _shopName;
  String? _shopAddress;
  String? _shopPincode;
  String? _shopMobile;
  String? _shopEmailId;
  String? _shopCity;
  String? _shopCityId;
  String? _shopState;
  String? _shopStateId;

  String? get shopName => _shopName;

  String? get shopAddress => _shopAddress;

  String? get shopPincode => _shopPincode;

  String? get shopMobile => _shopMobile;

  String? get shopEmailId => _shopEmailId;

  String? get shopCity => _shopCity;

  String? get shopCityId => _shopCityId;

  String? get shopState => _shopState;

  String? get shopStateId => _shopStateId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['shopName'] = _shopName;
    map['shopAddress'] = _shopAddress;
    map['shopPincode'] = _shopPincode;
    map['shopMobile'] = _shopMobile;
    map['shopEmailId'] = _shopEmailId;
    map['shopCity'] = _shopCity;
    map['shopCityId'] = _shopCityId;
    map['shopState'] = _shopState;
    map['shopStateId'] = _shopStateId;
    return map;
  }
}

