import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_managment/bloc/search_bloc.dart';

class IssueCard extends StatefulWidget {
  const IssueCard({Key? key}) : super(key: key);

  @override
  State<IssueCard> createState() => _IssueCardState();
}

class _IssueCardState extends State<IssueCard> {
  final _seachController = TextEditingController();
  late SearchBloc _searchBloc;
  @override
  void initState() {
    super.initState();
    _searchBloc = BlocProvider.of<SearchBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 60,
          width: MediaQuery.of(context).size.width * 3 / 5,
          margin: const EdgeInsets.only(bottom: 40, top: 20),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: TextFormField(
                  controller: _seachController,
                  textAlign: TextAlign.center,
                  cursorColor: Colors.white,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w300,
                  ),
                  decoration: const InputDecoration(
                    hintText: "Search by Book Name or Author Name",
                    hintStyle: TextStyle(
                      color: Colors.white70,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 3,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 3,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(.6),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.search,
                    size: 50,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    print("Inside Card ${_searchBloc.state}");
                    BlocProvider.of<SearchBloc>(context)
                        .add(SearchEvent(_seachController.text));
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
