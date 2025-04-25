class Queue {
  int front = 0, rear = 0, size = 0;
  int capacity = 0;
  List<int> array = [];
  void QueueOperation(int capacity) {
    this.capacity = capacity;
    front = size = 0;
    rear = capacity - 1;
    array = List<int>.filled(capacity, 0);
  }

  bool isFull() {
    return (size == capacity);
  }

  bool isEmpty() {
    return (size == 0);
  }

  void enqueue(int item) {
    if (isFull()) return;
    rear = (rear + 1) % capacity;
    array[rear] = item;
    size++;
    print('$item enqueued to queue');
  }

  int dequeue() {
    if (isEmpty()) return -1;
    int item = array[front];
    front = (front + 1) % capacity; 
    size--;
    return item;
  }

  int frontElement() {
    if (isEmpty()) return -1;
    return array[front];
  }

  int rearElement() {
    if (isEmpty()) return -1;
    return array[rear];
  }
}

void main() {
  Queue q = Queue();
  q.QueueOperation(1000);
  q.enqueue(10);
  q.enqueue(20);
  q.enqueue(30);
  q.enqueue(40);
  print('${q.dequeue()} dequeued from queue\n');
  print('Front item is ${q.frontElement()}');
  print('Rear item is ${q.rearElement()}');
}
