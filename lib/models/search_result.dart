import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_managment/bloc/search_bloc.dart';
import 'package:library_managment/models/book_details.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*3/5,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BlocBuilder<SearchBloc, SearchState>(
            bloc: BlocProvider.of<SearchBloc>(context),
            builder: (contex_, state) {
              print("Inside result $state");
              if (state is NoSearchYet) {
                return const Text(
                  "Make Seach",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                );
              } else if (state is NoBooksFound) {
                return const Text(
                  "No Such Book or Author Found",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                );
              } else if (state is ErrorOccured) {
                return const Text(
                  "Error Occured",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                );
              }
              SearchBloc bloc = BlocProvider.of<SearchBloc>(context);
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Book Found",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                        ),
                        shrinkWrap: true,
                        itemBuilder: (contex_, index) {
                          return BookDetails(book: bloc.result[index]);
                        },
                        itemCount: bloc.result.length),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
