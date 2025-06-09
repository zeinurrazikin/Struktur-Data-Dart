// Kelas untuk merepresentasikan node dalam binary tree
class TreeNode {
  int value;        // Nilai yang disimpan dalam node
  TreeNode? left;   // Pointer ke anak kiri
  TreeNode? right;  // Pointer ke anak kanan
  
  // Constructor untuk membuat node baru
  TreeNode(this.value, {this.left, this.right});
}

// Kelas utama untuk Binary Tree
class BinaryTree {
  TreeNode? root;  // Root node dari tree
  
  // Constructor default
  BinaryTree({this.root});
  
  // 1. Level-Order Insertion
  // Data baru ditambahkan ke posisi kosong pertama dari kiri ke kanan
  void insertLevelOrder(int value) {
    // Membuat node baru dengan nilai yang diberikan
    TreeNode newNode = TreeNode(value); 
    
    // Jika tree kosong, node baru menjadi root
    if (root == null) {
      root = newNode;
      return;
    }
    
    // Menggunakan queue untuk traversal level-order
    List<TreeNode> queue = [];  
    queue.add(root!);
    
    // Melakukan traversal level-order hingga menemukan posisi kosong
    while (queue.isNotEmpty) {
      TreeNode temp = queue.removeAt(0);
      
      // Cek apakah posisi kiri kosong
      if (temp.left == null) {
        temp.left = newNode;  // Tambahkan node baru ke posisi kiri
        return;
      } else {
        queue.add(temp.left!);  // Tambahkan anak kiri ke queue
      }
      
      // Cek apakah posisi kanan kosong
      if (temp.right == null) {
        temp.right = newNode;  // Tambahkan node baru ke posisi kanan
        return;
      } else {
        queue.add(temp.right!);  // Tambahkan anak kanan ke queue
      }
    }
  }
  
  // 2. Binary Search Tree Insertion
  // Data baru dibandingkan dengan data yang ada.
  // Jika lebih kecil, ke kiri; jika lebih besar, ke kanan
  void insertBST(int value) {
    // Panggil fungsi helper rekursif
    root = _insertBSTRecursive(root, value);
  }
  
  // Fungsi helper rekursif untuk BST insertion
  TreeNode? _insertBSTRecursive(TreeNode? node, int value) {
    // Basis rekursi: jika node kosong, buat node baru
    if (node == null) {
      return TreeNode(value);
    }
    
    // Rekursi: lakukan perbandingan nilai
    if (value < node.value) {
      // Jika nilai lebih kecil, masukkan ke subtree kiri
      node.left = _insertBSTRecursive(node.left, value);
    } else if (value > node.value) {
      // Jika nilai lebih besar, masukkan ke subtree kanan
      node.right = _insertBSTRecursive(node.right, value);
    }
    // Jika nilai sama, tidak ada penambahan (BST tidak menyimpan duplikat)
    
    return node;
  }
  
  // 3. Manual Position Insertion
  // Memasukkan node ke posisi tertentu berdasarkan path dari root
  // path adalah string yang terdiri dari 'L' dan 'R' yang menunjukkan arah navigasi
  bool insertManualPath(int value, String path) {
    // Jika tree kosong dan path tidak kosong, gagal
    if (root == null && path.isNotEmpty) {
      return false;
    }
    
    // Jika tree kosong dan path kosong, buat root baru
    if (root == null && path.isEmpty) {
      root = TreeNode(value);
      return true;
    }
    
    // Jika path kosong tetapi tree tidak kosong, ganti root
    if (path.isEmpty) {
      root = TreeNode(value);
      return true;
    }
    
    // Mulai navigasi dari root
    TreeNode current = root!;
    TreeNode? parent;
    int i = 0;
    
    // Navigasi sesuai path
    while (i < path.length - 1) {
      parent = current;
      if (path[i] == 'L') {
        // Navigasi ke kiri
        if (current.left == null) {
          return false;  // Path tidak valid
        }
        current = current.left!;
      } else if (path[i] == 'R') {
        // Navigasi ke kanan
        if (current.right == null) {
          return false;  // Path tidak valid
        }
        current = current.right!;
      } else {
        return false;  // Karakter path tidak valid
      }
      i++;
    }
    
    // Posisi terakhir di path
    parent = current;
    if (path[i] == 'L') {
      parent.left = TreeNode(value);
      return true;
    } else if (path[i] == 'R') {
      parent.right = TreeNode(value);
      return true;
    }
    
    return false;  // Karakter path tidak valid
  }
  
