import 'package:flutter/material.dart';
import 'dashboard.dart';

class currencyservice{
  getCurrencyString(currency){
    if(currency=='INR') return 'Indian Ruppee';
    if(currency=='PHP') return 'Philippino Peso';
    if(currency=='USD') return 'United States Dollar';
    if(currency=='JPY') return 'Japanese Yen';
  }

  convertCurrency(String fromCurrency, String toCurrency, int amount, context){
    if(fromCurrency=='INR'){
      switch(toCurrency){
        case 'PHP':
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context)=> dashboard(
              currencyVal: (amount * 0.39).roundToDouble(),
              convertedCurrency: amount,
              currencyOne: fromCurrency,
              currencyTwo: toCurrency,
              isWhite: false,
            )
          )); break;
        case 'USD':
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context)=> dashboard(
                currencyVal: (amount / 75).roundToDouble(),
                convertedCurrency: amount,
                currencyOne: fromCurrency,
                currencyTwo: toCurrency,
                isWhite: false,
              )
          )); break;
        case 'JPY':
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context)=> dashboard(
                currencyVal: (amount * 0.5).roundToDouble(),
                convertedCurrency: amount,
                currencyOne: fromCurrency,
                currencyTwo: toCurrency,
                isWhite: false,
              )
          )); break;
      }
    }
    if(fromCurrency=='PHP'){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context)=> dashboard(
            currencyVal: amount,
            convertedCurrency: (amount / 0.39).toStringAsFixed(2),
            currencyOne: toCurrency,
            currencyTwo: fromCurrency,
            isWhite: true,
          )
      ));
    }
    if(fromCurrency=='USD'){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context)=> dashboard(
            currencyVal: amount,
            convertedCurrency: (amount * 75).toStringAsFixed(2),
            currencyOne: toCurrency,
            currencyTwo: fromCurrency,
            isWhite: true,
          )
      ));
    }
    if(fromCurrency=='JPY'){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context)=> dashboard(
            currencyVal: amount,
            convertedCurrency: (amount / 0.5).toStringAsFixed(2),
            currencyOne: toCurrency,
            currencyTwo: fromCurrency,
            isWhite: true,
          )
      ));
    }
  }
}