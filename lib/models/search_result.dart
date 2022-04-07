import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_managment/bloc/search_bloc.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BlocBuilder<SearchBloc, SearchState>(
            bloc: BlocProvider.of<SearchBloc>(context),
            builder: (context, state) {
              if (state is NoSearchYet) {
                const Text("Make Seach");
              } else if (state is NoBooksFound) {
                const Text("No Such Book or Author Found");
              }
              return const Text("Book Found");
            },
          )
        ],
      ),
    );
  }
}
