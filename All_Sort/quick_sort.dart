void main() {
  List<int> list = [10, 7, 8, 9, 1, 5];
  int n = list.length;

  quickSort(list, 0, n - 1);

  print("Sorted list: $list");
}

void quickSort(List<int> list, int low, int high) {
  if (low < high) {
    int pivot = list[high];
    int i = low - 1;
    for (int j = low; j < high; j++) {
      if (list[j] <= pivot) {
        i++;
        int temp = list[i];
        list[i] = list[j];
        list[j] = temp;
      }
    }
    int temp = list[i + 1];
    list[i + 1] = list[high];
    list[high] = temp;
    int partitionIndex = i + 1;
    quickSort(list, low, partitionIndex - 1);
    quickSort(list, partitionIndex + 1, high);
  }
}
