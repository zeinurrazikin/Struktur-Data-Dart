/// Method untuk pengurutan dengan bubble sort
/// Mengurutkan list secara ascending (kecil ke besar)
void bubbleSort<T extends Comparable<T>>(List<T> arr) {
  int i, j;
  T temp;
  for (i = 0; i < arr.length - 1; i++) {
    // Loop untuk membandingkan elemen bersebelahan
    for (j = 0; j < arr.length - i - 1; j++) {
      // Membandingkan elemen saat ini dengan elemen berikutnya
      // Jika elemen saat ini lebih besar, tukar posisinya
      if (arr[j].compareTo(arr[j + 1]) > 0) {
        temp = arr[j + 1];
        arr[j + 1] = arr[j];
        arr[j] = temp;
      }
    }
  }
}

/// Method untuk pengurutan dengan shell sort secara descending (besar ke kecil)
/// Shell sort adalah perbaikan dari insertion sort dengan membandingkan elemen
/// yang berjarak tertentu, kemudian mengurangi jarak hingga menjadi 1
void shellSortDescending<T extends Comparable<T>>(List<T> arr) {
  int n = arr.length;
  
  // Mulai dengan gap/jarak yang besar, lalu kurangi hingga 1
  // Formula gap: n/2, n/4, n/8, ..., 1
  for (int gap = n ~/ 2; gap > 0; gap ~/= 2) {
    
    // Lakukan insertion sort untuk elemen-elemen berjarak 'gap'
    for (int i = gap; i < n; i++) {
      // Simpan elemen saat ini untuk perbandingan
      T temp = arr[i];
      int j;
      
      // Bandingkan elemen berjarak gap dan tukar jika perlu
      // Untuk descending, kita tukar jika elemen dengan indeks lebih kecil
      // nilainya lebih kecil dari elemen dengan indeks lebih besar
      for (j = i; j >= gap && arr[j - gap].compareTo(temp) < 0; j -= gap) {
        // Pindahkan elemen yang lebih kecil ke belakang
        arr[j] = arr[j - gap];
      }
      
      // Letakkan elemen yang disimpan ke posisi yang tepat
      arr[j] = temp;
    }
  }
}

/// Method untuk menampilkan semua elemen dalam list
void display<T>(List<T> data) {
  for (T objek in data) {
    print('$objek ');
  }
  print('');
}

void main() {
  // Membuat list berisi 10 angka genap dari 2 sampai 20
  List<num> data = List<num>.generate(10, (index) => (index + 1) * 2);
  data.shuffle(); // Mengacak urutan data
  
  print('Data Sebelum Pengurutan:');
  display(data);
  
  // Salin data untuk algoritma shell sort
  List<num> dataShell = List<num>.from(data);
  
  // Jalankan bubble sort dan hitung waktu
  DateTime start = DateTime.now();
  bubbleSort(data);
  Duration elapsedTime = DateTime.now().difference(start);
  print('Data Setelah Bubble Sort (Ascending):');
  display(data);
  print('Waktu Bubble Sort: ${elapsedTime.inMilliseconds} ms');
  
  // Jalankan shell sort descending dan hitung waktu
  start = DateTime.now();
  shellSortDescending(dataShell);
  elapsedTime = DateTime.now().difference(start);
  print('Data Setelah Shell Sort (Descending):');
  display(dataShell);
  print('Waktu Shell Sort: ${elapsedTime.inMilliseconds} ms');
}