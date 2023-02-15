void main(List<String> args) {
  List<int> arr = [10, 20, 30, 50, 50, 60, 70, 80];
  int search = 50;

  int low = 0;
  int high = arr.length - 1;

  while (low <= high) {
    int mid = (low + high) ~/ 2;
    print(mid);

    if (arr[mid] == search) {
      print(mid);
      break;
    } else if (arr[mid] < search) {
      low = mid + 1;
    } else {
      high = mid - 1;
    }
  }
}
