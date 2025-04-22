void main() {
  // Contoh penggunaan NumberConverter
  NumberConverter converter = NumberConverter();
  
  int decimalNumber = 25;
  print('Masukkan nilai desimal = $decimalNumber');
  print('Hasil nilai biner = ${converter.toBinary(decimalNumber)}');
  print('Hasil nilai oktal = ${converter.toOctal(decimalNumber)}');
  print('Hasil nilai heksadesimal = ${converter.toHexadecimal(decimalNumber)}');
  
  print(''); // Baris kosong untuk pemisah
  
  // Contoh penggunaan StringHandler
  StringHandler handler = StringHandler();
  
  String text1 = 'algoritma dan struktur data';
  String reversed1 = handler.reverseString(text1);
  print('Masukkan kalimat : $text1');
  print('Hasil = $reversed1');
  print(handler.isPalindrome(text1) ? 'Palindrom' : 'Bukan palindrom');
  
  print(''); // Baris kosong untuk pemisah
  
  String text2 = 'sugus';
  String reversed2 = handler.reverseString(text2);
  print('Masukkan kalimat : $text2');
  print('Hasil = $reversed2');
  print(handler.isPalindrome(text2) ? 'Palindrom' : 'Bukan palindrom');
}

/// Class untuk konversi desimal ke basis bilangan lain menggunakan List sebagai stack
class NumberConverter {
  /// Mengkonversi angka desimal ke biner menggunakan List sebagai stack
  String toBinary(int decimal) {
    if (decimal == 0) return '0';
    
    // Menggunakan List sebagai stack
    List<int> stack = [];
    int num = decimal;
    
    // Push sisa pembagian ke stack
    while (num > 0) {
      stack.add(num % 2);
      num ~/= 2;
    }
    
    // Pop dari stack untuk membentuk hasil
    String binary = '';
    while (stack.isNotEmpty) {
      binary += stack.removeLast().toString();
    }
    
    return binary;
  }
  
  /// Mengkonversi angka desimal ke oktal menggunakan List sebagai stack
  String toOctal(int decimal) {
    if (decimal == 0) return '0';
    
    // Menggunakan List sebagai stack
    List<int> stack = [];
    int num = decimal;
    
    // Push sisa pembagian ke stack
    while (num > 0) {
      stack.add(num % 8);
      num ~/= 8;
    }
    
    // Pop dari stack untuk membentuk hasil
    String octal = '';
    while (stack.isNotEmpty) {
      octal += stack.removeLast().toString();
    }
    
    return octal;
  }
  
  /// Mengkonversi angka desimal ke heksadesimal menggunakan List sebagai stack
  String toHexadecimal(int decimal) {
    if (decimal == 0) return '0';
    
    // Menggunakan List sebagai stack
    List<dynamic> stack = [];
    int num = decimal;
    
    // Push sisa pembagian ke stack
    while (num > 0) {
      int remainder = num % 16;
      if (remainder < 10) {
        stack.add(remainder);
      } else {
        // Konversi nilai 10-15 ke a-f
        stack.add(String.fromCharCode('a'.codeUnitAt(0) + remainder - 10));
      }
      num ~/= 16;
    }
    
    // Pop dari stack untuk membentuk hasil
    String hex = '';
    while (stack.isNotEmpty) {
      hex += stack.removeLast().toString();
    }
    
    return hex;
  }
}

/// Class untuk manipulasi string dan pengecekan palindrom menggunakan List sebagai stack
class StringHandler {
  /// Membalik urutan karakter dalam string menggunakan List sebagai stack
  String reverseString(String text) {
    // Menggunakan List sebagai stack
    List<String> stack = [];
    
    // Push setiap karakter ke stack
    for (int i = 0; i < text.length; i++) {
      stack.add(text[i]);
    }
    
    // Pop dari stack untuk membentuk string terbalik
    String reversed = '';
    while (stack.isNotEmpty) {
      reversed += stack.removeLast();
    }
    
    return reversed;
  }
  
  /// Memeriksa apakah string adalah palindrom
  bool isPalindrome(String text) {
    // Menghilangkan spasi untuk pemeriksaan palindrom
    String cleanText = text.replaceAll(' ', '');
    String reversed = reverseString(cleanText);
    
    // Membandingkan string asli dengan hasil pembalikan
    return cleanText.toLowerCase() == reversed.toLowerCase();
  }
}