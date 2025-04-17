import 'dart:ffi';
import 'dart:io';

void main() {
  stdout.write('Enter Opration + ,-,*,/,%,!: ');
  String? opration = stdin.readLineSync();
  //التحقق من نوع العملية التي ادخلها المستخدم
  if (opration == '!') {
    int x;
    stdout.write('Enter The Number ');
    x = int.parse(stdin.readLineSync().toString());
    print(factorial(x));
  }
  //////////////////////////////////
  else {
    calculator(opration);
  }
}
//دالة لايجاد المضروب النوني
int factorial(x) {
  if (x == 0) {
    return 1;
  }

  return x * factorial(x - 1);
}
//دالة للقيام بالعمليات الحسابية
void calculator(opr) {
  dynamic x, y, result;
  print('Enter The Number1: ');
  x = int.parse(stdin.readLineSync().toString());
  print('Enter The Number2: ');
  y = int.parse(stdin.readLineSync().toString());
  if (opr == '/' && y == 0) {
    print('please , Enter correct number! ; You cant enter Zero in the position');
    print('try again please');
    calculator(opr);
  } else {
    switch (opr) {
      case '+':
        result = x + y;
        break;
      ///////////////////
      case '-':
        result = x - y;
        break;
      ///////////////
      case '*':
        result = x * y;
        break;
      ///////////////
      case '/':
        result = x / y;
        break;
      ///////////////////////////
      case '%':
        result = x % y;
        break;
      ///////////////////
      default:
        print('رمز العملية غير صحيح!');
    }
    print('The result is $result');
  }
}
