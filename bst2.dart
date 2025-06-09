// Class untuk merepresentasikan node dalam Binary Search Tree
class STNode<T extends Comparable<dynamic>> {
  T nodeValue; // Nilai yang disimpan dalam node
  STNode<T>? left; // Referensi ke anak kiri
  STNode<T>? right; // Referensi ke anak kanan
  STNode<T>? parent; // Referensi ke parent node

  // Konstruktor untuk membuat node baru
  STNode(this.nodeValue, [this.parent]) {
    left = null;
    right = null;
  }
}

// Class untuk Binary Search Tree
class BinarySearchTree<T extends Comparable<dynamic>> {
  STNode<T>? root; // Root dari tree
  int treeSize = 0; // Jumlah node dalam tree

  // Konstruktor untuk inisialisasi tree kosong
  BinarySearchTree() {
    root = null;
  }

  // Method untuk mencari node berdasarkan item
  STNode<T>? findNode(T item) {
    STNode<T>? current = root; // Mulai pencarian dari root

    // Traverse tree selama current node tidak null
    while (current != null) {
      // Bandingkan item dengan nilai node saat ini
      int orderValue = item.compareTo(current.nodeValue);

      if (orderValue == 0) {
        // Jika ditemukan, kembalikan node saat ini
        return current;
      } else if (orderValue < 0) {
        // Jika item lebih kecil, cari di subtree kiri
        current = current.left;
      } else {
        // Jika item lebih besar, cari di subtree kanan
        current = current.right;
      }
    }

    // Jika tidak ditemukan, kembalikan null
    return null;
  }
}

void main() {
  // Membuat instance Binary Search Tree untuk tipe int
  var bst = BinarySearchTree<int>();

  // Menambahkan beberapa nilai ke tree
  bst.root = STNode(10);
  bst.root!.left = STNode(5, bst.root);
  bst.root!.right = STNode(15, bst.root);
  bst.root!.left!.left = STNode(3, bst.root!.left);
  bst.root!.left!.right = STNode(7, bst.root!.left);
  bst.root!.right!.left = STNode(12, bst.root!.right);
  bst.root!.right!.right = STNode(20, bst.root!.right);

  // Mencari node dengan nilai 7
  STNode<int>? foundNode = bst.findNode(20);
  if (foundNode != null) {
    print("Node ditemukan dengan nilai: ${foundNode.nodeValue}");
  } else {
    print("Node tidak ditemukan");
  }

  // Mencari node dengan nilai 100 (tidak ada)
  foundNode = bst.findNode(100);
  if (foundNode != null) {
    print("Node ditemukan dengan nilai: ${foundNode.nodeValue}");
  } else {
    print("Node tidak ditemukan");
  }
}
