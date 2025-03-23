import 'dart:io';
import 'dart:math';
import 'dart:core';

void main() {
  // Jumlah data yang akan diuji sesuai tabel
  List<int> dataSizes = [50000, 100000, 150000, 200000, 250000, 300000, 350000, 400000, 450000, 500000];
  
  // Map untuk menyimpan hasil waktu proses
  Map<String, Map<int, double>> results = {
    'Insertion': {},
    'Selection': {},
    'Bubble': {},
    'Shell': {},
    'Quick': {},
    'Merge': {}
  };
  
  // Lakukan pengujian untuk setiap ukuran data
  for (int size in dataSizes) {
    print('Testing with data size: $size');
    
    // Buat data acak yang sama untuk semua algoritma
    List<int> originalData = generateRandomList(size);
    
    // Uji setiap algoritma
    results['Insertion']![size] = testAlgorithm(originalData, insertionSort, 'Insertion Sort');
    results['Selection']![size] = testAlgorithm(originalData, selectionSort, 'Selection Sort');
    results['Bubble']![size] = testAlgorithm(originalData, bubbleSort, 'Bubble Sort');
    results['Shell']![size] = testAlgorithm(originalData, shellSort, 'Shell Sort');
    results['Quick']![size] = testAlgorithm(originalData, quickSort, 'Quick Sort');
    results['Merge']![size] = testAlgorithm(originalData, mergeSort, 'Merge Sort');
    
    print('');
  }
  
  // Cetak hasil dalam format CSV untuk memudahkan visualisasi dengan Excel
  printResultsCSV(results, dataSizes);
}

// Fungsi untuk menghasilkan list acak dengan ukuran tertentu
List<int> generateRandomList(int size) {
  Random random = Random();
  return List.generate(size, (_) => random.nextInt(1000000));
}

// Fungsi untuk menguji algoritma dan mengukur waktu eksekusi
double testAlgorithm(List<int> originalData, Function sortFunction, String algorithmName) {
  // Buat salinan data agar tidak mengubah data asli
  List<int> data = List.from(originalData);
  
  // Ukur waktu mulai
  DateTime startTime = DateTime.now();
  
  // Jalankan algoritma sorting
  sortFunction(data);
  
  // Ukur waktu selesai
  DateTime endTime = DateTime.now();
  
  // Hitung durasi dalam milidetik
  double durationInMs = endTime.difference(startTime).inMicroseconds / 1000;
  
  print('$algorithmName completed in ${durationInMs.toStringAsFixed(2)} ms');
  
  return durationInMs;
}

// Implementasi algoritma Insertion Sort
void insertionSort(List<int> arr) {
  for (int i = 1; i < arr.length; i++) {
    int key = arr[i];
    int j = i - 1;
    
    while (j >= 0 && arr[j] > key) {
      arr[j + 1] = arr[j];
      j--;
    }
    
    arr[j + 1] = key;
  }
}

// Implementasi algoritma Selection Sort
void selectionSort(List<int> arr) {
  for (int i = 0; i < arr.length - 1; i++) {
    int minIndex = i;
    
    for (int j = i + 1; j < arr.length; j++) {
      if (arr[j] < arr[minIndex]) {
        minIndex = j;
      }
    }
    
    if (minIndex != i) {
      int temp = arr[i];
      arr[i] = arr[minIndex];
      arr[minIndex] = temp;
    }
  }
}

// Implementasi algoritma Bubble Sort
void bubbleSort(List<int> arr) {
  for (int i = 0; i < arr.length - 1; i++) {
    bool swapped = false;
    
    for (int j = 0; j < arr.length - i - 1; j++) {
      if (arr[j] > arr[j + 1]) {
        // Swap
        int temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
        swapped = true;
      }
    }
    
    // Jika tidak ada swap pada iterasi ini, array sudah terurut
    if (!swapped) break;
  }
}

// Implementasi algoritma Shell Sort
void shellSort(List<int> arr) {
  int n = arr.length;
  
  // Mulai dengan gap besar, lalu kurangi
  for (int gap = n ~/ 2; gap > 0; gap ~/= 2) {
    for (int i = gap; i < n; i++) {
      int temp = arr[i];
      
      int j;
      for (j = i; j >= gap && arr[j - gap] > temp; j -= gap) {
        arr[j] = arr[j - gap];
      }
      
      arr[j] = temp;
    }
  }
}

// Implementasi algoritma Quick Sort
void quickSort(List<int> arr, [int? low, int? high]) {
  low = low ?? 0;
  high = high ?? arr.length - 1;
  
  if (low < high) {
    int pivotIndex = partition(arr, low, high);
    
    quickSort(arr, low, pivotIndex - 1);
    quickSort(arr, pivotIndex + 1, high);
  }
}

int partition(List<int> arr, int low, int high) {
  int pivot = arr[high];
  int i = low - 1;
  
  for (int j = low; j < high; j++) {
    if (arr[j] <= pivot) {
      i++;
      
      // Swap
      int temp = arr[i];
      arr[i] = arr[j];
      arr[j] = temp;
    }
  }
  
  // Swap pivot to its final position
  int temp = arr[i + 1];
  arr[i + 1] = arr[high];
  arr[high] = temp;
  
  return i + 1;
}

// Implementasi algoritma Merge Sort
void mergeSort(List<int> arr, [int? start, int? end]) {
  start = start ?? 0;
  end = end ?? arr.length - 1;
  
  if (start < end) {
    int mid = start + (end - start) ~/ 2;
    
    mergeSort(arr, start, mid);
    mergeSort(arr, mid + 1, end);
    
    merge(arr, start, mid, end);
  }
}

void merge(List<int> arr, int start, int mid, int end) {
  int n1 = mid - start + 1;
  int n2 = end - mid;
  
  List<int> leftArray = List<int>.filled(n1, 0);
  List<int> rightArray = List<int>.filled(n2, 0);
  
  for (int i = 0; i < n1; i++) {
    leftArray[i] = arr[start + i];
  }
  
  for (int j = 0; j < n2; j++) {
    rightArray[j] = arr[mid + 1 + j];
  }
  
  int i = 0, j = 0;
  int k = start;
  
  while (i < n1 && j < n2) {
    if (leftArray[i] <= rightArray[j]) {
      arr[k] = leftArray[i];
      i++;
    } else {
      arr[k] = rightArray[j];
      j++;
    }
    k++;
  }
  
  while (i < n1) {
    arr[k] = leftArray[i];
    i++;
    k++;
  }
  
  while (j < n2) {
    arr[k] = rightArray[j];
    j++;
    k++;
  }
}

// Fungsi untuk mencetak hasil dalam format CSV
void printResultsCSV(Map<String, Map<int, double>> results, List<int> dataSizes) {
  // Buat file CSV
  File file = File('sorting_results.csv');
  IOSink sink = file.openWrite();
  
  // Tulis header
  sink.write('Jumlah Data,Insertion,Selection,Bubble,Shell,Quick,Merge\n');
  
  // Tulis data untuk setiap ukuran
  for (int size in dataSizes) {
    sink.write('$size');
    
    for (String algorithm in ['Insertion', 'Selection', 'Bubble', 'Shell', 'Quick', 'Merge']) {
      double time = results[algorithm]![size]!;
      sink.write(',${time.toStringAsFixed(2)}');
    }
    
    sink.write('\n');
  }
  
  sink.close();
  print('Results saved to sorting_results.csv');
}