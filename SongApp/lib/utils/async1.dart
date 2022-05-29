asyncTask() {
  Future.delayed(Duration(seconds: 10), () {
    print("I will Call After 10 sec");
  });
}

void main(List<String> args) {
  asyncTask();
  print("wrong class");
}
