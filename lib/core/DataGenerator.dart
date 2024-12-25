
import 'dart:math';

class DataGenerator {

  final Random _random = Random();

  String getRandomString([int size = 1]) {
   String code = '';
   for (int i = 0; i < size; i++) {
     code += String.fromCharCode(_random.nextInt(25) + 65);
   }
   return code;
  }

  String getRandomNumber([int size = 1]) {
    String code = '';
    for (int i = 0; i < size; i++) {
      code += String.fromCharCode(_random.nextInt(9) + 48);
    }
    return code;
  }
}
