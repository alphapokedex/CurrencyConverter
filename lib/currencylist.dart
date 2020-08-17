import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dashboard.dart';

class currencylist extends StatefulWidget {
  @override
  _currencylistState createState() => _currencylistState();
}

class _currencylistState extends State<currencylist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEC5759),
      appBar: AppBar(
        backgroundColor: Color(0xFFEC5759),
        elevation: 0.0,
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
          Navigator.of(context).pop();
        }),
      ),
      body: ListView(
        children: <Widget>[
          getListItem('Philippino Peso','PHP'),
          getListItem('Indian Ruppee','INR'),
          getListItem('United States Dollar','USD'),
          getListItem('Euro','EUR'),
          getListItem('Japanese Yen','JPY'),
        ],
      ),
    );
  }

  Widget getListItem(String currencyName, String currency){
    return InkWell(
      onTap: (){
        Navigator.of(context).pushReplacement(CupertinoPageRoute(
          builder: (context)=>dashboard(currencyVal: 0.0,isWhite: false,convertedCurrency: 0.0,currencyOne: 'INR',currencyTwo: currency),
        ));
      },
      child: Padding(
        padding: EdgeInsets.only(left: 25.0, bottom: 25.0),
        child: Text(
          currencyName,
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
      ),
    );
  }
}
