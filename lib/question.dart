import 'package:flutter/material.dart';

class Question{
  String _question;
  bool _answer;
  Question(this._question, this._answer)
      :assert(_question != null),
        assert(_answer != null);

  String getQuestion(){
    return _question;
  }

  bool getAnswer(){
    return _answer;
  }

  Icon getIcon(bool answer){
    if(this._answer == answer){
      return Icon(Icons.check, color: Colors.green,);
    }else{
      return Icon(Icons.close, color: Colors.red,);
    }
  }
}