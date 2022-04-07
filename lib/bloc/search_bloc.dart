import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_managment/classes/book.dart';

class SearchEvent {
  String search;
  SearchEvent(this.search);
}

class SearchState {}

class NoBooksFound extends SearchState {}

class NoSearchYet extends SearchState {}

class BookFound extends SearchState {}

class ErrorOccured extends SearchState {}

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  List<Book> _books = [];
  SearchBloc(SearchState initialState) : super(initialState) {
    on<SearchEvent>(_makeSearch);
  }
  _makeSearch(SearchEvent event, emit) async {
    CollectionReference _collectionReference =
        FirebaseFirestore.instance.collection("books");
    final snapshot = await _collectionReference
        .where("bookName", isEqualTo: event.search)
        .get();
    print(snapshot.size);

    if (snapshot.size == 0) {
      print("inside If");
      emit(NoBooksFound());
    } else {
      _books.clear();
      for (int i = 0; i < snapshot.docs.length; i++) {
        Map<String, dynamic> json = {
          "id": "",
          "bookName": "",
          "authorName": List<String>
        };
        json["bookName"] = snapshot.docs[i]["bookName"];
        json["id"] = snapshot.docs[i].id.toString();
        json["authorName"] = snapshot.docs[i]["authorName"];
        _books.add(Book.fromJson(json));
        Book _book = Book(
            id: snapshot.docs[i].id,
            bookName: snapshot.docs[i]["bookName"],
            authorName: snapshot.docs[i]["authorName"]);
        print(_book.authorName);
      }
      emit(BookFound());
    }
  }

  List<Book> get result => _books;
}
