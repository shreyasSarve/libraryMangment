import 'package:flutter/material.dart';

final backgroundImage = Image.asset(
  "assets/images/lib.jpg",
  fit: BoxFit.fill,
);

List<BookData> books = [
  BookData("Abraham Silberschatz", "assets/images/book1.jpg"),
  BookData("David A Patterson1", "assets/images/book2.jpg"),
  BookData("E.Balagurusamy", "assets/images/book3.jpg"),
  BookData("Greg Gagne", "assets/images/book4.jpg"),
  BookData("Harry Lewis", "assets/images/book5.jpg"),
  BookData("John E Hopcroft", "assets/images/book6.jpg"),
  BookData("John L. Hennessy", "assets/images/book7.jpg"),
];

class BookData {
  final String path;
  final String name;
  BookData(this.name, this.path);
}
