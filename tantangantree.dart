// Class untuk merepresentasikan sebuah node dalam Binary Tree
class Node {
  int data; // Menyimpan nilai integer dari node
  Node? left, right; // Referensi ke child kiri dan kanan, nullable karena child bisa kosong
  
  // Constructor untuk membuat node baru dengan data tertentu
  Node(this.data);
}

// Class untuk mengelola Binary Tree dengan berbagai operasi
class BinaryTree {
  Node? root; // Root dari Binary Tree, nullable karena tree bisa kosong
  
  // ========== INSERT LEVEL ORDER ==========
  
  // Method untuk menambahkan node baru secara level-order menggunakan queue
  void insertLevelOrder(int data) {
    // Membuat node baru dengan data yang diberikan
    Node newNode = Node(data);
    
    // Jika tree kosong (root null), set node baru sebagai root
    if (root == null) {
      root = newNode;
      // Cetak pesan konfirmasi bahwa node telah ditambahkan sebagai root
      print('✓ Root: $data');
      return;
    }
    
    // Membuat List untuk digunakan sebagai queue guna menyimpan node sementara
    List<Node> queue = [root!];
    
    // Iterasi queue hingga menemukan posisi kosong untuk node baru
    while (queue.isNotEmpty) {
      // Ambil node pertama dari queue (dequeue)
      Node current = queue.removeAt(0);
      
      // Jika child kiri kosong, tambahkan node baru sebagai child kiri
      if (current.left == null) {
        current.left = newNode;
        // Cetak pesan konfirmasi penambahan node di posisi kiri
        print('✓ $data ditambahkan kiri dari ${current.data}');
        return;
      }
      // Jika child kiri sudah ada, tambahkan ke queue untuk pemeriksaan berikutnya
      queue.add(current.left!);
      
      // Jika child kanan kosong, tambahkan node baru sebagai child kanan
      if (current.right == null) {
        current.right = newNode;
        // Cetak pesan konfirmasi penambahan node di posisi kanan
        print('✓ $data ditambahkan kanan dari ${current.data}');
        return;
      }
      // Jika child kanan sudah ada, tambahkan ke queue untuk pemeriksaan berikutnya
      queue.add(current.right!);
    }
  }
  
  // Method untuk menambahkan node baru secara level-order menggunakan pendekatan rekursif
  void insertLevelOrderRecursive(int data) {
    // Jika tree kosong, buat node baru sebagai root
    if (root == null) {
      root = Node(data);
      // Cetak pesan konfirmasi bahwa node telah ditambahkan sebagai root
      print('✓ Root: $data');
    } else {
      // Panggil helper method untuk menambahkan node secara rekursif
      _insertRecursive(root!, data);
    }
  }
  
  // Helper method untuk menambahkan node secara rekursif
  void _insertRecursive(Node node, int data) {
    // Jika child kiri kosong, tambahkan node baru sebagai child kiri
    if (node.left == null) {
      node.left = Node(data);
      // Cetak pesan konfirmasi penambahan node di posisi kiri
      print('✓ $data ditambahkan kiri dari ${node.data}');
    } 
    // Jika child kanan kosong, tambahkan node baru sebagai child kanan
    else if (node.right == null) {
      node.right = Node(data);
      // Cetak pesan konfirmasi penambahan node di posisi kanan
      print('✓ $data ditambahkan kanan dari ${node.data}');
    } 
    // Jika kedua child sudah ada, pilih subtree dengan tinggi lebih kecil
    else {
      // Bandingkan tinggi subtree kiri dan kanan
      if (_getHeight(node.left) <= _getHeight(node.right)) {
        // Jika tinggi kiri lebih kecil atau sama, rekursi ke subtree kiri
        _insertRecursive(node.left!, data);
      } else {
        // Jika tinggi kanan lebih kecil, rekursi ke subtree kanan
        _insertRecursive(node.right!, data);
      }
    }
  }
  
