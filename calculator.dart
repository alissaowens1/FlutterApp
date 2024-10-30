// calculator.dart
class Calculator {
static double x = 0;
static double y = 0;
static String operator = '';
static double? calculate() {
if (operator == '+') {
return x + y;
} else if (operator == '-') {
return x - y;
} else if (operator == '*') {
return x * y;
} else if (operator == '/') {
if (y != 0) {
return x / y;
} else {
// print("A number cannot be divided by zero!");
return null;
}
} else {
// print("Something's wrong!");
return null;
}
}
}