import 'dart:io';

// ============================================================================
// ENUM untuk Tipe Menu
// ============================================================================
enum MenuType {
  makanan,
  minuman
}

// ============================================================================
// CLASS MenuItem - Representasi item menu dengan encapsulation
// ============================================================================
class MenuItem {
  final int _id;
  final String _name;
  final int _price;
  final MenuType _type;

  // Constructor
  MenuItem(this._id, this._name, this._price, this._type);

  // Getter methods (encapsulation)
  int get id => _id;
  String get name => _name;
  int get price => _price;
  MenuType get type => _type;

  @override
  String toString() {
    return '$_name - Rp$_price';
  }
}

// ============================================================================
// GENERIC CLASS Node untuk BST
// ============================================================================
class BSTNode<T> {
  T data;
  BSTNode<T>? left;
  BSTNode<T>? right;

  BSTNode(this.data);
}

// ============================================================================
// CLASS MenuBST - Binary Search Tree untuk menu makanan
// ============================================================================
class MenuBST {
  BSTNode<MenuItem>? _root;

  // Insert menu item ke BST berdasarkan ID
  void insert(MenuItem item) {
    _root = _insertRecursive(_root, item);
  }

  // Helper method rekursif untuk insert
  BSTNode<MenuItem>? _insertRecursive(BSTNode<MenuItem>? node, MenuItem item) {
    if (node == null) {
      return BSTNode<MenuItem>(item);
    }

    if (item.id < node.data.id) {
      node.left = _insertRecursive(node.left, item);
    } else if (item.id > node.data.id) {
      node.right = _insertRecursive(node.right, item);
    }

    return node;
  }

  // Search menu berdasarkan ID menggunakan rekursi
  MenuItem? search(int id) {
    return _searchRecursive(_root, id)?.data;
  }

  // Helper method rekursif untuk search
  BSTNode<MenuItem>? _searchRecursive(BSTNode<MenuItem>? node, int id) {
    if (node == null || node.data.id == id) {
      return node;
    }

    if (id < node.data.id) {
      return _searchRecursive(node.left, id);
    }

    return _searchRecursive(node.right, id);
  }

  // Tampilkan semua menu dengan in-order traversal (rekursif)
  void displayMenu() {
    print('\n=== MENU SATE MADURA ===');
    print('ID | Nama Menu      | Harga    | Jenis');
    print('---|----------------|----------|----------');
    _inOrderTraversal(_root);
    print('========================\n');
  }

  // In-order traversal rekursif untuk menampilkan menu tersorting
  void _inOrderTraversal(BSTNode<MenuItem>? node) {
    if (node != null) {
      _inOrderTraversal(node.left);
      String typeStr = node.data.type == MenuType.makanan ? 'Makanan' : 'Minuman';
      print('${node.data.id.toString().padLeft(2)} | ${node.data.name.padRight(14)} | Rp${node.data.price.toString().padLeft(6)} | $typeStr');
      _inOrderTraversal(node.right);
    }
  }

  // Mendapatkan semua menu sebagai List untuk keperluan lain
  List<MenuItem> getAllMenus() {
    List<MenuItem> menus = [];
    _collectMenus(_root, menus);
    return menus;
  }

  // Helper method untuk mengumpulkan semua menu
  void _collectMenus(BSTNode<MenuItem>? node, List<MenuItem> menus) {
    if (node != null) {
      _collectMenus(node.left, menus);
      menus.add(node.data);
      _collectMenus(node.right, menus);
    }
  }
}

// ============================================================================
// CLASS Order - Representasi pesanan pelanggan
// ============================================================================
class Order {
  static int _orderCounter = 1;
  
  final int _orderId;
  final String _customerName;
  final List<MenuItem> _items;
  final DateTime _orderTime;
  int _totalPrice = 0;

  // Constructor
  Order(this._customerName, this._items) 
    : _orderId = _orderCounter++,
      _orderTime = DateTime.now() {
    _calculateTotal();
  }

  // Getter methods
  int get orderId => _orderId;
  String get customerName => _customerName;
  List<MenuItem> get items => List.unmodifiable(_items);
  DateTime get orderTime => _orderTime;
  int get totalPrice => _totalPrice;

  // Hitung total harga
  void _calculateTotal() {
    _totalPrice = _items.fold(0, (sum, item) => sum + item.price);
  }

