import 'dart:io'; // Import untuk stdout.write

// Kelas node untuk Double Linked List dengan generic type T
class DNode<T> {
  T nodeValue; // data value dari node
  DNode<T>? prev; // pointer ke node sebelumnya dalam list
  DNode<T>? next; // pointer ke node berikutnya dalam list

  // Constructor default; membuat object dengan nilai dan pointer ke null
  DNode(this.nodeValue)
      : next = null,
        prev = null;
}

// Kelas untuk mengelola Double Linked List
class DoubleLinkedList<T> {
  DNode<T>? head; // pointer ke node pertama
  DNode<T>? tail; // pointer ke node terakhir

  // Constructor untuk membuat Double Linked List kosong
  DoubleLinkedList()
      : head = null,
        tail = null;

  // Memeriksa apakah list kosong
  bool isEmpty() {
    return head == null;
  }

  // Menambahkan data node baru ke list kosong
  void append(T data) {
    DNode<T> newNode = DNode<T>(data);
    if (isEmpty()) {
      head = newNode;
      tail = newNode;
      // Node pertama tidak punya prev dan next
      head!.next = null;
      head!.prev = null;
    } else {
      print("Data sudah ada pada Linked List!");
    }
  }

  // Menambahkan data sebelum head
  void insertBeforeHead(T data) {
    DNode<T> newNode = DNode<T>(data);
    if (isEmpty()) {
      append(data); // Gunakan append jika list kosong
    } else {
      newNode.next = head;
      head!.prev = newNode;
      head = newNode;
      // Update tail jika hanya ada satu node
      if (tail == null) {
        tail = head;
      }
    }
  }

  // Menambahkan data baru di akhir node (tail)
  void insertTailNode(T data) {
    DNode<T> newNode = DNode<T>(data);
    if (isEmpty()) {
      append(data); // Gunakan append jika list kosong
    } else {
      // Cara yang lebih efisien dengan menggunakan pointer tail
      tail!.next = newNode;
      newNode.prev = tail;
      tail = newNode;
    }
  }

  // Menyisipkan node baru setelah node tertentu
  void insertAfter(DNode<T>? temp, T data) {
    if (temp == null) {
      print("Node tidak ditemukan.");
      return;
    }

    DNode<T> newNode = DNode<T>(data);
    newNode.next = temp.next;
    newNode.prev = temp;

    if (temp.next != null) {
      temp.next!.prev = newNode;
    } else {
      // Jika menyisipkan setelah node terakhir, update tail
      tail = newNode;
    }

    temp.next = newNode;
  }

  // Menghapus node di depan (head)
  void deleteFront() {
    if (!isEmpty()) {
      if (head!.next != null) {
        DNode<T>? delete = head;
        head = head!.next;
        head!.prev = null;
        delete!.next = null;

        // Jika head adalah node terakhir, update tail
        if (head!.next == null) {
          tail = head;
        }
      } else {
        // Jika hanya ada satu node, hapus head dan tail
        head = null;
        tail = null;
      }
    }
  }

  // Menghapus node di akhir (tail)
  void deleteEnd() {
    if (!isEmpty()) {
      if (head!.next != null) {
        // Gunakan tail untuk efisiensi
        DNode<T>? delete = tail;
        tail = tail!.prev;
        tail!.next = null;
        delete!.prev = null;

        // Jika tail adalah node pertama, update head
        if (tail!.prev == null) {
          head = tail;
        }
      } else {
        // Jika hanya ada satu node, hapus head dan tail
        head = null;
        tail = null;
      }
    }
  }

  // Mencari node dengan data tertentu
  DNode<T>? findNode(T data) {
    if (isEmpty()) {
      return null;
    }

    DNode<T>? current = head;
    while (current != null) {
      if (current.nodeValue == data) {
        return current;
      }
      current = current.next;
    }

    return null; // Data tidak ditemukan
  }

  // Mencetak isi list dari depan dan belakang
  void printList() {
    if (isEmpty()) {
      print("List kosong");
      return;
    }

    DNode<T>? current = head;

    print("Traversal in Forward Direction: ");
    while (current != null) {
      stdout.write("${current.nodeValue} ");
      current = current.next;
    }
    print("");

    print("Traversal in Reverse Direction: ");
    current = tail;
    while (current != null) {
      stdout.write("${current.nodeValue} ");
      current = current.prev;
    }
    print("");
  }
}

// Contoh penggunaan
void main() {
  DoubleLinkedList<int> list = DoubleLinkedList<int>();

  // Tambahkan beberapa data
  list.append(10);
  list.insertBeforeHead(5);
  list.insertTailNode(15);
  list.insertTailNode(20);

  // Cetak isi list
  print("List awal:");
  list.printList();

  // Cari node dengan nilai 15
  DNode<int>? nodeFound = list.findNode(15);
  if (nodeFound != null) {
    print("\nNode dengan nilai 15 ditemukan");
    // Sisipkan nilai setelah node yang ditemukan
    list.insertAfter(nodeFound, 17);

    print("\nList setelah menyisipkan 17 setelah 15:");
    list.printList();
  }

  // Hapus node di depan dan belakang
  print("\nHapus node depan (head):");
  list.deleteFront();
  list.printList();

  print("\nHapus node belakang (tail):");
  list.deleteEnd();
  list.printList();
}
