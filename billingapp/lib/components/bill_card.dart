import 'package:billingapp/screens/detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class BillableListView extends StatelessWidget {
  var _name;
  var _description;
  var _imageUrl;
  var _bgColor;

  BillableListView(
      this._name, this._description, this._imageUrl, this._bgColor);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: _bgColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: ListTile(
          leading: Image.asset(_imageUrl),
          title: Text(
            _name,
            style: TextStyle(
              color: kTitleTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Container(
            height: 50,
            width: 50,
            decoration: AppColors.buttonBoxDecorations,
            child: Center(
              child: const Text(
                'Bill',
                style: const TextStyle(fontSize: 17.0),
              ),
            ),
          ),
          subtitle: Text(
            _description,
            style: TextStyle(
              color: kTitleTextColor.withOpacity(0.7),
            ),
          ),
        ),
      ),
    );
  }
}
