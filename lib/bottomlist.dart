import 'package:flutter/material.dart';

class BottomSheetList extends StatefulWidget {
  final List items;
  final List duplicateItems;
  BottomSheetList({Key? key, required this.items, required this.duplicateItems})
      : super(key: key);

  @override
  State<BottomSheetList> createState() => _BottomSheetListState();
}

class _BottomSheetListState extends State<BottomSheetList> {
  TextEditingController editingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                filterSearchResults(value);
              },
              controller: editingController,
              decoration: InputDecoration(
                  labelText: "Search",
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)))),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${widget.items[index]}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void filterSearchResults(String query) {
    List dummySearchList = [];
    dummySearchList.addAll(widget.duplicateItems);
    if (query.isNotEmpty) {
      List dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        widget.items.clear();
        widget.items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        widget.items.clear();
        widget.items.addAll(widget.duplicateItems);
      });
    }
  }
}
