class Book {
  String bookName;
  List<String> authorName;
  String id;
  Book({
    required this.authorName,
    required this.bookName,
    required this.id,
  });
  Book.fromJson(json)
      : bookName = json["bookName"],
        authorName = json["authorName"],
        id = json["id"];
}
