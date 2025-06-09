/// Method untuk pengurutan dengan insertion sort
/// Mengurutkan list secara ascending (kecil ke besar)
void insertionSort<T extends Comparable<T>>(List<T> arr) {
  for (int i = arr.length - 1; i >= 0; i--) {
    for (int j = i + 1, k = i; j < arr.length; j++) {
      // Bandingkan elemen saat ini dengan elemen yang sedang diproses
      if (arr[j].compareTo(arr[k]) > 0) {
        // Jika elemen j lebih besar dari k, hentikan proses
        break;
      } else {
        // Jika elemen j lebih kecil dari k, lakukan pertukaran (swap)
        T temp = arr[k];
        arr[k] = arr[j];
        arr[j] = temp;
        k = j; // Pindahkan posisi k ke posisi j untuk perbandingan selanjutnya
      }
    }
  }
}

/// Method untuk pengurutan dengan bubble sort secara descending (besar ke kecil)
/// Prinsip: Melakukan perbandingan antara dua elemen bersebelahan dan menukarnya
/// jika elemen kedua lebih besar dari elemen pertama
void bubbleSortDescending<T extends Comparable<T>>(List<T> arr) {
  // Loop untuk mengulang proses sorting sebanyak panjang array
  for (int i = 0; i < arr.length - 1; i++) {
    // Loop untuk membandingkan dan menukar elemen bersebelahan
    for (int j = 0; j < arr.length - i - 1; j++) {
      // Bandingkan elemen saat ini dengan elemen berikutnya
      // Untuk descending, tukar jika elemen saat ini LEBIH KECIL dari berikutnya
      if (arr[j].compareTo(arr[j + 1]) < 0) {
        // Tukar posisi elemen yang lebih kecil dengan yang lebih besar
        T temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
      }
    }
  }
}

/// Method untuk menampilkan isi dari list
void display<T>(List<T> data) {
  for (T obj in data) {
    print('$obj ');
  }
  print('');
}

void main() {
  // Membuat list berisi 10 angka genap dari 2 sampai 20
  List<num> data = List<num>.generate(10, (index) => (index + 1) * 2);
  data.shuffle(); // Mengacak urutan data
  
  print('Data Sebelum Pengurutan:');
  display(data);
  
  // Salin data untuk algoritma bubble sort
  List<num> dataBubble = List<num>.from(data);
  
  // Jalankan insertion sort dan hitung waktu
  DateTime start = DateTime.now();
  insertionSort<num>(data);
  Duration elapsedTime = DateTime.now().difference(start);
  print('Data Setelah Insertion Sort (Ascending):');
  display(data);
  print('Waktu Insertion Sort: $elapsedTime');
  
  // Jalankan bubble sort descending dan hitung waktu
  start = DateTime.now();
  bubbleSortDescending<num>(dataBubble);
  elapsedTime = DateTime.now().difference(start);
  print('Data Setelah Bubble Sort (Descending):');
  display(dataBubble);
  print('Waktu Bubble Sort: $elapsedTime');
}