import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/custom_app_bar.dart';


class UserInfoTile extends StatelessWidget {
  final String? label, value;
  final EdgeInsetsGeometry? margin, padding;
  UserInfoTile({@required this.label, @required this.value, this.padding, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text('$label', style: TextStyle(color: Colors.black, fontSize: 12)),
          ),
          Container(
            margin: EdgeInsets.only(top: 6),
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(16),
            color: Colors.black,
            child: Text('$value', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, fontFamily: 'inter')),
          )
        ],
      ),
    );
  }
}
