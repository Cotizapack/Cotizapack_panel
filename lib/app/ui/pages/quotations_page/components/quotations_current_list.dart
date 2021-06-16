import 'package:flutter/material.dart';

import 'quotations_card.dart';

class QuotationsCurrentList extends StatelessWidget {
  const QuotationsCurrentList({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Dismissible(
            direction: DismissDirection.endToStart,
            key: Key(item),
            child: QuotationsCard(),
            onDismissed: (direction) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('delete')));
            },
            background: Container(
              padding: EdgeInsets.only(right: 8.0),
              alignment: Alignment.centerRight,
              color: Colors.red,
              child: Icon(Icons.delete),
            ),
          );
        },
      ),
    );
  }
}
