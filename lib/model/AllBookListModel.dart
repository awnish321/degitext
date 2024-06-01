class AllBookListModel {
  AllBookListModel({
    String? status,
    String? message,
    List<BooksData>? booksData,
  }) {
    _status = status;
    _message = message;
    _booksData = booksData;
  }

  AllBookListModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['booksData'] != null) {
      _booksData = [];
      json['booksData'].forEach((v) {
        _booksData?.add(BooksData.fromJson(v));
      });
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
    String? productId,
    String? category,
    String? categoryId,
    String? bookMrp,
    String? bookPrice,
    String? bookPerDiscount,
    String? iebookPublish,
    String? ebookPublish,
    String? cdPublish,
    String? paperbookPublish,
    String? isbn,
    String? productTitle,
    String? imageUrl,
    String? className,
    String? subjectName,
    String? productUrl,
  }) {
    _productId = productId;
    _category = category;
    _categoryId = categoryId;
    _bookMrp = bookMrp;
    _bookPrice = bookPrice;
    _bookPerDiscount = bookPerDiscount;
    _iebookPublish = iebookPublish;
    _ebookPublish = ebookPublish;
    _cdPublish = cdPublish;
    _paperbookPublish = paperbookPublish;
    _isbn = isbn;
    _productTitle = productTitle;
    _imageUrl = imageUrl;
    _className = className;
    _subjectName = subjectName;
    _productUrl = productUrl;
  }

  BooksData.fromJson(dynamic json) {
    _productId = json['productId'];
    _category = json['category'];
    _categoryId = json['categoryId'];
    _bookMrp = json['book_mrp'];
    _bookPrice = json['book_price'];
    _bookPerDiscount = json['book_perDiscount'];
    _iebookPublish = json['iebook_publish'];
    _ebookPublish = json['ebook_publish'];
    _cdPublish = json['cd_publish'];
    _paperbookPublish = json['paperbook_publish'];
    _isbn = json['isbn'];
    _productTitle = json['product_title'];
    _imageUrl = json['imageUrl'];
    _className = json['className'];
    _subjectName = json['subjectName'];
    _productUrl = json['productUrl'];
  }

  String? _productId;
  String? _category;
  String? _categoryId;
  String? _bookMrp;
  String? _bookPrice;
  String? _bookPerDiscount;
  String? _iebookPublish;
  String? _ebookPublish;
  String? _cdPublish;
  String? _paperbookPublish;
  String? _isbn;
  String? _productTitle;
  String? _imageUrl;
  String? _className;
  String? _subjectName;
  String? _productUrl;

  String? get productId => _productId;

  String? get category => _category;

  String? get categoryId => _categoryId;

  String? get bookMrp => _bookMrp;

  String? get bookPrice => _bookPrice;

  String? get bookPerDiscount => _bookPerDiscount;

  String? get iebookPublish => _iebookPublish;

  String? get ebookPublish => _ebookPublish;

  String? get cdPublish => _cdPublish;

  String? get paperbookPublish => _paperbookPublish;

  String? get isbn => _isbn;

  String? get productTitle => _productTitle;

  String? get imageUrl => _imageUrl;

  String? get className => _className;

  String? get subjectName => _subjectName;

  String? get productUrl => _productUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productId'] = _productId;
    map['category'] = _category;
    map['categoryId'] = _categoryId;
    map['book_mrp'] = _bookMrp;
    map['book_price'] = _bookPrice;
    map['book_perDiscount'] = _bookPerDiscount;
    map['iebook_publish'] = _iebookPublish;
    map['ebook_publish'] = _ebookPublish;
    map['cd_publish'] = _cdPublish;
    map['paperbook_publish'] = _paperbookPublish;
    map['isbn'] = _isbn;
    map['product_title'] = _productTitle;
    map['imageUrl'] = _imageUrl;
    map['className'] = _className;
    map['subjectName'] = _subjectName;
    map['productUrl'] = _productUrl;
    return map;
  }


}