  // Helper method untuk menghitung tinggi subtree dari sebuah node
  int _getHeight(Node? node) {
    // Jika node null, kembalikan tinggi 0
    if (node == null) return 0;
    // Hitung tinggi subtree kiri secara rekursif
    int leftHeight = _getHeight(node.left);
    // Hitung tinggi subtree kanan secara rekursif
    int rightHeight = _getHeight(node.right);
    // Kembalikan tinggi maksimum dari kiri/kanan ditambah 1 (tinggi node saat ini)
    return 1 + (leftHeight > rightHeight ? leftHeight : rightHeight);
  }
  
  // ========== INSERT BY TARGET ==========
  
  // Method untuk menambahkan node baru di posisi tertentu (kiri/kanan) dari node target
  bool insertByTarget(int target, int newData, String position) {
    // Cari node dengan nilai target menggunakan linear search
    Node? targetNode = _findNode(root, target);
    
    // Jika target tidak ditemukan, cetak pesan error dan kembalikan false
    if (targetNode == null) {
      print('✗ Target $target tidak ditemukan');
      return false;
    }
    
    // Jika posisi adalah 'left', cek apakah child kiri tersedia
    if (position == 'left') {
      if (targetNode.left == null) {
        // Tambahkan node baru sebagai child kiri
        targetNode.left = Node(newData);
        // Cetak pesan konfirmasi penambahan
        print('✓ $newData ditambahkan kiri dari $target');
        return true;  
      } else {
        // Jika child kiri sudah ada, cetak pesan error
        print('✗ Posisi kiri $target sudah terisi');
        return false;
      }
    } 
    // Jika posisi adalah 'right', cek apakah child kanan tersedia
    else if (position == 'right') {
      if (targetNode.right == null) {
        // Tambahkan node baru sebagai child kanan
        targetNode.right = Node(newData);
        // Cetak pesan konfirmasi penambahan
        print('✓ $newData ditambahkan kanan dari $target');
        return true;
      } else {
        // Jika child kanan sudah ada, cetak pesan error
        print('✗ Posisi kanan $target sudah terisi');
        return false;
      }
    }
    
    // Jika posisi tidak valid (bukan 'left' atau 'right'), cetak pesan error
    print('✗ Posisi harus "left" atau "right"');
    return false;
  }
  
  // Helper method untuk mencari node dengan nilai target menggunakan linear search rekursif
  Node? _findNode(Node? node, int target) {
    // Jika node null, kembalikan null (basis rekursi)
    if (node == null) return null;
    // Jika data node sama dengan target, kembalikan node tersebut
    if (node.data == target) return node;
    
    // Cari di subtree kiri
    Node? leftResult = _findNode(node.left, target);
    // Jika ditemukan di subtree kiri, kembalikan hasilnya
    if (leftResult != null) return leftResult;
    
    // Jika tidak ditemukan di kiri, cari di subtree kanan
    return _findNode(node.right, target);
  }
  
  // ========== TRAVERSAL NON-REKURSIF ==========
  
  // Method untuk traversal In-Order (Kiri → Root → Kanan) menggunakan stack
  List<int> inOrder() {
    // List untuk menyimpan hasil traversal
    List<int> result = [];
    // List sebagai stack untuk menyimpan node sementara
    List<Node> stack = [];
    // Mulai dari root
    Node? current = root;
    
    // Cetak header untuk traversal In-Order
    print('\n🔍 In-Order Traversal:');
    
    // Iterasi selama stack tidak kosong atau current tidak null
    while (stack.isNotEmpty || current != null) {
      // Push semua node kiri ke stack
      while (current != null) {
        // Tambahkan node ke stack
        stack.add(current);
        // Cetak informasi bahwa node dipush
        print('  Push: ${current.data}');
        // Pindah ke child kiri
        current = current.left;
      }
      
      // Pop node dari stack
      current = stack.removeLast();
      // Tambahkan data node ke hasil
      result.add(current.data);
      // Cetak informasi bahwa node dipop dan ditambahkan ke hasil
      print('  Pop: ${current.data} → hasil');
      
      // Pindah ke child kanan untuk diproses berikutnya
      current = current.right;
    }
    
    // Cetak hasil traversal In-Order
    print('  Hasil: $result');
    return result;
  }
  
