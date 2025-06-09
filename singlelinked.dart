class Node {
  int data;
  Node? next;

  Node(this.data);
}

class LinkedList {
  Node? head;

  // Mengecek apakah Linked List kosong
  bool isEmpty() {  
    return head == null;
  }

  void insertFront(int data) {
    Node baru = Node(data);
    if (isEmpty()) {
      head = baru;
    } else {
      baru.next = head;
      head = baru;
    }
  }

  // Menyisipkan node di belakang (akhir) Linked List
  void insertBack(int data) {
    Node baru = Node(data);
    if (isEmpty()) {
      head = baru;
    } else {
      Node? bantu = head;
      while (bantu!.next != null) {
        bantu = bantu.next;
      }
      bantu.next = baru;
    }
    print("Node dengan data $data berhasil disisipkan di belakang.");
  }

  // Menyisipkan node di tengah Linked List
  void insertMiddle(int data, int index) {
    Node baru = Node(data);
    if (isEmpty()) {
      head = baru;
    } else if (index == 0) {
      insertFront(data);
    } else {
      Node? bantu = head;
      for (int i = 0; i < index - 1; i++) {
        if (bantu == null || bantu.next == null) {
          print("Index melebihi batas Linked List.");
          return;
        }
        bantu = bantu.next;
      }
      baru.next = bantu!.next;
      bantu.next = baru;
    }
    print("Node dengan data $data berhasil disisipkan di posisi $index.");
  }

  // Menampilkan elemen dalam Linked List
  void display() {
    if (isEmpty()) {
      print("Linked List kosong.");
      return;
    }

    Node? current = head;
    print("Isi Linked List:");
    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }
}

void main() {
  LinkedList L = LinkedList();

  // Menyisipkan elemen di depan
  L.insertFront(10);
  L.insertFront(20);

  // Menyisipkan elemen di belakang
  L.insertBack(30);

  // Menyisipkan elemen di tengah
  L.insertMiddle(25, 2);
  
  // Menampilkan elemen Linked List
  L.display();
}
