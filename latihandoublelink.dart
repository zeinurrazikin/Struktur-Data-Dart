// Kelas untuk merepresentasikan node pada Double Linked List
class DNode<T> {
  T data; // Menyimpan data/nodeValue
  DNode<T>? prev; // Pointer ke node sebelumnya
  DNode<T>? next; // Pointer ke node berikutnya

  // Constructor untuk membuat node baru
  DNode(this.data);
}

// Kelas utama untuk mengelola Double Linked List
class DoubleLinkedList<T> {
  DNode<T>? head; // Pointer ke node pertama
  DNode<T>? tail; // Pointer ke node terakhir

  // Method untuk mengecek apakah list kosong
  bool isEmpty() => head == null;

  // Method untuk menambahkan node di akhir list
  void tambahDiAkhir(T data) {
    DNode<T> newNode = DNode(data);

    if (isEmpty()) {
      head = tail = newNode;
    } else {
      tail!.next = newNode;
      newNode.prev = tail;
      tail = newNode;
    }
  }

  // Method utama: Menambahkan node baru sebelum node target
  void tambahNode_Sebelum(DNode<T> newNode, DNode<T> target) {
    // Jika target adalah head, node baru akan menjadi head baru
    if (target == head) {
      newNode.next = head;
      head!.prev = newNode;
      head = newNode;
    }
    // Jika target bukan head
    else {
      // Cari node sebelum target dengan traversal maju
      DNode<T>? current = head;
      while (current != null && current.next != target) {
        current = current.next;
      }

      // Jika target ditemukan dalam list
      if (current != null) {
        // Sambungkan node baru dengan node sebelum target
        newNode.prev = current;
        newNode.next = current.next;

        // Sambungkan node sebelum target ke node baru
        current.next = newNode;

        // Sambungkan target ke node baru
        if (newNode.next != null) {
          newNode.next!.prev = newNode;
        }
      } else {
        print('Target node tidak ditemukan dalam list!');
      }
    }
  }

  // Method untuk mencetak list dari head ke tail
  void cetakList() {
    DNode<T>? current = head;
    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }
}

void main() {
  // Membuat instance DoubleLinkedList untuk integer
  var dll = DoubleLinkedList<int>();

  // Menambahkan beberapa data awal
  dll.tambahDiAkhir(10);
  dll.tambahDiAkhir(20);
  dll.tambahDiAkhir(30);

  print('List awal:');
  dll.cetakList();

  // Membuat node baru dan target
  var nodeBaru = DNode<int>(15);
  var target = dll.head!.next!; // Target adalah node dengan nilai 20

  print('\nMenambahkan 15 sebelum 20:');
  dll.tambahNode_Sebelum(nodeBaru, target);
  dll.cetakList();

  // Tambah node di awal (sebelum head)
  var nodeBaru2 = DNode<int>(5);
  var target2 = dll.head!; // Target adalah head (nilai 10)

  print('\nMenambahkan 5 sebelum 10:');
  dll.tambahNode_Sebelum(nodeBaru2, target2);
  dll.cetakList();
}
