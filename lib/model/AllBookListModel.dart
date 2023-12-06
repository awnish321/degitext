class AllBookListModel {
  AllBookListModel({
      String? status, 
      String? message, 
      List<BooksData>? booksData,}){
    _status = status;
    _message = message;
    _booksData = booksData;
}

  AllBookListModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['booksData'] != null) {
      _booksData = [];
      json['booksData'].forEach((v) {_booksData?.add(BooksData.fromJson(v));});
    }
  }
  String? _status;
  String? _message;
  List<BooksData>? _booksData;

  String? get status => _status;
  String? get message => _message;
  List<BooksData>? get booksData => _booksData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_booksData != null) {
      map['booksData'] = _booksData?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
class BooksData {
  BooksData({
      int? productId, 
      String? category, 
      int? bookMrp, 
      double? bookPrice, 
      int? bookPerDiscount, 
      String? productTitle, 
      String? isbn, 
      String? mainImage, 
      int? paperbookPublish, 
      int? ebookPublish, 
      int? iebookPublish, 
      int? cdPublish, 
      String? slug, 
      int? categoryId,}){
    _productId = productId;
    _category = category;
    _bookMrp = bookMrp;
    _bookPrice = bookPrice;
    _bookPerDiscount = bookPerDiscount;
    _productTitle = productTitle;
    _isbn = isbn;
    _mainImage = mainImage;
    _paperbookPublish = paperbookPublish;
    _ebookPublish = ebookPublish;
    _iebookPublish = iebookPublish;
    _cdPublish = cdPublish;
    _slug = slug;
    _categoryId = categoryId;
}

  BooksData.fromJson(dynamic json) {
    _productId = json['productId'];
    _category = json['category'];
    _bookMrp = json['book_mrp'];
    _bookPrice = json['book_price'];
    _bookPerDiscount = json['book_perDiscount'];
    _productTitle = json['product_title'];
    _isbn = json['isbn'];
    _mainImage = json['main_image'];
    _paperbookPublish = json['paperbook_publish'];
    _ebookPublish = json['ebook_publish'];
    _iebookPublish = json['iebook_publish'];
    _cdPublish = json['cd_publish'];
    _slug = json['slug'];
    _categoryId = json['categoryId'];
  }
  int? _productId;
  String? _category;
  int? _bookMrp;
  double? _bookPrice;
  int? _bookPerDiscount;
  String? _productTitle;
  String? _isbn;
  String? _mainImage;
  int? _paperbookPublish;
  int? _ebookPublish;
  int? _iebookPublish;
  int? _cdPublish;
  String? _slug;
  int? _categoryId;

  int? get productId => _productId;
  String? get category => _category;
  int? get bookMrp => _bookMrp;
  double? get bookPrice => _bookPrice;
  int? get bookPerDiscount => _bookPerDiscount;
  String? get productTitle => _productTitle;
  String? get isbn => _isbn;
  String? get mainImage => _mainImage;
  int? get paperbookPublish => _paperbookPublish;
  int? get ebookPublish => _ebookPublish;
  int? get iebookPublish => _iebookPublish;
  int? get cdPublish => _cdPublish;
  String? get slug => _slug;
  int? get categoryId => _categoryId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productId'] = _productId;
    map['category'] = _category;
    map['book_mrp'] = _bookMrp;
    map['book_price'] = _bookPrice;
    map['book_perDiscount'] = _bookPerDiscount;
    map['product_title'] = _productTitle;
    map['isbn'] = _isbn;
    map['main_image'] = _mainImage;
    map['paperbook_publish'] = _paperbookPublish;
    map['ebook_publish'] = _ebookPublish;
    map['iebook_publish'] = _iebookPublish;
    map['cd_publish'] = _cdPublish;
    map['slug'] = _slug;
    map['categoryId'] = _categoryId;
    return map;
  }

}