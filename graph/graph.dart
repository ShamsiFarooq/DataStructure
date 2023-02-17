import 'dart:collection';
//import 'dart:math';

class Graph {
  Map<int, List<int>> map = HashMap();
  void addVertex(int data) {
    map[data] = [];
  }

  void insert(int vertex, int edge, bool isBidirectional) {
    //bool for checking the vertex is uni or bi directional
    if (!map.containsKey(vertex)) {
      addVertex(
          vertex); //here we adding the the vertex into dart if it is not contain hash map
    }
    if (!map.containsKey(edge)) {
      addVertex(
          edge); //here also checking the edge contains on map if it is not contain the edge also be added on a key.
    }
    map[vertex]?.add(
        edge); //here we adding the edge of the vertex into value in a list form
    if (isBidirectional) {
      map[edge]?.add(
          vertex); //it it is bidirectional we need to add the cross direction that mean need to add the vertex intp value.
    }
  }

  void display() {
    for (int x in map.keys) {
      String result = x.toString() + " -> ";
      for (int y in map[x]!) {
        result = result + y.toString() + " ";
      }
      print(result);
    }
  }

  void dfs(int startVertex) {
    Set<int> visited = Set<int>();
    Queue<int> queue = Queue<int>();
    visited.add(startVertex);
    queue.add(startVertex);
    while (queue.isNotEmpty) {
      int currentVertex = queue.removeFirst();
      print(currentVertex);
      for (var edgeValue in map[currentVertex]!) {
        if (!visited.contains(edgeValue)) {
          queue.add(edgeValue);
          visited.add(edgeValue);
        }
      }
    }
  }

  void bfs(int startVertex) {
    Set<int> visited = Set<int>();
    dfsHelper(startVertex, visited);
  }

  dfsHelper(int startVertex, Set<int> visited) {
    visited.add(startVertex);
    print(startVertex);
    for (var edgeValue in map[startVertex]!) {
      if (!visited.contains(edgeValue)) {
        dfsHelper(edgeValue, visited);
      }
    }
  }
}

void main(List<String> args) {
  Graph graph = Graph();
  graph.insert(5, 3, true);
  graph.insert(5, 4, false);
  graph.insert(4, 7, false);
  graph.insert(7, 8, true);
  graph.insert(8, 10, false);
  graph.display();
  print('Bredth First Search');
  graph.bfs(5);
  print('Depth Firs Search');
  graph.dfs(5);
}
