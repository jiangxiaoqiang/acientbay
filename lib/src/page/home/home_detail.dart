
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_html/flutter_html.dart';

class HomeDetail extends HookWidget {


  @override
  Widget build(BuildContext context) {
    SingleChildScrollView buildListView(BuildContext context) {
      return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Html(
                  data: "item.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.contentitem.content",
                  style: {
                    "body": Style(
                      fontSize: FontSize(19.0),
                    ),
                  }),
            ],
          ));
    }

    Offset _initialSwipeOffset;
    Offset _finalSwipeOffset;

    void _onHorizontalDragStart(DragStartDetails details) {
      _initialSwipeOffset = details.globalPosition;
    }

    void _onHorizontalDragUpdate(DragUpdateDetails details) {
      _finalSwipeOffset = details.globalPosition;
    }

    void _onHorizontalDragEnd(DragEndDetails details) {
      if (_initialSwipeOffset != null) {
        final offsetDifference = _initialSwipeOffset.dx - _finalSwipeOffset.dx;
        if (offsetDifference < 0) {
          Navigator.pop(context);
        }
      }
    }


    return GestureDetector(
        onHorizontalDragStart: _onHorizontalDragStart,
        onHorizontalDragUpdate: _onHorizontalDragUpdate,
        onHorizontalDragEnd: _onHorizontalDragEnd,
        child: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery
                .of(context)
                .size
                .height * 0.9,
          ),
          color: Theme
              .of(context)
              .scaffoldBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: buildListView(context),
          ),
        ));
  }
}


