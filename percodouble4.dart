import 'dart:io';
//menambahkan class dari persiapan percobaan 4-6
class Dnode<T> {
  T nodeValue; // data value of the node
  Dnode? prev; // previous node in the list
  Dnode? next; // next node in the list
  /* default constructor; creates an object with the value set to null
and whose references point to the node itself */
  Dnode(this.nodeValue)
      : next = null,
        prev = null;
}

void printList(Dnode? node) {
  Dnode? tail;
  tail = null;
  print("Traversal in Forward Direction: ");
  while (node != null) {
    stdout.write("${node.nodeValue} ");
    tail = node;
    node = node.next;
  }
  print("");
  print("Traversal in Reverse Direction: ");
  while (tail != null) {
    stdout.write("${tail.nodeValue} ");
    tail = tail.prev;
  }
  print("");
}
//menambahkan main function
void main() {
  // Contoh penggunaan untuk menguji kode
  var node1 = Dnode<int>(1);
  var node2 = Dnode<int>(2);
  var node3 = Dnode<int>(3);
  
  // Membuat linked list sederhana: 1 <-> 2 <-> 3
  node1.next = node2;
  node2.prev = node1;
  node2.next = node3;
  node3.prev = node2;
  
  // Mencetak list dari node1
  printList(node1);
}