  // Alternatif manual insertion dengan pencarian target node
  bool insertAfterTarget(int targetValue, int newValue, bool insertLeft) {
    // Jika tree kosong, gagal
    if (root == null) {
      return false;
    }
    
    // Cari node target menggunakan BFS
    List<TreeNode> queue = [];
    queue.add(root!);
    
    while (queue.isNotEmpty) {
      TreeNode current = queue.removeAt(0);
      
      // Jika nilai target ditemukan
      if (current.value == targetValue) {
        if (insertLeft) {
          // Insert ke kiri (akan menggantikan anak kiri yang ada)
          current.left = TreeNode(newValue);
        } else {
          // Insert ke kanan (akan menggantikan anak kanan yang ada)
          current.right = TreeNode(newValue);
        }
        return true;
      }
      
      // Tambahkan anak-anak ke queue untuk diperiksa
      if (current.left != null) {
        queue.add(current.left!);
      }
      if (current.right != null) {
        queue.add(current.right!);
      }
    }
    
    return false;  // Target tidak ditemukan
  }
  
  // 4. Random Insertion
  // Memasukkan node secara acak ke posisi kosong
  void insertRandom(int value) {
    // Membuat node baru
    TreeNode newNode = TreeNode(value);
    
    // Jika tree kosong, node baru menjadi root
    if (root == null) {
      root = newNode;
      return;
    }
    
    // Menggunakan generator acak untuk menentukan arah (kiri/kanan)
    bool goLeft = DateTime.now().millisecondsSinceEpoch % 2 == 0;
    
    // Mulai navigasi dari root
    TreeNode current = root!;
    
    while (true) {
      // Tentukan arah secara acak
      goLeft = DateTime.now().microsecondsSinceEpoch % 2 == 0;
      
      if (goLeft) {
        // Coba ke arah kiri
        if (current.left == null) {
          current.left = newNode;  // Posisi kosong ditemukan
          return;
        }
        current = current.left!;
      } else {
        // Coba ke arah kanan
        if (current.right == null) {
          current.right = newNode;  // Posisi kosong ditemukan
          return;
        }
        current = current.right!;
      }
    }
  }
  
  // Method untuk traversal inorder
  // (kiri, root, kanan)
  List<int> inorderTraversal() {
    List<int> result = [];
    _inorderHelper(root, result);
    return result;
  }
  
  // Fungsi helper untuk inorder traversal
  void _inorderHelper(TreeNode? node, List<int> result) {
    if (node == null) return;
    
    _inorderHelper(node.left, result);  // Traversal subtree kiri
    result.add(node.value);             // Tambahkan nilai node saat ini
    _inorderHelper(node.right, result); // Traversal subtree kanan
  }
  
  // Method untuk traversal preorder
  // (root, kiri, kanan)
  List<int> preorderTraversal() {
    List<int> result = [];
    _preorderHelper(root, result);
    return result;
  }
  
  // Fungsi helper untuk preorder traversal
  void _preorderHelper(TreeNode? node, List<int> result) {
    if (node == null) return;
    
    result.add(node.value);             // Tambahkan nilai node saat ini
    _preorderHelper(node.left, result); // Traversal subtree kiri
    _preorderHelper(node.right, result); // Traversal subtree kanan
  }
  
  // Method untuk traversal postorder
  // (kiri, kanan, root)
  List<int> postorderTraversal() {
    List<int> result = [];
    _postorderHelper(root, result);
    return result;
  }
  
