// Kelas untuk merepresentasikan node pada double linked list
class DNode {
  dynamic data; // Menyimpan nilai/data dari node
  DNode? prev; // Pointer ke node sebelumnya (bisa null)
  DNode? next; // Pointer ke node berikutnya (bisa null)

  // Constructor untuk membuat node baru dengan data tertentu
  DNode(this.data);
}

// Kelas utama untuk mengelola double linked list
class DoubleLinkedList {
  DNode? head; // Pointer ke node pertama (head)
  DNode? tail; // Pointer ke node terakhir (tail)

  // Method untuk mengecek apakah list kosong
  bool isEmpty() => head == null; // Mengembalikan true jika head null

  // Method untuk menambahkan node baru di akhir list
  void insertTailNode(dynamic data) {
    // Membuat node baru dengan data yang diberikan
    DNode newNode = DNode(data);

    // Mengecek apakah list kosong
    if (isEmpty()) {
      // Jika kosong, jadikan node baru sebagai head dan tail
      head = tail = newNode;
    } else {
      // Jika tidak kosong:
      // 1. Hubungkan next dari tail saat ini ke node baru
      tail!.next = newNode;
      // 2. Hubungkan prev dari node baru ke tail saat ini
      newNode.prev = tail;
      // 3. Jadikan node baru sebagai tail yang baru
      tail = newNode;
    }
  }

  // Method untuk mencetak semua elemen dari head ke tail
  void printList() {
    // Mulai dari head list
    var current = head;
    // Telusuri setiap node sampai akhir
    while (current != null) {
      // Cetak data dari node saat ini
      print(current.data);
      // Pindah ke node berikutnya
      current = current.next;
    }
  }
}

void main() {
  // Membuat instance baru double linked list
  var dll = DoubleLinkedList();

  // Test 1: Menyisipkan ke list kosong
  dll.insertTailNode(10);
  print("Setelah menambahkan 10:");
  dll.printList();

  // Test 2: Menyisipkan node lain di akhir
  dll.insertTailNode(20);
  print("\nSetelah menambahkan 20:");
  dll.printList();

  // Test 3: Menyisipkan node lain di akhir
  dll.insertTailNode(30);
  print("\nSetelah menambahkan 30:");
  dll.printList();
}
