// Kelas DNode dengan generic type T
class DNode<T> {
  T? nodeValue; // data value dari node
  DNode<T>? prev; // pointer ke node sebelumnya dalam list
  DNode<T>? next; // pointer ke node berikutnya dalam list

  // Default constructor, membuat node dengan nilai null
  // dan referensi menunjuk ke dirinya sendiri
  DNode() {
    nodeValue = null;
    next = this; // next node adalah dirinya sendiri
    prev = this; // previous node adalah dirinya sendiri
  }

  // Constructor dengan parameter, membuat node dengan nilai tertentu
  // dan referensi menunjuk ke dirinya sendiri
  DNode.withValue(T item) {
    nodeValue = item;
    next = this; // next node adalah dirinya sendiri
    prev = this; // previous node adalah dirinya sendiri
  }
}

// Contoh penggunaan
void main() {
  // Membuat node dengan constructor default
  var emptyNode = DNode<int>();
  print('Empty node value: ${emptyNode.nodeValue}');

  // Membuat node dengan nilai
  var valueNode = DNode<int>.withValue(10);
  print('Value node value: ${valueNode.nodeValue}');

  // Menunjukkan bahwa next dan prev menunjuk ke dirinya sendiri
  print('valueNode next points to itself: ${valueNode.next == valueNode}');
  print('valueNode prev points to itself: ${valueNode.prev == valueNode}');
}


