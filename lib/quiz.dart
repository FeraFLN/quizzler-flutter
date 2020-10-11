

import 'package:flutter/cupertino.dart';
import 'package:quizzler/question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Quiz{
  int index = 0;
  List<Icon> icons = [];
  final List<Question> _questions;
  bool _isFineshed = false;
  Quiz(this._questions): assert(_questions!= null);

  Question getQuestion(){
    return _questions[index];
  }

  String getStringQuestion(){
    return getQuestion().getQuestion();
  }

  List<Icon> getIcons(){
    return icons;
  }

  void checkAnswer(bool answer,BuildContext context){
    if(!_isFineshed){
      icons.add(getQuestion().getIcon(answer));
    }
    _nextQuestion(context);
  }
  void _nextQuestion(BuildContext context){
    if(index < _questions.length-1){
      index++;
    }else{
      Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.").show();
      _isFineshed = true;
    }
  }
}
