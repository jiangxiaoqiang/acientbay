import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
     Key key,
  }) : super(key: key);


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
                "Comment",
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
