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

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  late List<Book> _books;
  SearchBloc(SearchState initialState) : super(initialState) {
    on<SearchEvent>(_makeSearch);
  }
  _makeSearch(SearchEvent event, emit) async* {
    CollectionReference _collectionReference =
        FirebaseFirestore.instance.collection("books");
    final snapshot = await _collectionReference
        .where("bookName", isEqualTo: event.search)
        .get();
    if (snapshot.size == 0) {
      emit(NoBooksFound());
    } else {
      for (int i = 0; i < snapshot.docs.length; i++) {
        Map<String, dynamic> json = {
          "id": "",
          "bookName": "",
          "authorName": []
        };
        json["bookName"] = snapshot.docs[i]["bookName"];
        json["id"] = snapshot.docs[i].id.toString();
        json["authorName"] = snapshot.docs[i]["authorName"];
        _books.add(Book.fromJson(json));
        print("Called");
      }
    }
    emit(BookFound());
  }
}
