import 'dart:ffi';
import 'dart:io';

void main() {
  String? opration;
  try {
    stdout.write('Enter Opration + ,-,*,/,%,!: ');
    opration = stdin.readLineSync();
    if (opration != '+' &&
        opration != '-' &&
        opration != '*' &&
        opration != '/' &&
        opration != '%' &&
        opration != '!') {
      exit(1);
    }
  } catch (e) {
    print(e);
  }
  //التحقق من نوع العملية التي ادخلها المستخدم
  if (opration == '!') {
    try {
      int x;
      stdout.write('Enter The Number ');
      x = int.parse(stdin.readLineSync().toString());
      print(factorial(x));
    } catch (e) {
      print(e);
    }
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
  } else if (x < 0) {
    throw Error.err;
  }

  return x * factorial(x - 1);
}

//دالة للقيام بالعمليات الحسابية
void calculator(opr) {
  try {
    dynamic x, y, result;
    print('Enter The Number1: ');
    x = int.parse(stdin.readLineSync().toString());
    print('Enter The Number2: ');
    y = int.parse(stdin.readLineSync().toString());

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
        throw Error.divibyzero;

      ///////////////////////////
      case '%':
        result = x % y;
        break;
      ///////////////////
      default:
        print('رمز العملية غير صحيح!');
    }
    print('The result is $result');
  } catch (e) {
    print(e);
    calculator(opr);
  }
}

class Error implements Exception {
 static String err = "Error in this opration";
 static String divibyzero = "cant division By Zero\n try again";
}
