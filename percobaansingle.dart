// Kelas Node untuk merepresentasikan satu elemen dalam Linked List
class Node {
  // Data yang disimpan dalam node
  int data;
  // Pointer ke node berikutnya, null jika ini adalah node terakhir
  Node? next;

  // Constructor untuk membuat node baru
  Node(this.data, [this.next]);

  // Override toString untuk mempermudah pencetakan nilai node
  @override
  String toString() {
    return 'Node(data: $data)';
  }
}

// Kelas LinkedList untuk mengelola kumpulan node
class LinkedList {
  // Pointer ke node pertama (kepala) dari linked list
  Node? head;

  // Constructor untuk membuat linked list baru (kosong)
  LinkedList([this.head]);

  // Fungsi untuk mencari node dengan nilai data tertentu
  // Mengembalikan node jika ditemukan, null jika tidak ditemukan
  Node? findNode(int data) {
    // Mulai pencarian dari head (node pertama)
    Node? current = head;

    // Terus periksa node sampai mencapai akhir list (null)
    while (current != null) {
      // Jika data node saat ini sama dengan data yang dicari
      if (current.data == data) {
        // Node ditemukan, kembalikan node tersebut
        return current;
      }
      // Pindah ke node berikutnya untuk dilakukan pemeriksaan
      current = current.next;
    }

    // Jika sampai di sini, berarti data tidak ditemukan di list
    return null;
  }

  // Fungsi untuk menambahkan node baru di awal list
  void addFirst(int data) {
    // Buat node baru dengan next menunjuk ke head saat ini
    head = Node(data, head);
  }

  // Fungsi untuk menambahkan node baru di akhir list
  void addLast(int data) {
    // Buat node baru yang akan ditambahkan
    final newNode = Node(data);

    // Jika list kosong, jadikan node baru sebagai head
    if (head == null) {
      head = newNode;
      return;
    }

    // Temukan node terakhir
    Node? current = head;
    while (current?.next != null) {
      current = current?.next;
    }

    // Hubungkan node terakhir dengan node baru
    current?.next = newNode;
  }

  // Fungsi untuk mencetak seluruh isi linked list
  void printList() {
    Node? current = head;
    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }
}

// Contoh penggunaan
void main() {
  // Buat linked list baru
  final linkedList = LinkedList();

  // Tambahkan beberapa data
  linkedList.addLast(10);
  linkedList.addLast(20);
  linkedList.addLast(30);
  linkedList.addLast(40);

  print('Isi Linked List:');
  linkedList.printList();

  // Cari node dengan data 20
  Node? foundNode = linkedList.findNode(20);
  if (foundNode != null) {
    print('\nNode dengan data 20 ditemukan: $foundNode');
  } else {
    print('\nNode dengan data 20 tidak ditemukan.');
  }

  // Cari node dengan data 50 (tidak ada)
  foundNode = linkedList.findNode(50);
  if (foundNode != null) {
    print('Node dengan data 50 ditemukan: $foundNode');
  } else {
    print('Node dengan data 50 tidak ditemukan.');
  }
}
