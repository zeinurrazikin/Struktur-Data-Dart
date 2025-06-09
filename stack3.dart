import 'package:stack/stack.dart';

void main() {
 // Membuat objek tumpukan
 var stack = Stack<int>();
 // Menambahkan beberapa elemen ke dalam tumpukan
 
 stack.push(1);
 stack.push(2);
 stack.push(3);
 
 // Mencetak isi tumpukan
 print('Stack: $stack');
 // Menghapus dan mencetak elemen teratas dari tumpukan
 print('Popped element: ${stack.pop()}');
 print('Stack: $stack');
  // Menambahkan elemen baru ke dalam tumpukan
 stack.push(4);
 print('Stack: $stack');
 // Mencetak elemen teratas dari tumpukan tanpa menghapusnya
 print('Top element: ${stack.top}');
 print('stack: $stack');
} 