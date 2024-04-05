void main() {
  // String textDisplayed = "11+32-22+2-14x6/4";
  // List<double> numbers = textDisplayed
  //     .split(RegExp(r'[+-/x]'))
  //     .where((element) => element.isNotEmpty)
  //     .map(double.parse)
  //     .toList();
  // List<String> operations = textDisplayed
  //     .split(RegExp(r'[^+-/x]'))
  //     .where((element) => element.isNotEmpty)
  //     .toList();
  // print(operations);
  // print(numbers);

  // String ans = '';

  // double result = numbers[0];
  // for (int index = 0; index <= operations.length - 1; index++) {
  //   String optSign = operations[index];
  //   switch (optSign) {
  //     case '+':
  //       result += numbers[index + 1];
  //       break;
  //     case '-':
  //       result -= numbers[index + 1];
  //       break;
  //     case '/':
  //       result = result / numbers[index + 1];
  //       break;
  //     case 'x':
  //       result = result * numbers[index + 1];
  //       break;
  //     default:
  //       {/*Do nothing*/}

  //   }
  //   ans = result.toString();
  // }






  String animal = 'Hippopotamus';

  String testing = animal.replaceRange(3, 7, '');
  print(testing);
}
 // switch (optSign) {
      //   case "+":
      //     ans += numbersList[index + 1];
      //     break;
      //   case "-":
      //     ans -= numbersList[index + 1];
      //     break;
      //   default:
      //     break;
      // }