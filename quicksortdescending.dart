void main() {
  // Membuat list data dengan 10 elemen (angka 1 sampai 10)
  List<num> data = List.generate(10, (index) => (index + 1)..toDouble());
  print("Data sebelum diurutkan (ascending):");
  printData(data);

  // Mengukur waktu eksekusi quick sort ascending
  DateTime startTime = DateTime.now();
  quickSort(data, 0, data.length - 1);
  Duration elapsedTime = DateTime.now().difference(startTime);

  // Menampilkan hasil pengurutan ascending
  print("Data setelah diurutkan (ascending):");
  printData(data);
  print('Waktu ${elapsedTime.inMilliseconds}');

  // Membuat list data baru untuk pengurutan descending
  List<num> dataDesc = List.generate(10, (index) => (index + 1)..toDouble());
  print("\nData sebelum diurutkan (descending):");
  printData(dataDesc);

  // Mengukur waktu eksekusi quick sort descending
  startTime = DateTime.now();
  quickSortDescending(dataDesc, 0, dataDesc.length - 1);
  elapsedTime = DateTime.now().difference(startTime);

  // Menampilkan hasil pengurutan descending
  print("Data setelah diurutkan (descending):");
  printData(dataDesc);
  print('Waktu ${elapsedTime.inMilliseconds}');
}

// Fungsi quick sort untuk pengurutan ascending (kecil ke besar)
void quickSort<T extends Comparable<T>>(List<T> arr, int p, int r) {
  int q;
  if (p < r) {
    // Mendapatkan indeks pivot setelah partisi
    q = partition(arr, p, r);
    // Mengurutkan bagian kiri dari pivot
    quickSort(arr, p, q);
    // Mengurutkan bagian kanan dari pivot
    quickSort(arr, q + 1, r);
  }
}

// Fungsi quick sort untuk pengurutan descending (besar ke kecil)
void quickSortDescending<T extends Comparable<T>>(List<T> arr, int p, int r) {
  int q;
  if (p < r) {
    // Mendapatkan indeks pivot setelah partisi dengan metode descending
    q = partitionDescending(arr, p, r);
    // Mengurutkan bagian kiri dari pivot
    quickSortDescending(arr, p, q);
    // Mengurutkan bagian kanan dari pivot
    quickSortDescending(arr, q + 1, r);
  }
}

// Fungsi partition untuk pengurutan ascending
int partition<T extends Comparable<T>>(List<T> arr, int p, int r) {
  int i, j;
  T pivot, temp;
  // Memilih elemen pertama sebagai pivot
  pivot = arr[p];
  i = p;
  j = r;
  while (i <= j) {
    // Mencari elemen yang lebih kecil atau sama dengan pivot dari kanan
    while (pivot.compareTo(arr[j]) < 0) j--;
    // Mencari elemen yang lebih besar atau sama dengan pivot dari kiri
    while (pivot.compareTo(arr[i]) > 0) i++;
    // Jika indeks i masih kurang dari j, tukar elemen
    if (i < j) {
      temp = arr[i];
      arr[i] = arr[j];
      arr[j] = temp;
      j--;
      i++;
    } else {
      // Jika i >= j, kembalikan posisi j sebagai posisi pivot
      return j;
    }
  }
  return j;
}

// Fungsi partition untuk pengurutan descending
int partitionDescending<T extends Comparable<T>>(List<T> arr, int p, int r) {
  int i, j;
  T pivot, temp;
  // Memilih elemen pertama sebagai pivot
  pivot = arr[p];
  i = p;
  j = r;
  while (i <= j) {
    // Mencari elemen yang lebih besar atau sama dengan pivot dari kanan
    // Perhatikan kondisi perbandingan yang dibalik dari partition normal
    while (pivot.compareTo(arr[j]) > 0) j--;
    // Mencari elemen yang lebih kecil atau sama dengan pivot dari kiri
    // Perhatikan kondisi perbandingan yang dibalik
    while (pivot.compareTo(arr[i]) < 0) i++;
    // Jika indeks i masih kurang dari j, tukar elemen
    if (i < j) {
      temp = arr[i];
      arr[i] = arr[j];
      arr[j] = temp;
      j--;
      i++;
    } else {
      // Jika i >= j, kembalikan posisi j sebagai posisi pivot
      return j;
    }
  }
  return j;
}

// Fungsi untuk mencetak isi dari list
void printData<T>(List<T> data) {
  for (T objek in data) {
    print('$objek ');
  }
  print('');
}