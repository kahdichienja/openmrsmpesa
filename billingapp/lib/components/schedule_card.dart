import 'package:flutter/material.dart';

import '../constant.dart';

class ScheduleCard extends StatelessWidget {

  var _bgColor;

  ScheduleCard(this._bgColor);

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
          trailing: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16
            ),
            decoration: BoxDecoration(
              color: _bgColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(50),
            ),
            child:Icon(
                  Icons.credit_card,
                  size: 20,
            ),
          ),
          title: Text(
            "Pay",
            style: TextStyle(
              color: kTitleTextColor.withOpacity(0.7),
            ),
          ),
          leading: Image.asset("assets/icons/safaricom.png"),
        ),
      ),
    );
  }
}