  // Fungsi helper untuk postorder traversal
  void _postorderHelper(TreeNode? node, List<int> result) {
    if (node == null) return;
    
    _postorderHelper(node.left, result);  // Traversal subtree kiri
    _postorderHelper(node.right, result); // Traversal subtree kanan
    result.add(node.value);              // Tambahkan nilai node saat ini
  }
  
  // Method untuk menghitung jumlah node dalam tree
  int count() {
    return _countHelper(root);
  }
  
  // Fungsi helper untuk menghitung jumlah node
  int _countHelper(TreeNode? node) {
    if (node == null) return 0;
    return 1 + _countHelper(node.left) + _countHelper(node.right);
  }
  
  // Method untuk mencari nilai dalam tree
  bool contains(int value) {
    return _containsHelper(root, value);
  }
  
  // Fungsi helper untuk pencarian nilai
  bool _containsHelper(TreeNode? node, int value) {
    if (node == null) return false;
    
    if (node.value == value) return true;
    
    return _containsHelper(node.left, value) || _containsHelper(node.right, value);
  }
  
  // Method untuk menghitung kedalaman tree
  int height() {
    return _heightHelper(root);
  }
  
  // Fungsi helper untuk menghitung kedalaman
  int _heightHelper(TreeNode? node) {
    if (node == null) return -1;
    
    int leftHeight = _heightHelper(node.left);
    int rightHeight = _heightHelper(node.right);
    
    return 1 + (leftHeight > rightHeight ? leftHeight : rightHeight);
  }
}

// Contoh penggunaan
void main() {
  // 1. Contoh Level-Order Insertion
  print("=== Level-Order Insertion ===");
  BinaryTree levelOrderTree = BinaryTree();
  for (int i = 1; i <= 7; i++) {
    levelOrderTree.insertLevelOrder(i);
  }
  
  print("Inorder traversal: ${levelOrderTree.inorderTraversal()}");
  print("Preorder traversal: ${levelOrderTree.preorderTraversal()}");
  print("Jumlah node: ${levelOrderTree.count()}");
  print("Tinggi tree: ${levelOrderTree.height()}");
  
  // 2. Contoh Binary Search Tree Insertion
  print("\n=== Binary Search Tree Insertion ===");
  BinaryTree bstTree = BinaryTree();
  [4, 2, 6, 1, 3, 5, 7].forEach((value) => bstTree.insertBST(value));
  
  print("Inorder traversal: ${bstTree.inorderTraversal()}");
  print("Preorder traversal: ${bstTree.preorderTraversal()}");
  print("Jumlah node: ${bstTree.count()}");
  print("Tinggi tree: ${bstTree.height()}");
  
  // 3. Contoh Manual Insertion dengan path
  print("\n=== Manual Path Insertion ===");
  BinaryTree manualTree = BinaryTree();
  manualTree.insertManualPath(1, "");    // Root
  manualTree.insertManualPath(2, "L");   // Left child of root
  manualTree.insertManualPath(3, "R");   // Right child of root
  manualTree.insertManualPath(4, "LL");  // Left child of node 2
  manualTree.insertManualPath(5, "LR");  // Right child of node 2
  
  print("Inorder traversal: ${manualTree.inorderTraversal()}");
  print("Preorder traversal: ${manualTree.preorderTraversal()}");
  print("Jumlah node: ${manualTree.count()}");
  print("Tinggi tree: ${manualTree.height()}");
  
  // 4. Contoh Random Insertion
  print("\n=== Random Insertion ===");
  BinaryTree randomTree = BinaryTree();
  for (int i = 1; i <= 7; i++) {
    randomTree.insertRandom(i);
  }
  
  print("Inorder traversal: ${randomTree.inorderTraversal()}");
  print("Preorder traversal: ${randomTree.preorderTraversal()}");
  print("Jumlah node: ${randomTree.count()}");
  print("Tinggi tree: ${randomTree.height()}");
  
  // 5. Contoh pencarian nilai
  print("\n=== Pencarian Nilai ===");
  print("Nilai 3 ada di BST? ${bstTree.contains(3)}");
  print("Nilai 8 ada di BST? ${bstTree.contains(8)}");
}