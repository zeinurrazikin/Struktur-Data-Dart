import 'dart:io'; // Import library untuk input/output

// Class untuk merepresentasikan node dalam double linked list
class Dnode<T> {
  T nodeValue; // Data yang disimpan dalam node
  Dnode<T>? prev; // Pointer ke node sebelumnya (nullable)
  Dnode<T>? next; // Pointer ke node berikutnya (nullable)

  // Constructor untuk membuat node baru
  Dnode(this.nodeValue)
      : prev = null,
        next = null;
}

// Class utama untuk mengelola double linked list
class DoubleLinkedList<T> {
  Dnode<T>? head; // Pointer ke node pertama (head)
  Dnode<T>? tail; // Pointer ke node terakhir (tail)

  // Method untuk mengecek apakah list kosong
  bool isEmpty() {
    return head == null; // Return true jika head null (list kosong)
  }

  // Method utama: Menambahkan node di awal list
  void InsertBeforeHead(T data) {
    // 1. Membuat node baru dengan data yang diberikan
    Dnode<T> newNode = Dnode(data);

    // 2. Mengecek apakah list kosong
    if (isEmpty()) {
      // Jika kosong, node baru menjadi head dan tail
      head = newNode;
      tail = newNode;
    } else {
      // Jika tidak kosong:
      // a. Node baru menunjuk ke head lama sebagai next-nya
      newNode.next = head;
      // b. Head lama menunjuk ke node baru sebagai prev-nya
      head!.prev = newNode;
      // c. Node baru menjadi head baru
      head = newNode;
    }
  }

  // Method untuk mencetak isi list dari head ke tail
  void printList() {
    Dnode<T>? current = head; // Mulai dari head
    stdout.write('Isi List: ');

    // Traverse melalui semua node
    while (current != null) {
      stdout.write('${current.nodeValue} '); // Cetak nilai node
      current = current.next; // Pindah ke node berikutnya
    }
    print(''); // Cetak baris baru
  }
}

// Fungsi utama untuk menjalankan program
void main() {
  // Membuat instance DoubleLinkedList untuk integer
  var dll = DoubleLinkedList<int>();

  // Demo 1: Menyisipkan ke list kosong
  print('1. InsertBeforeHead(30) ke list kosong:');
  dll.InsertBeforeHead(30);
  dll.printList();

  // Demo 2: Menyisipkan di awal list yang sudah berisi
  print('\n2. InsertBeforeHead(20):');
  dll.InsertBeforeHead(20);
  dll.printList();

  // Demo 3: Menyisipkan lagi di awal list
  print('\n3. InsertBeforeHead(10):');
  dll.InsertBeforeHead(10);
  dll.printList();
}
