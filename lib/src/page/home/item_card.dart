import 'package:acientbay/src/models/collection.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
     Key? key,
     required this.collection
  }) : super(key: key);


  final Collection collection;

  @override
  Widget build(BuildContext context) {
    return Card(
      key: Key("1"),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                collection.collectionName,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Row(
                      children: [

                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "10",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
