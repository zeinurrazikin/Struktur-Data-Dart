class Queue {
  List<int> _elements = [];
  int _front = 0;
  int _rear = 0;
  int _maxQueue = 0;
  void QueueOperation(int max) {
    _front = 0;
    _rear = -1;
    _elements = List<int>.filled(max, 0);
    _maxQueue = max - 1;
  }

  bool isEmpty() {
    return _rear == -1 && _front == 0;
  }

  bool isFull() {
    return _rear == _maxQueue - 1;
  }

  void enqueue(int data) {
    if (isFull()) {
      print("Queue Overflow, tidak dapat mengisi data lagi");
    } else {
      _rear += 1;
      _elements[_rear] = data;
    }
  }

  int dequeue() {
    int data = 0;
    if (isEmpty()) {
      print("Queue Underflow");
    } else {
      data = _elements[_front];
      _elements[_front] = 0;
      _front += 1;
    }
    return data;
  }

  void printQueue() {
    if (!isEmpty()) {
      print("Menampilkan urutan dari posisi tertinggi");
      for (int i = _rear; i > -1; i--) {
        print("Elemen ke-$i = ${_elements[i]}");
      }
    } else {
      print("Queue masih kosong");
    }
  }
}

void main() {
  Queue q = Queue();
  q.QueueOperation(100);
  q.enqueue(10);
  q.enqueue(20);
  q.enqueue(30);
  q.dequeue();
  q.printQueue();
}