  @override
  String toString() {
    String itemList = _items.map((item) => '${item.name} (Rp${item.price})').join(', ');
    return 'Order #$_orderId - $_customerName: $itemList | Total: Rp$_totalPrice';
  }
}

// ============================================================================
// GENERIC CLASS QueueNode untuk implementasi Queue
// ============================================================================
class QueueNode<T> {
  T data;
  QueueNode<T>? next;

  QueueNode(this.data);
}

// ============================================================================
// GENERIC CLASS OrderQueue - Queue untuk antrian pesanan
// ============================================================================
class OrderQueue<T> {
  QueueNode<T>? _front;
  QueueNode<T>? _rear;
  int _size = 0;

  // Tambah pesanan ke belakang antrian (enqueue)
  void enqueue(T order) {
    QueueNode<T> newNode = QueueNode<T>(order);
    
    if (_rear == null) {
      _front = _rear = newNode;
    } else {
      _rear!.next = newNode;
      _rear = newNode;
    }
    _size++;
  }

  // Ambil pesanan dari depan antrian (dequeue)
  T? dequeue() {
    if (_front == null) return null;

    T data = _front!.data;
    _front = _front!.next;
    
    if (_front == null) {
      _rear = null;
    }
    _size--;
    return data;
  }

  // Lihat pesanan di depan tanpa menghapus
  T? peek() {
    return _front?.data;
  }

  // Cek apakah queue kosong
  bool get isEmpty => _front == null;

  // Dapatkan ukuran queue
  int get size => _size;

  // Tampilkan semua pesanan dalam antrian
  void displayQueue() {
    if (isEmpty) {
      print('Antrian pesanan kosong.\n');
      return;
    }

    print('\n=== ANTRIAN PESANAN ===');
    QueueNode<T>? current = _front;
    int position = 1;
    
    while (current != null) {
      print('$position. ${current.data}');
      current = current.next;
      position++;
    }
    print('=======================\n');
  }
}

// ============================================================================
// GENERIC CLASS StackNode untuk implementasi Stack
// ============================================================================
class StackNode<T> {
  T data;
  StackNode<T>? next;

  StackNode(this.data);
}

// ============================================================================
// GENERIC CLASS UndoStack - Stack untuk fitur undo transaksi
// ============================================================================
class UndoStack<T> {
  StackNode<T>? _top;
  int _size = 0;

  // Push transaksi ke stack
  void push(T transaction) {
    StackNode<T> newNode = StackNode<T>(transaction);
    newNode.next = _top;
    _top = newNode;
    _size++;
  }

  // Pop transaksi dari stack
  T? pop() {
    if (_top == null) return null;

    T data = _top!.data;
    _top = _top!.next;
    _size--;
    return data;
  }

  // Lihat transaksi teratas tanpa menghapus
  T? peek() {
    return _top?.data;
  }

  // Cek apakah stack kosong
  bool get isEmpty => _top == null;

  // Dapatkan ukuran stack
  int get size => _size;
}

// ============================================================================
// CLASS Transaction - Representasi transaksi yang sudah diproses
// ============================================================================
class Transaction {
  final Order _order;
  final DateTime _transactionTime;
  final String _paymentMethod;

  // Constructor
  Transaction(this._order, this._paymentMethod) 
    : _transactionTime = DateTime.now();

  // Getter methods
  Order get order => _order;
  DateTime get transactionTime => _transactionTime;
  String get paymentMethod => _paymentMethod;

  @override
  String toString() {
    String timeStr = '${_transactionTime.day}/${_transactionTime.month}/${_transactionTime.year} ${_transactionTime.hour}:${_transactionTime.minute.toString().padLeft(2, '0')}';
    return 'Transaksi [$timeStr] - ${_order.toString()} | Pembayaran: $_paymentMethod';
  }
}

// ============================================================================
// CLASS LinkedListNode untuk riwayat transaksi
// ============================================================================
class LinkedListNode<T> {
  T data;
  LinkedListNode<T>? next;

  LinkedListNode(this.data);
}

// ============================================================================
// GENERIC CLASS TransactionHistory - Linked List untuk riwayat transaksi
// ============================================================================
class TransactionHistory<T> {
  LinkedListNode<T>? _head;
  int _size = 0;