  // Method untuk traversal Pre-Order (Root → Kiri → Kanan) menggunakan stack
  List<int> preOrder() {
    // Jika tree kosong, kembalikan list kosong
    if (root == null) return [];
    
    // List untuk menyimpan hasil traversal
    List<int> result = [];
    // List sebagai stack untuk menyimpan node, inisialisasi dengan root
    List<Node> stack = [root!];
    
    // Cetak header untuk traversal Pre-Order
    print('\n🔍 Pre-Order Traversal:');
    // Cetak informasi bahwa root dipush ke stack
    print('  Push: ${root!.data}');
    
    // Iterasi selama stack tidak kosong
    while (stack.isNotEmpty) {
      // Pop node dari stack
      Node current = stack.removeLast();
      // Tambahkan data node ke hasil
      result.add(current.data);
      // Cetak informasi bahwa node dipop dan ditambahkan ke hasil
      print('  Pop: ${current.data} → hasil');
      
      // Push child kanan terlebih dahulu (agar diproses setelah kiri)
      if (current.right != null) {
        stack.add(current.right!);
        // Cetak informasi bahwa child kanan dipush
        print('  Push: ${current.right!.data} (kanan)');
      }
      
      // Push child kiri (akan diproses duluan karena LIFO)
      if (current.left != null) {
        stack.add(current.left!);
        // Cetak informasi bahwa child kiri dipush
        print('  Push: ${current.left!.data} (kiri)');
      }
    }
    
    // Cetak hasil traversal Pre-Order
    print('  Hasil: $result');
    return result;
  }
  
  // Method untuk traversal Post-Order (Kiri → Kanan → Root) menggunakan dua stack
  List<int> postOrder() {
    // Jika tree kosong, kembalikan list kosong
    if (root == null) return [];
    
    // List untuk menyimpan hasil traversal
    List<int> result = [];
    // Stack pertama untuk traversal awal
    List<Node> stack1 = [root!];
    // Stack kedua untuk menyimpan urutan post-order
    List<Node> stack2 = [];
    
    // Cetak header untuk traversal Post-Order
    print('\n🔍 Post-Order Traversal (2 Stack):');
    
    // Proses stack pertama untuk mengisi stack kedua
    while (stack1.isNotEmpty) {
      // Pop node dari stack pertama
      Node current = stack1.removeLast();
      // Push node ke stack kedua
      stack2.add(current);
      // Cetak informasi bahwa node dipindah dari stack1 ke stack2
      print('  ${current.data}: Stack1 → Stack2');
      
      // Push child kiri ke stack1 (akan diproses duluan)
      if (current.left != null) {
        stack1.add(current.left!);
        // Cetak informasi bahwa child kiri dipush
        print('  Push kiri: ${current.left!.data}');
      }
      
      // Push child kanan ke stack1
      if (current.right != null) {
        stack1.add(current.right!);
        // Cetak informasi bahwa child kanan dipush
        print('  Push kanan: ${current.right!.data}');
      }
    }
    
    // Proses stack kedua untuk menghasilkan urutan post-order
    while (stack2.isNotEmpty) {
      // Pop node dari stack kedua
      Node current = stack2.removeLast();
      // Tambahkan data node ke hasil
      result.add(current.data);
      // Cetak informasi bahwa node dipop dan ditambahkan ke hasil
      print('  Pop: ${current.data} → hasil');
    }
    
    // Cetak hasil traversal Post-Order
    print('  Hasil: $result');
    return result;
  }
  
  // ========== HELPER METHODS ==========
  
