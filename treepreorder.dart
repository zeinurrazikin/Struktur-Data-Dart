// Class Node untuk menyimpan node dalam binary tree
class Node<T> {
  int key;
  Node? left, right;

  Node(this.key)
      : left = null,
        right = null;
}

// Class BinaryTree untuk merepresentasikan binary tree
class BinaryTree {
  Node? root; // Menyimpan node root dari tree

  // Method untuk melakukan traversal pre-order dimulai dari root
  void printPreorderFromRoot() {
    printPreorder(root);
  }

  // Method untuk melakukan traversal pre-order
  void printPreorder(Node? node) {
    if (node != null) {
      print('${node.key} ');
      printPreorder(node.left); // Perbaikan: Menggunakan node.left, bukan string 'node.left'
      printPreorder(node.right); // Perbaikan: Menggunakan node.right, bukan string 'node.right'
    }
  }
}

void main() {
  BinaryTree tree = BinaryTree();
  tree.root = Node(14);
  tree.root!.left = Node(20);
  tree.root!.right = Node(33);
  tree.root!.left!.left = Node(40); 

  print("Pre Order traversal of binary tree is: ");
  tree.printPreorderFromRoot(); // Memanggil metode dari instance tree
}