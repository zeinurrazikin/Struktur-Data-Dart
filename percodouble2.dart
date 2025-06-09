import 'dart:io';

class DNode<T> {
  T data;
  DNode<T>? prev;
  DNode<T>? next;

  DNode(this.data);
}

class DoubleLinkedList<T> {
  DNode<T>? head;
  DNode<T>? tail;

  // Method untuk mengecek apakah list kosong
  bool isEmpty() => head == null;

  // Method untuk menghapus node dari depan (sesuai gambar)
  void DeleteFront() {
    // 1. Cek apakah list tidak kosong
    if (!isEmpty()) {
      // 2. Jika list memiliki lebih dari satu node
      if (head!.next != null) {
        // a. Simpan node yang akan dihapus
        DNode<T>? delete = head;
        // b. Pindahkan head ke node berikutnya
        head = head!.next;
        // c. Putuskan hubungan head baru dengan node sebelumnya
        head!.prev = null;
        // d. Putuskan hubungan node yang dihapus dengan list
        delete!.next = null;
      }
      // 3. Jika hanya ada satu node
      else {
        head = null;
        tail = null; // Pastikan tail juga di-null-kan
      }
    }
  }

  // Method untuk mencetak list dari head ke tail
  void printList() {
    DNode<T>? current = head;
    stdout.write('Isi List: ');
    while (current != null) {
      stdout.write('${current.data} ');
      current = current.next;
    }
    print('');
  }
}

void main() {
  var dll = DoubleLinkedList<int>();

  // Test 1: Coba hapus dari list kosong
  print('1. Coba DeleteFront pada list kosong:');
  dll.DeleteFront();
  dll.printList();

  // Test 2: Hapus dari list dengan satu node
  print('\n2. Tambah 10, lalu DeleteFront:');
  dll.head = dll.tail = DNode(10); // Tambah node secara manual
  dll.printList();
  dll.DeleteFront();
  dll.printList();

  // Test 3: Hapus dari list dengan multiple nodes
  print('\n3. Tambah 20, 30, lalu DeleteFront:');
  dll.head = DNode(20);
  dll.tail = DNode(30);
  dll.head!.next = dll.tail;
  dll.tail!.prev = dll.head;
  dll.printList();
  dll.DeleteFront();
  dll.printList();
}
