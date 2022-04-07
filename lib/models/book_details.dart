import 'package:flutter/material.dart';

import '../classes/book.dart';

class BookDetails extends StatelessWidget {
  final Book? book;
  const BookDetails({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage(
            "assets/images/book1.jpg",
          ),
          fit: BoxFit.cover,
        ),
        border: Border.all(
          width: 1,
          color: Colors.black,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            book!.bookName,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          for (int i = 0; i < book!.authorName.length; i++)
            Text(
              book!.authorName[i],
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          Container(
            alignment: Alignment.center,
            child: const Text(
              "Click to Issue",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            height: 50,
            margin: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade300, Colors.blue.shade900],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(20))),
          ),
        ],
      ),
    );
  }
}
