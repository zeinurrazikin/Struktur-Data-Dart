// Implementasi Single Linked List di Dart
// Kelas untuk merepresentasikan node dalam linked list
class Node {
  // Data yang disimpan di node
  int data;
  // Pointer ke node berikutnya
  Node? next;

  // Constructor
  Node(this.data) {
    this.next = null;
  }
}

// Kelas untuk merepresentasikan Single Linked List
class SingleLinkedList {
  // Pointer ke node pertama (head)
  Node? head;

  // Constructor
  SingleLinkedList() {
    this.head = null;
  }

  // Metode untuk memeriksa apakah list kosong
  bool isEmpty() {
    return head == null;
  }

  // Metode untuk menambahkan node di depan
  void insertAtFront(int data) {
    // Membuat node baru
    Node newNode = Node(data);
    
    // Jika list kosong, node baru menjadi head
    if (isEmpty()) {
      head = newNode;
      return;
    }
    
    // Jika list tidak kosong, node baru menunjuk ke head
    // kemudian update head menjadi node baru
    newNode.next = head;
    head = newNode;
  }

  // Metode untuk menambahkan node di belakang
  void insertAtEnd(int data) {
    // Membuat node baru
    Node newNode = Node(data);
    
    // Jika list kosong, node baru menjadi head
    if (isEmpty()) {
      head = newNode;
      return;
    }
    
    // Jika list tidak kosong, cari node terakhir
    Node? temp = head;
    while (temp?.next != null) {
      temp = temp?.next;
    }
    
    // Node terakhir menunjuk ke node baru
    temp?.next = newNode;
  }

  // Metode untuk menghapus node di depan
  void deleteAtFront() {
    // Jika list kosong, tidak ada yang dihapus
    if (isEmpty()) {
      print("List kosong, tidak ada yang dihapus.");
      return;
    }
    
    // Update head ke node berikutnya
    head = head?.next;
    print("Node depan berhasil dihapus.");
  }

  // Metode untuk menghapus node di belakang
  void deleteAtEnd() {
    // Prinsip 1: Pastikan list tidak kosong
    if (isEmpty()) {
      print("List kosong, tidak ada yang dihapus.");
      return;
    }
    
    // Prinsip 2: Jika list berisi 1 node, head langsung diset sebagai null
    if (head?.next == null) {
      head = null;
      print("Node terakhir berhasil dihapus. List sekarang kosong.");
      return;
    }
    
    // Prinsip 2: Cari node sebelum terakhir dengan menggunakan node bantu
    Node? temp = head;
    while (temp?.next?.next != null) {
      temp = temp?.next;
    }
    
    // Prinsip 3: Set pointer next pada node sebelum terakhir dengan posisi null
    temp?.next = null;
    print("Node terakhir berhasil dihapus.");
  }

  // Metode untuk menampilkan semua node
  void display() {
    // Jika list kosong
    if (isEmpty()) {
      print("List kosong.");
      return;
    }
    
    // Mulai dari head
    Node? temp = head;
    print("Isi linked list: ");
    
    // Traversal dan tampilkan data setiap node
    String result = "";
    while (temp != null) {
      result += "${temp.data} -> ";
      temp = temp.next;
    }
    result += "null";
    print(result);
  }
}

// Contoh penggunaan
void main() {
  // Inisialisasi single linked list
  SingleLinkedList list = SingleLinkedList();
  
  // Tambahkan beberapa node
  list.insertAtEnd(10);
  list.insertAtEnd(20);
  list.insertAtEnd(30);
  list.insertAtEnd(40);
  
  // Tampilkan isi list
  print("Setelah menambahkan beberapa node:");
  list.display();
  
  // Hapus node di belakang
  print("\nMenghapus node di belakang:");
  list.deleteAtEnd();
  list.display();
  
  // Tambahkan node lagi
  print("\nMenambahkan node baru:");
  list.insertAtEnd(50);
  list.display();
  
  // Hapus node di belakang lagi
  print("\nMenghapus node di belakang lagi:");
  list.deleteAtEnd();
  list.display();
  
  // Hapus semua node hingga kosong
  print("\nMenghapus semua node hingga kosong:");
  list.deleteAtEnd();
  list.display();
  
  list.deleteAtEnd();
  list.display();
  
  list.deleteAtEnd();
  list.display();
}