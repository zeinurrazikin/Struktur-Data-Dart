void main() {
  // Membuat list data dengan 10 elemen (angka 1 sampai 10)
  List<num> data = List.generate(10, (index) => (index + 1)..toDouble());
  print("Data sebelum diurutkan (ascending):");
  printData(data);

  // Mengukur waktu eksekusi merge sort ascending
  DateTime startTime = DateTime.now();
  // Parameter terakhir 'true' berarti pengurutan ascending
  mergeSortWithFlag(data, 0, data.length - 1, true);
  Duration elapsedTime = DateTime.now().difference(startTime);

  // Menampilkan hasil pengurutan ascending
  print("\nData setelah diurutkan (ascending):");
  printData(data);
  print('Waktu pengurutan ascending: ${elapsedTime.inMilliseconds} ms');

  // Membuat list data baru untuk pengurutan descending
  List<num> dataDesc = List.generate(10, (index) => (index + 1)..toDouble());
  print("\nData sebelum diurutkan (descending):");
  printData(dataDesc);

  // Mengukur waktu eksekusi merge sort descending
  startTime = DateTime.now();
  // Parameter terakhir 'false' berarti pengurutan descending
  mergeSortWithFlag(dataDesc, 0, dataDesc.length - 1, false);
  elapsedTime = DateTime.now().difference(startTime);

  // Menampilkan hasil pengurutan descending
  print("\nData setelah diurutkan (descending):");
  printData(dataDesc);
  print('Waktu pengurutan descending: ${elapsedTime.inMilliseconds} ms');
}

// Implementasi awal mergeSort (ascending only)
void mergeSort<T extends Comparable<T>>(List<T> arr, int l, int r) {
  int med;
  if (l < r) {
    med = (l + r) ~/ 2;
    mergeSort(arr, l, med);
    mergeSort(arr, med + 1, r);
    merge(arr, l, med, r);
  }
}

// Implementasi mergeSort dengan flag untuk menentukan jenis pengurutan
// (ascending atau descending)
void mergeSortWithFlag<T extends Comparable<T>>(List<T> arr, int l, int r, bool ascending) {
  int med;
  if (l < r) {
    // Menghitung titik tengah array
    med = (l + r) ~/ 2;
    // Mengurutkan setengah bagian pertama
    mergeSortWithFlag(arr, l, med, ascending);
    // Mengurutkan setengah bagian kedua
    mergeSortWithFlag(arr, med + 1, r, ascending);
    // Menggabungkan kedua bagian tersebut dengan flag ascending/descending
    mergeWithFlag(arr, l, med, r, ascending);
  }
}

// Implementasi awal merge (ascending only)
void merge<T extends Comparable<T>>(
    List<T> arr, int left, int median, int right) {
  List<T?> temp = List.filled(arr.length, null);
 
  int kiri1, kanan1, kiri2, kanan2, i, j;
  kiri1 = left;
  kanan1 = median;
  kiri2 = median + 1;
  kanan2 = right;
  i = left;
 
  while ((kiri1 <= kanan1) && (kiri2 <= kanan2)) {
    if (arr[kiri1].compareTo(arr[kiri2]) <= 0) {
      temp[i] = arr[kiri1];
      kiri1++;
    } else {
      temp[i] = arr[kiri2];
      kiri2++;
    }
    i++;
  }

  while (kiri1 <= kanan1) {
    temp[i] = arr[kiri1];
    kiri1++;
    i++;
  }
 
  while (kiri2 <= kanan2) {
    temp[i] = arr[kiri2];
    kiri2++;
    i++;
  }
  j = left;
 
  while (j <= right) {
    arr[j] = temp[j]!;
    j++;
  }
}

// Implementasi merge dengan flag untuk menentukan jenis pengurutan
// (ascending atau descending)
void mergeWithFlag<T extends Comparable<T>>(
    List<T> arr, int left, int median, int right, bool ascending) {
  // Array sementara untuk menyimpan hasil penggabungan
  List<T?> temp = List.filled(arr.length, null);
 
  int kiri1, kanan1, kiri2, kanan2, i, j;
  kiri1 = left;
  kanan1 = median;
  kiri2 = median + 1;
  kanan2 = right;
  i = left;
 
  while ((kiri1 <= kanan1) && (kiri2 <= kanan2)) {
    // Bandingkan elemen dari kedua bagian berdasarkan flag ascending
    // Jika ascending=true, urutan kecil ke besar
    // Jika ascending=false, urutan besar ke kecil
    if ((ascending && arr[kiri1].compareTo(arr[kiri2]) <= 0) || 
        (!ascending && arr[kiri1].compareTo(arr[kiri2]) >= 0)) {
      temp[i] = arr[kiri1];
      kiri1++;
    } else {
      temp[i] = arr[kiri2];
      kiri2++;
    }
    i++;
  }

  // Salin sisa elemen dari bagian pertama ke array sementara
  while (kiri1 <= kanan1) {
    temp[i] = arr[kiri1];
    kiri1++;
    i++;
  }
 
  // Salin sisa elemen dari bagian kedua ke array sementara
  while (kiri2 <= kanan2) {
    temp[i] = arr[kiri2];
    kiri2++;
    i++;
  }
  
  // Salin kembali elemen dari array sementara ke array asli
  j = left;
  while (j <= right) {
    arr[j] = temp[j]!;
    j++;
  }
}

// Fungsi untuk mencetak isi dari list
void printData<T>(List<T> data) {
  for (T objek in data) {
    print('$objek ');
  }
  print('');
}