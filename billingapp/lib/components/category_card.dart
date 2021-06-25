import 'package:flutter/material.dart';

import '../constant.dart';

class CategoryCard extends StatelessWidget {
  var _title;
  var _imageUrl;
  var _bgColor;

  CategoryCard(this._title, this._imageUrl, this._bgColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 150,
      decoration: AppColors.containerBoxDecorations,
      child: Stack(
         fit: StackFit.expand,
        children: <Widget>[
          Container(
            width: 110,
            height: 137,
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                _title,
                style: TextStyle(
                  color: kTitleTextColor,
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                _imageUrl,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
