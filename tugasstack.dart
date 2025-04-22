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

/// Class untuk konversi desimal ke basis bilangan lain
class NumberConverter {
  /// Mengkonversi angka desimal ke biner
  String toBinary(int decimal) {
    if (decimal == 0) return '0';
    String binary = '';
    int num = decimal;
    
    while (num > 0) {
      binary = (num % 2).toString() + binary;
      num ~/= 2;
    }
    
    return binary;
  }
  
  /// Mengkonversi angka desimal ke oktal
  String toOctal(int decimal) {
    if (decimal == 0) return '0';
    String octal = '';
    int num = decimal;
    
    while (num > 0) {
      octal = (num % 8).toString() + octal;
      num ~/= 8;
    }
    
    return octal;
  }
  
  /// Mengkonversi angka desimal ke heksadesimal
  String toHexadecimal(int decimal) {
    if (decimal == 0) return '0';
    String hex = '';
    int num = decimal;
    
    while (num > 0) {
      int remainder = num % 16;
      String hexDigit;
      
      if (remainder < 10) {
        hexDigit = remainder.toString();
      } else {
        // Konversi nilai 10-15 ke A-F
        hexDigit = String.fromCharCode('a'.codeUnitAt(0) + remainder - 10);
      }
      
      hex = hexDigit + hex;
      num ~/= 16;
    }
    
    return hex;
  }
}

/// Class untuk manipulasi string dan pengecekan palindrom
class StringHandler {
  /// Membalik urutan karakter dalam string
  String reverseString(String text) {
    String reversed = '';
    for (int i = text.length - 1; i >= 0; i--) {
      reversed += text[i];
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