  // Method untuk menampilkan struktur tree dalam format teks sederhana
  void display() {
    // Jika tree kosong, cetak pesan
    if (root == null) {
      print('Tree kosong');
      return;
    }
    
    // Cetak header untuk struktur tree
    print('\n🌳 Struktur Tree:');
    // Panggil helper method untuk menampilkan node secara rekursif
    _displayNode(root, '', true);
  }
  
  // Helper method untuk menampilkan node dengan prefix dan format ASCII
  void _displayNode(Node? node, String prefix, bool isLast) {
    if (node != null) {
      // Cetak node dengan prefix dan indikator apakah node terakhir
      print('$prefix${isLast ? '└─ ' : '├─ '}${node.data}');
      
      // Jika node memiliki child, proses child kiri dan kanan
      if (node.left != null || node.right != null) {
        // Tambahkan prefix untuk level berikutnya
        String newPrefix = prefix + (isLast ? '   ' : '│  ');
        // Tampilkan child kiri, tandai sebagai terakhir jika tidak ada child kanan
        _displayNode(node.left, newPrefix, node.right == null);
        // Tampilkan child kanan, selalu sebagai node terakhir
        _displayNode(node.right, newPrefix, true);
      }
    }
  }
  
  // Method untuk memeriksa apakah data ada di tree
  bool contains(int data) => _findNode(root, data) != null;
}

// ========== DEMO PROGRAM ==========

// Fungsi utama untuk menguji semua operasi Binary Tree
void main() {
  // Cetak header untuk demo
  print('🚀 BINARY TREE DEMO\n');
  
  // Buat instance baru dari BinaryTree
  BinaryTree tree = BinaryTree();
  
  // 1. Pengujian Insert Level Order dengan Queue
  print('1️⃣ Insert Level Order (Queue):');
  // Tambahkan data 1, 2, 3, 4, 5, 6, 7 secara berurutan
  [1, 2, 3, 4, 5, 6, 7].forEach(tree.insertLevelOrder);
  // Tampilkan struktur tree setelah penambahan
  tree.display();
  
  // 2. Pengujian Insert berdasarkan Target
  print('\n2️⃣ Insert by Target:');
  // Tambahkan node 8 sebagai child kiri dari node 4
  tree.insertByTarget(4, 8, 'left');
  // Tambahkan node 9 sebagai child kanan dari node 5
  tree.insertByTarget(5, 9, 'right');
  // Tampilkan struktur tree setelah penambahan
  tree.display();
  
  // 3. Pengujian Traversal Non-Rekursif
  print('\n3️⃣ Traversal Methods:');
  
  // Lakukan traversal In-Order dan simpan hasil
  List<int> inOrderResult = tree.inOrder();
  // Lakukan traversal Pre-Order dan simpan hasil
  List<int> preOrderResult = tree.preOrder();
  // Lakukan traversal Post-Order dan simpan hasil
  List<int> postOrderResult = tree.postOrder();
  
  // Cetak ringkasan hasil traversal
  print('\n📊 RINGKASAN:');
  print('In-Order:   $inOrderResult');
  print('Pre-Order:  $preOrderResult');
  print('Post-Order: $postOrderResult');
  
  // 4. Pengujian Insert Level Order Rekursif dengan tree baru
  print('\n4️⃣ Insert Level Order (Rekursif):');
  // Buat instance baru dari BinaryTree
  BinaryTree tree2 = BinaryTree();
  // Tambahkan data 10, 20, 30, 40, 50 secara berurutan
  [10, 20, 30, 40, 50].forEach(tree2.insertLevelOrderRecursive);
  // Tampilkan struktur tree setelah penambahan
  tree2.display();
  
  // 5. Pengujian Pencarian
  print('\n5️⃣ Search Test:');
  // Cek apakah nilai 5 ada di tree pertama
  print('Cari 5: ${tree.contains(5)}');
  // Cek apakah nilai 99 ada di tree pertama
  print('Cari 99: ${tree.contains(99)}');
  
  // Cetak pesan bahwa demo selesai
  print('\n✅ Demo selesai!');
}