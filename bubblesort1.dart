void bubbleSortFlag<T extends Comparable<T>>(List<T> arr) {
  int i = 0, j;
  bool didSwap = true;
  T temp;
  while (i < arr.length - 1 && didSwap) {
  didSwap = false;
  for (j = 0; j < arr.length - i - 1; j++) {
     if (arr[j].compareTo(arr[j + 1]) > 0) {
      temp = arr[j + 1];
    arr[j + 1] = arr[j];
    arr[j] = temp;
    didSwap = true;
 }
 }
    i++;
 }
}

void display<T>(List<T> data) {
   for (T objek in data) {
     print('$objek ');
 }
 print('');
}
void main() {
 List<num> data = List<num>.generate(10, (index)=>(index + 1) * 2);
 data.shuffle();
 print('Data Sebelum Pengurutan:');
 display(data);
 
 DateTime start = DateTime.now();
 bubbleSortFlag(data);
 Duration elapsedTime = DateTime.now().difference(start);
 print('Data Setelah Pengurutan:');
 display(data);
 print('Waktu: ${elapsedTime.inMilliseconds} ms');
}
