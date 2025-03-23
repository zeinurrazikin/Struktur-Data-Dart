import 'dart:io'; 
void tail(int i) {
  // Memeriksa apakah nilai 'i' lebih besar dari 0
  if (i > 0) {
    // Menampilkan nilai 'i' diikuti dengan spasi
    stdout.write('$i '); 
    // Memanggil fungsi 'tail' lagi dengan nilai 'i' dikurangi 1
    tail(i - 1); 
  }
}

// Fungsi utama tempat eksekusi program dimulai
void main() {
  // Memanggil fungsi 'tail' dengan nilai awal 5
  tail(5); 
}