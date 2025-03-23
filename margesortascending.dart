void main() {
  List<num> data = List.generate(10, (index) => (index + 1)..toDouble());
  printData(data);

  DateTime startTime = DateTime.now();
  mergeSort(data, 0, data.length - 1);
  Duration elapsedTime = DateTime.now().difference(startTime);

 printData(data);
 print('\nwaktu : ${elapsedTime.inMilliseconds}');
}

void mergeSort<T extends Comparable<T>>(List<T> arr, int l, int r) {
  int med;
  if (l < r) {
    med = (l + r) ~/ 2;
    mergeSort(arr, l, med);
    mergeSort(arr, med + 1, r);
    merge(arr, l, med, r);
 }
}

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
void printData<T>(List<T> data) {
 for (T objek in data) {
 print('$objek ');
 }
 print('');
}