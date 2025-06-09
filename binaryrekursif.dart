int binarySearch(List<int> arr, int l, int r, int x) {
 if (r >= l) {
 int mid = l + (r - l) ~/ 2;
 if (arr[mid] == x) return mid;
 if (arr[mid] > x) return binarySearch(arr, l, mid - 1, x);
 return binarySearch(arr, mid + 1, r, x);
 }
 return -1;
}
void main() {
 List<int> arr = [2, 3, 4, 10, 40];
 int x = 10;
 int size = arr.length;
 int result = binarySearch(arr, 0, size - 1, x);
 if (result == -1) {
 print("Elemen tidak ada dalam array");
 } else {
 print("Elemen ditemukan pada indeks ke: $result");
 }
}