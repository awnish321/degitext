import 'dart:convert';

class Book {
  final String productId;
  final String category;
  final String categoryId;
  final String className;
  final String subjectName;
  final String bookMrp;
  final String bookPrice;
  final String bookPerDiscount;
  final String iebookPublish;
  final String ebookPublish;
  final String cdPublish;
  final String paperbookPublish;
  final String isbn;
  final String productTitle;
  final String imageUrl;
  final String productUrl;

  Book({
    required this.productId,
    required this.category,
    required this.categoryId,
    required this.className,
    required this.subjectName,
    required this.bookMrp,
    required this.bookPrice,
    required this.bookPerDiscount,
    required this.iebookPublish,
    required this.ebookPublish,
    required this.cdPublish,
    required this.paperbookPublish,
    required this.isbn,
    required this.productTitle,
    required this.imageUrl,
    required this.productUrl,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      productId: json['productId'],
      category: json['category'],
      categoryId: json['categoryId'],
      className: json['className'],
      subjectName: json['subjectName'],
      bookMrp: json['book_mrp'],
      bookPrice: json['book_price'],
      bookPerDiscount: json['book_perDiscount'],
      iebookPublish: json['iebook_publish'],
      ebookPublish: json['ebook_publish'],
      cdPublish: json['cd_publish'],
      paperbookPublish: json['paperbook_publish'],
      isbn: json['isbn'],
      productTitle: json['product_title'],
      imageUrl: json['imageUrl'],
      productUrl: json['productUrl'],
    );
  }
}

List<Book> parseBooks(String responseBody) {
  final parsed = json.decode(responseBody);
  return (parsed['booksData'] as List).map<Book>((json) => Book.fromJson(json)).toList();
}