import 'dart:math';

class bmi_calculator{
  int weight;
  int height;
  double _bmi=0;
  bmi_calculator({required this.weight,required this.height});
  String bmi_cal()
  {
    _bmi=weight/pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }

  String getresult(){
    if(_bmi>=25){
      return 'Over-weight';
    }
    else if(_bmi>=18.5){
      return 'Normal';
    }
    else{
      return 'Under-weight';
    }
  }

  String getInterpretation(){
    if(_bmi>=25){
      return 'you have higher than normal weight try to excercise more';
    }
    else if(_bmi>=18.5){
      return 'Good job! you have normal bmi';
    }
    else{
      return 'Your weight is less than normal! try to eat more';
    }
  }
}