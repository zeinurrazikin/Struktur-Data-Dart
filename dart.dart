import 'dart:math';

void main() {
  // Data acak (tidak urut)
  List<int> dataAsli = [42, 17, 63, 29, 8, 94, 55];

  print('Data Asli: $dataAsli');

  // Simpan pasangan nilai dan indeks aslinya
  List<MapEntry<int, int>> dataUrut = dataAsli
      .asMap()
      .entries
      .map((entry) => MapEntry(entry.value, entry.key)) // (nilai, indeksAsli)
      .toList();

  // Urutkan berdasarkan nilai
  dataUrut.sort((a, b) => a.key.compareTo(b.key));

  // Nilai yang ingin dicari
  int target = 29;

  // Binary Search
  int? indeksAsli = binarySearch(dataUrut, target);

  if (indeksAsli != null) {
    print(' Nilai $target ditemukan pada indeks asli: $indeksAsli');
  } else {
    print(' Nilai $target tidak ditemukan.');
  }
}

// Fungsi binary search dengan pengembalian indeks asli
int? binarySearch(List<MapEntry<int, int>> data, int target) {
  int low = 0;
  int high = data.length - 1;

  while (low <= high) {
    int mid = (low + high) ~/ 2;
    int nilai = data[mid].key;

    if (nilai == target) {
      return data[mid].value; // indeks asli
    } else if (nilai < target) {
      low = mid + 1;
    } else {
      high = mid - 1;
    }
  }

  return null;
}
