List<int> fibonacciList = [];

void main() {
  for (int i = 1; i <= 10; i++) {
  //int i = 1: Inisialisasi variabel counter i mulai dari 1.
  //i <= 8: Kondisi loop yang memeriksa apakah i kurang dari atau sama dengan 8. Loop akan berhenti setelah mencapai 8.
  //i++: Increment i sebanyak 1 setelah setiap iterasi. Jadi, i akan mengambil nilai 1, 2, 3, ... hingga 10.

    fibonacciList.add(fibonacciRekursif(i));
  } //fibonacciRekursif(i): Memanggil fungsi fibonacciRekursif dengan argumen i untuk menghitung nilai Fibonacci ke-i.
    //add(...): Menambahkan hasil dari fungsi fibonacciRekursif(i) ke dalam fibonacciList. Setelah semua iterasi, 
    //list ini akan berisi 8 angka pertama dari deret Fibonacci.

  print(fibonacciList);
}

int fibonacciRekursif(int n) {
  if (n == 1 || n == 2) {
    return 1;
  } else {
    return fibonacciRekursif(n - 1) + fibonacciRekursif(n - 2);
  }
} 

