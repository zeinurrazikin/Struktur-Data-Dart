import 'dart:io';

void BubbleSort(List<int> arr) {
  int n = arr.length;
  for (int i = 0; i < n - 1; i++) {
    for (int j = 0; j < n - i - 1; j++)
    if (arr[j] < arr[j + 1]) {
      int temp = arr[j];
      arr[j] = arr[j + 1];
      arr[j + 1] = temp;
    }
  }
}
void main() {
  stdout.write('arr');
  List<int> arr = [66, 34, 25, 12, 22, -60, 11, 90];
  BubbleSort(arr);
  print(arr);
}