  // Tambah transaksi baru di awal linked list
  void addTransaction(T transaction) {
    LinkedListNode<T> newNode = LinkedListNode<T>(transaction);
    newNode.next = _head;
    _head = newNode;
    _size++;
  }

  // Hapus transaksi terakhir (untuk undo)
  T? removeLastTransaction() {
    if (_head == null) return null;

    T data = _head!.data;
    _head = _head!.next;
    _size--;
    return data;
  }

  // Tampilkan semua riwayat transaksi
  void displayHistory() {
    if (_head == null) {
      print('Belum ada riwayat transaksi.\n');
      return;
    }

    print('\n=== RIWAYAT TRANSAKSI ===');
    LinkedListNode<T>? current = _head;
    int count = 1;
    
    while (current != null) {
      print('$count. ${current.data}');
      current = current.next;
      count++;
    }
    print('========================\n');
  }

  // Cek apakah history kosong
  bool get isEmpty => _head == null;

  // Dapatkan ukuran history
  int get size => _size;
}

// ============================================================================
// ABSTRACT CLASS untuk template sistem
// ============================================================================
abstract class SystemTemplate {
  void initializeSystem();
  void displayMenu();
  void processOrder();
}

// ============================================================================
// CLASS UTAMA RestaurantSystem - Mengelola keseluruhan sistem restoran
// ============================================================================
class RestaurantSystem implements SystemTemplate {
  // Instance dari semua struktur data
  late MenuBST _menuBST;
  late OrderQueue<Order> _orderQueue;
  late UndoStack<Transaction> _undoStack;
  late TransactionHistory<Transaction> _transactionHistory;

  // Constructor
  RestaurantSystem() {
    initializeSystem();
  }

  // Inisialisasi sistem dengan menu default
  @override
  void initializeSystem() {
    _menuBST = MenuBST();
    _orderQueue = OrderQueue<Order>();
    _undoStack = UndoStack<Transaction>();
    _transactionHistory = TransactionHistory<Transaction>();

    // Tambah menu default ke BST
    _menuBST.insert(MenuItem(1, 'Sate Ayam', 15000, MenuType.makanan));
    _menuBST.insert(MenuItem(2, 'Sate Kambing', 25000, MenuType.makanan));
    _menuBST.insert(MenuItem(3, 'Gulai', 15000, MenuType.makanan));
    _menuBST.insert(MenuItem(4, 'Es Teh', 3000, MenuType.minuman));
    _menuBST.insert(MenuItem(5, 'Kopi', 4000, MenuType.minuman));
    _menuBST.insert(MenuItem(6, 'Es Jeruk', 5000, MenuType.minuman));
    _menuBST.insert(MenuItem(7, 'Es Kopi', 5000, MenuType.minuman));
  }

  // Tampilkan menu utama CLI
  void showMainMenu() {
    print('\n' + '='*50);
    print('    SISTEM PEMESANAN RESTO SATE MADURA');
    print('='*50);
    print('1. Tampilkan Menu Makanan & Minuman');
    print('2. Tambah Pesanan ke Antrian');
    print('3. Lihat Antrian Pesanan');
    print('4. Proses Pesanan & Pembayaran');
    print('5. Undo Transaksi Terakhir');
    print('6. Lihat Riwayat Transaksi');
    print('7. Keluar Program');
    print('='*50);
  }

  // Implementasi displayMenu dari abstract class
  @override
  void displayMenu() {
    _menuBST.displayMenu();
  }

  // Tambah pesanan baru ke antrian
  void addOrderToQueue() {
    print('\n=== TAMBAH PESANAN BARU ===');
    
    // Input nama pelanggan
    stdout.write('Masukkan nama pelanggan: ');
    String? customerName = stdin.readLineSync();
    if (customerName == null || customerName.trim().isEmpty) {
      print('Nama pelanggan tidak valid!');
      return;
    }

    List<MenuItem> selectedItems = [];
    
    while (true) {
      print('\nPilih menu (masukkan ID menu, atau 0 untuk selesai):');
      _menuBST.displayMenu();
      
      stdout.write('ID Menu: ');
      String? input = stdin.readLineSync();
      
      if (input == null) continue;
      
      try {
        int menuId = int.parse(input);
        
        if (menuId == 0) {
          if (selectedItems.isEmpty) {
            print('Minimal pilih 1 menu!');
            continue;
          }
          break;
        }

        // Cari menu berdasarkan ID menggunakan BST
        MenuItem? menuItem = _menuBST.search(menuId);
        if (menuItem != null) {
          selectedItems.add(menuItem);
          print('✓ ${menuItem.name} ditambahkan ke pesanan');
        } else {
          print('Menu dengan ID $menuId tidak ditemukan!');
        }
      } catch (e) {
        print('Input tidak valid! Masukkan angka.');
      }
    }

    // Buat order baru dan tambahkan ke queue
    Order newOrder = Order(customerName.trim(), selectedItems);
    _orderQueue.enqueue(newOrder);
    
    print('\n✓ Pesanan berhasil ditambahkan ke antrian!');
    print('Order: $newOrder\n');
  }

