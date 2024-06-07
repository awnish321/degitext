class AllProductListModel {
  AllProductListModel({
    String? status,
    String? message,
    List<ProductsData>? productsData,
  }) {
    _status = status;
    _message = message;
    _productsData = productsData;
  }

  AllProductListModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['productsData'] != null) {
      _productsData = [];
      json['productsData'].forEach((v) {
        _productsData?.add(ProductsData.fromJson(v));
      });
    }
  }

  String? _status;
  String? _message;
  List<ProductsData>? _productsData;

  String? get status => _status;

  String? get message => _message;

  List<ProductsData>? get productsData => _productsData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_productsData != null) {
      map['productsData'] = _productsData?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class ProductsData {
  productsData({
    String? productId,
    String? categoryId,
    String? bookMrp,
    String? bookPrice,
    String? bookPerDiscount,
    String? productTitle,
    String? imageUrl,
    String? className,
    String? subjectName,
  }) {
    _productId = productId;
    _categoryId = categoryId;
    _bookMrp = bookMrp;
    _bookPrice = bookPrice;
    _bookPerDiscount = bookPerDiscount;
    _productTitle = productTitle;
    _imageUrl = imageUrl;
    _className = className;
    _subjectName = subjectName;
  }

  ProductsData.fromJson(dynamic json) {
    _productId = json['productId'];
    _categoryId = json['categoryId'];
    _bookMrp = json['bookMrp'];
    _bookPrice = json['bookPrice'];
    _bookPerDiscount = json['bookPerDiscount'];
    _productTitle = json['productTitle'];
    _imageUrl = json['imageUrl'];
    _className = json['className'];
    _subjectName = json['subjectName'];
  }

  String? _productId;
  String? _categoryId;
  String? _bookMrp;
  String? _bookPrice;
  String? _bookPerDiscount;
  String? _productTitle;
  String? _imageUrl;
  String? _className;
  String? _subjectName;

  String? get productId => _productId;

  String? get categoryId => _categoryId;

  String? get bookMrp => _bookMrp;

  String? get bookPrice => _bookPrice;

  String? get bookPerDiscount => _bookPerDiscount;

  String? get productTitle => _productTitle;

  String? get imageUrl => _imageUrl;

  String? get className => _className;

  String? get subjectName => _subjectName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productId'] = _productId;
    map['categoryId'] = _categoryId;
    map['bookMrp'] = _bookMrp;
    map['bookPrice'] = _bookPrice;
    map['bookPerDiscount'] = _bookPerDiscount;
    map['productTitle'] = _productTitle;
    map['imageUrl'] = _imageUrl;
    map['className'] = _className;
    map['subjectName'] = _subjectName;
    return map;
  }


}

