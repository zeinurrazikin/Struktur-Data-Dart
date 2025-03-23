import 'dart:io';

void main() {
  stdout.write("Masukkan jumlah karakter: ");
  int n = int.parse(stdin.readLineSync()!);
  //Membaca Input: stdin.readLineSync() digunakan untuk membaca input dari pengguna. 
  generateCombinations('', n);
  //Memanggil Fungsi Rekursif: Fungsi generateCombinations dipanggil dengan dua argumen: string kosong ('') 
  //yang berfungsi sebagai prefix awal dan n yang merupakan jumlah karakter yang ingin dihasilkan.
}

void generateCombinations(String prefix, int n) {
  //Definisi Fungsi Rekursif: Ini adalah definisi dari fungsi generateCombinations yang menerima dua parameter: prefix
  if (n == 0) {
    //untuk mengecek apakah n sudah mencapai 0
    print(prefix);
    //jika sudah tercapai, kombinasi dibangun dalam prefix dan dicetak
    return;
  }
  
  // Menghasilkan kombinasi dari 'a', 'b', dan 'c'
  String characters = 'abc';
  for (int i = 0; i < characters.length; i++) {
    generateCombinations(prefix + characters[i], n - 1);
  //fungsi generateCombinations dipanggil kembali dengan argumen:
  //prefix + characters[i]: Menambahkan karakter saat ini ke string prefix.
  //n - 1: Mengurangi nilai n untuk menunjukkan bahwa satu karakter telah ditambahkan.
  }
}