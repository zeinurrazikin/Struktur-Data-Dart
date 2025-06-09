import 'dart:io';

class DoubleNode<T> {
  T data;
  DoubleNode<T>? prev; // Referensi ke node sebelumnya
  DoubleNode<T>? next; // Referensi ke node berikutnya

  DoubleNode(this.data, [this.prev, this.next]);
}

class DoublyLinkedList<T> {
  DoubleNode<T>? head; // Node pertama
  DoubleNode<T>? tail; // Node terakhir

  // Menambahkan data di akhir
  void append(T data) {
    final newNode = DoubleNode<T>(data, tail, null);

    if (tail != null) {
      tail!.next = newNode;
    } else {
      head = newNode; // List kosong
    }
 
    tail = newNode;
  }

  // Menampilkan dari depan ke belakang
  void printForward() {
    DoubleNode<T>? current = head;
    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }

  // Menampilkan dari belakang ke depan
  void printBackward() {
    DoubleNode<T>? current = tail;
    while (current != null) {
      print(current.data);
      current = current.prev;
    }
  }
}

void main() {
  final dll = DoublyLinkedList<String>();

  dll.append("10");
  dll.append("20");
  dll.append("30");

  print("Dari depan:");
  dll.printForward();

  print("\nDari belakang:");
  dll.printBackward();
}
