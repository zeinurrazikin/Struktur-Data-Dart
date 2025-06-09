// Kelas STNode merepresentasikan node dalam pohon
class STNode<T> {
  T nodeValue; // Nilai yang disimpan dalam node
  STNode<T>? left,
      right,
      parent; // Referensi ke anak kiri, anak kanan, dan orang tua

  // Konstruktor untuk inisialisasi nilai node dan orang tua (jika ada)
  STNode(this.nodeValue, [this.parent]);
}

// Kelas BinarySearchTree merepresentasikan pohon pencarian biner
class BinarySearchTree<T extends Comparable> {
  STNode<T>? root; // Root dari pohon
  int treeSize = 0; // Ukuran pohon

  // Metode untuk menambahkan data ke dalam BST
  bool add(T newValue) {
    STNode<T>? node = root; // Mulai dari root
    STNode<T>? parent; // Variabel untuk menyimpan orang tua
    int orderValue = 0; // Variabel untuk menyimpan hasil perbandingan

    // Mencari posisi yang tepat untuk menambahkan node baru
    while (node != null) {
      parent = node; // Simpan node saat ini sebagai orang tua
      orderValue = newValue.compareTo(
          node.nodeValue); // Bandingkan nilai baru dengan nilai node saat ini

      if (orderValue == 0) {
        return false; // Nilai sudah ada, tidak perlu ditambahkan
      } else if (orderValue < 0) {
        node = node.left; // Jika nilai baru lebih kecil, lanjutkan ke anak kiri
      } else {
        node =
            node.right; // Jika nilai baru lebih besar, lanjutkan ke anak kanan
      }
    }

    // Membuat node baru
    STNode<T> newNode = STNode(newValue, parent);
    if (parent == null) {
      root = newNode; // Jika pohon kosong, node baru menjadi root
    } else if (orderValue < 0) {
      parent.left =
          newNode; // Jika nilai baru lebih kecil, tambahkan sebagai anak kiri
    } else {
      parent.right =
          newNode; // Jika nilai baru lebih besar, tambahkan sebagai anak kanan
    }

    treeSize++; // Tingkatkan ukuran pohon
    return true; // Berhasil ditambahkan
  }

  // Metode untuk mendapatkan ukuran pohon
  int getSize() {
    return treeSize; // Kembalikan ukuran pohon
  }

  // Metode untuk memeriksa apakah pohon mengandung nilai tertentu
  bool contains(T value) {
    STNode<T>? node = root; // Mulai dari root

    // Mencari nilai dalam pohon
    while (node != null) {
      int orderValue = value.compareTo(node
          .nodeValue); // Bandingkan nilai yang dicari dengan nilai node saat ini
      if (orderValue == 0) {
        return true; // Nilai ditemukan
      } else if (orderValue < 0) {
        node = node.left; // Jika nilai lebih kecil, lanjutkan ke anak kiri
      } else {
        node = node.right; // Jika nilai lebih besar, lanjutkan ke anak kanan
      }
    }
    return false; // Nilai tidak ditemukan
  }

  // Metode untuk melakukan traversal in-order
  void inOrderTraversal(void Function(T) visit) {
    _inOrderTraversal(root, visit); // Panggil metode rekursif untuk traversal
  }

  // Metode rekursif untuk traversal in-order
  void _inOrderTraversal(STNode<T>? node, void Function(T) visit) {
    if (node != null) {
      _inOrderTraversal(node.left, visit); // Traversal anak kiri
      visit(node.nodeValue); // Kunjungi node saat ini
      _inOrderTraversal(node.right, visit); // Traversal anak kanan
    }
  }
}

// Fungsi utama untuk menjalankan program
void main() {
  // Membuat instance dari BinarySearchTree
  BinarySearchTree<int> bst = BinarySearchTree<int>();

  // Menambahkan nilai ke dalam BST
  bst.add(10);
  bst.add(5);
  bst.add(15);
  bst.add(3);
  bst.add(7);
  bst.add(12);
  bst.add(18);

  // Memeriksa ukuran pohon
  print('Size of the tree: ${bst.getSize()}'); // Output: Size of the tree: 7

  // Memeriksa apakah nilai tertentu ada dalam pohon
  print('Contains 7: ${bst.contains(7)}'); // Output: Contains 7: true
  print('Contains 20: ${bst.contains(20)}'); // Output: Contains 20: false

  // Melakukan traversal in-order dan mencetak nilai
  print('In-order traversal:');
  bst.inOrderTraversal((value) {
    print(value); // Output: 3, 5, 7, 10, 12, 15, 18
  });
}
