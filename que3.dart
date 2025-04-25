// Implementasi Queue dengan konsep Circular Array di Dart
class CircularQueue {
  // Deklarasi variabel
  late List<int?> element;  // Array untuk menyimpan elemen queue
  late int front;          // Indeks untuk elemen terdepan
  late int rear;           // Indeks untuk elemen terakhir
  late int maxQueue;       // Ukuran maksimum queue
  
  // Konstruktor
  CircularQueue(int size) {
    element = List<int?>.filled(size, null);  // Inisialisasi array dengan null
    maxQueue = size - 1;  // Set ukuran maksimum
    front = -1;           // Inisialisasi front dengan -1 (queue kosong)
    rear = -1;            // Inisialisasi rear dengan -1 (queue kosong)
  }
  
  // Memeriksa apakah queue kosong
  bool isEmpty() {
    return front == -1;
  }
  
  // Memeriksa apakah queue penuh
  bool isFull() {
    // Queue penuh jika front = 0 dan rear = maxQueue
    // atau jika front = rear + 1
    return (front == 0 && rear == maxQueue) || (front == rear + 1);
  }
  
  // Menambahkan data ke queue
  void enqueue(int data) {
    if (isFull()) {
      print("Queue Overflow, tidak dapat mengisi data lagi");
    } else {
      // Jika queue kosong, set front ke 0
      if (front == -1) {
        front = 0;
      }
      
      // Update rear dengan circular increment
      if (rear != maxQueue) {
        rear += 1;
      } else {
        rear = 0;
      }
      
      // Simpan data ke array pada indeks rear
      element[rear] = data;
      print("Berhasil menambahkan data: $data");
    }
  }
  
  // Menghapus dan mengembalikan data dari queue
  int? dequeue() {
    if (isEmpty()) {
      print("Queue Underflow, tidak ada data yang dapat diambil");
      return null;
    } else {
      int? data = element[front];  // Simpan data yang akan dihapus
      element[front] = null;       // Hapus data dari array
      
      // Jika front = rear, berarti ini elemen terakhir
      if (front == rear) {
        front = -1;  // Reset queue menjadi kosong
        rear = -1;
      } 
      // Jika front di akhir array, kembalikan ke awal
      else if (front == maxQueue) {
        front = 0;
      } 
      // Dalam kasus lain, increment front
      else {
        front += 1;
      }
      
      print("Data yang diambil: $data");
      return data;
    }
  }
  
  // Mengintip data terdepan tanpa menghapusnya
  int? peek() {
    if (isEmpty()) {
      print("Queue kosong, tidak ada data untuk dilihat");
      return null;
    } else {
      return element[front];
    }
  }
  
  // Menampilkan isi queue
  void display() {
    if (isEmpty()) {
      print("Queue kosong");
      return;
    }
    
    print("Elemen dalam queue: ");
    
    // Jika front <= rear, iterasi langsung dari front ke rear
    if (front <= rear) {
      for (int i = front; i <= rear; i++) {
        print("${element[i]} ");
      }
    } 
    // Jika front > rear, iterasi dari front ke maxQueue, lalu dari 0 ke rear
    else {
      // Dari front sampai akhir array
      for (int i = front; i <= maxQueue; i++) {
        print("${element[i]} ");
      }
      // Dari awal array sampai rear
      for (int i = 0; i <= rear; i++) {
        print("${element[i]} ");
      }
    }
    
    print("\nFront: $front, Rear: $rear");
  }
}

// Fungsi main untuk menguji implementasi CircularQueue
void main() {
  // Membuat queue dengan kapasitas 5
  CircularQueue queue = CircularQueue(5);
  
  // Menguji operasi queue
  print("Status awal queue:");
  print("Kosong? ${queue.isEmpty()}");
  print("Penuh? ${queue.isFull()}");
  
  // Menambahkan beberapa elemen
  print("\nMenambahkan elemen:");
  queue.enqueue(10);
  queue.enqueue(20);
  queue.enqueue(30);
  queue.display();
  
  // Mengambil beberapa elemen
  print("\nMengambil elemen:");
  queue.dequeue();
  queue.display();
  
  // Menambahkan elemen lagi untuk menunjukkan circular
  print("\nMenambahkan elemen lagi (menunjukkan circular):");
  queue.enqueue(40);
  queue.enqueue(50);
  queue.display();
  
  // Coba tambahkan elemen ketika queue penuh
  print("\nMencoba menambahkan elemen saat queue penuh:");
  queue.enqueue(60);
  
  // Lihat elemen depan
  print("\nElemen terdepan: ${queue.peek()}");
  
  // Kosongkan queue
  print("\nMengosongkan queue:");
  while (!queue.isEmpty()) {
    queue.dequeue();
  }
  
  // Cek status akhir
  print("\nStatus akhir queue:");
  print("Kosong? ${queue.isEmpty()}");
  queue.display();
}