  // Lihat antrian pesanan saat ini
  void viewOrderQueue() {
    _orderQueue.displayQueue();
  }

  // Implementasi processOrder dari abstract class
  @override
  void processOrder() {
    if (_orderQueue.isEmpty) {
      print('Tidak ada pesanan dalam antrian!\n');
      return;
    }

    // Ambil pesanan dari depan antrian
    Order? orderToProcess = _orderQueue.dequeue();
    if (orderToProcess == null) return;

    print('\n=== PROSES PEMBAYARAN ===');
    print('Pesanan: $orderToProcess');
    
    // Input metode pembayaran
    print('\nPilih metode pembayaran:');
    print('1. Tunai');
    print('2. Kartu Debit');
    print('3. E-Wallet');
    
    stdout.write('Pilihan (1-3): ');
    String? paymentChoice = stdin.readLineSync();
    
    String paymentMethod;
    switch (paymentChoice) {
      case '1':
        paymentMethod = 'Tunai';
        break;
      case '2':
        paymentMethod = 'Kartu Debit';
        break;
      case '3':
        paymentMethod = 'E-Wallet';
        break;
      default:
        paymentMethod = 'Tunai';
    }

    // Buat transaksi baru
    Transaction newTransaction = Transaction(orderToProcess, paymentMethod);
    
    // Simpan ke stack untuk undo dan history
    _undoStack.push(newTransaction);
    _transactionHistory.addTransaction(newTransaction);
    
    print('\n✓ Pembayaran berhasil diproses!');
    print('Transaksi: $newTransaction\n');
  }

  // Undo transaksi terakhir
  void undoLastTransaction() {
    if (_undoStack.isEmpty) {
      print('Tidak ada transaksi yang dapat di-undo!\n');
      return;
    }

    // Pop transaksi dari stack
    Transaction? lastTransaction = _undoStack.pop();
    if (lastTransaction == null) return;

    // Hapus dari history
    _transactionHistory.removeLastTransaction();
    
    // Kembalikan order ke antrian
    _orderQueue.enqueue(lastTransaction.order);
    
    print('\n✓ Transaksi berhasil di-undo!');
    print('Order dikembalikan ke antrian: ${lastTransaction.order}\n');
  }

  // Lihat riwayat transaksi
  void viewTransactionHistory() {
    _transactionHistory.displayHistory();
  }

  // Method utama untuk menjalankan sistem
  void run() {
    print('Selamat datang di Sistem Pemesanan Resto Sate Madura!');
    
    while (true) {
      showMainMenu();
      stdout.write('Pilih menu (1-7): ');
      String? choice = stdin.readLineSync();
      
      switch (choice) {
        case '1':
          displayMenu();
          break;
        case '2':
          addOrderToQueue();
          break;
        case '3':
          viewOrderQueue();
          break;
        case '4':
          processOrder();
          break;
        case '5':
          undoLastTransaction();
          break;
        case '6':
          viewTransactionHistory();
          break;
        case '7':
          print('\nTerima kasih telah menggunakan sistem kami!');
          print('Sampai jumpa di Sate Madura! 🍖');
          return;
        default:
          print('\nPilihan tidak valid! Silakan pilih 1-7.\n');
      }
      
      // Pause sebelum kembali ke menu utama
      print('Tekan Enter untuk melanjutkan...');
      stdin.readLineSync();
    }
  }
}

// ============================================================================
// MAIN FUNCTION - Entry point program
// ============================================================================
void main() {
  // Buat instance sistem restoran dan jalankan
  RestaurantSystem restaurant = RestaurantSystem();
  restaurant.run();
}