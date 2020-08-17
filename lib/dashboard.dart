import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:num_2/redinput.dart';
import 'package:num_2/whiteinput.dart';
import 'currencylist.dart';
import 'currencyservice.dart';

class dashboard extends StatefulWidget {

  final currencyVal, currencyOne, currencyTwo, convertedCurrency, isWhite;

  const dashboard({Key key, this.currencyVal, this.currencyOne, this.currencyTwo, this.convertedCurrency, this.isWhite}) : super(key: key);

  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            color: Color(0xFFEC5759),
          ),
          Container(
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 30),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context)=>currencylist()
                      ));
                    },
                    child: Text(
                      currencyservice().getCurrencyString(widget.currencyOne),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context)=> inputred(
                            origCurrency: widget.currencyOne,
                            convCurrency: widget.currencyTwo,
                          )
                      ));
                    },
                    child: Text(
                      widget.convertedCurrency.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 120.0,
                      ),
                    ),
                  ),
                  Text(
                    widget.currencyOne,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 45.0),
                  Container(
                    height: 125.0,
                    width: 125.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(62.5),
                        color: Colors.white,
                        border: Border.all(
                            color: Color(0xFFEC5759),
                            style: BorderStyle.solid,
                            width: 5.0
                        )
                    ),
                    child: Center(
                        child: widget.isWhite ? Icon(Icons.arrow_upward, size: 60.0, color: Color(0xFFEC5759)) : Icon(Icons.arrow_downward, size: 60.0, color: Color(0xFFEC5759))
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Text(
                    widget.currencyTwo,
                    style: TextStyle(
                        color: Color(0xFFEC5759),
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context)=> inputwhite(
                          origCurrency: widget.currencyOne,
                          convCurrency: widget.currencyTwo,
                        )
                      ));
                    },
                    child: Text(
                      widget.currencyVal.toString(),
                      style: TextStyle(
                        color: Color(0xFFEC5759),
                        fontSize: 120.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context)=>currencylist()
                      ));
                    },
                    child: Text(
                      currencyservice().getCurrencyString(widget.currencyTwo),
                      style: TextStyle(
                        color: Color(0xFFEC5759),
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
