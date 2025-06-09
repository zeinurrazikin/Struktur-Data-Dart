import 'dart:io';

void charCombination(String a, int n) {
  if (n == 0) {
    stdout.write('$a');
    print('');
} else {
  for (int i = 65; i < 90; i++) {
    charCombination(a + String.fromCharCode(i), n - 1);
  }
 }
 
} 
void main() {
 charCombination("", 3);
}