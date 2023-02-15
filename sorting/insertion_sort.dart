void main(List<String> args) {
  List<int> arr = [64, 34, 25, 12, 22, 11, 90];

  for (int i = 0; i < arr.length; i++) {
    int key = arr[i];
    int j = i - 1;

    while (j >= 0 && arr[j] > key) {
      arr[j + 1] = arr[j];
      j = j - 1;
    }

    arr[j + 1] = key;
  }
  print('Sorted list :');
  print(arr);
}
